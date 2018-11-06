class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :update]
  before_action :set_tasks, only: [:index]
  # GET /tasks
  def index
    @task = Task.new
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_back fallback_location: root_path, notice: 'Task was successfully created.'
    else
      redirect_back fallback_location: root_path, notice: "Could not create task: #{@task.errors.full_messages.join(', ')}"
    end
  end

  # PUT/PATCH /tasks/1
  def update
    @task.update(completed: !@task.completed)
    redirect_back fallback_location: root_path, notice: "Task was successfully updated."
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to root_path, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :due_date)
    end

    def set_tasks
      @tasks  = case params[:completed]
                when "completed"
                  Task.completed.ordered
                when "pending"
                  Task.pending.ordered
                else
                  Task.all.ordered
                end
      @tasks  = case params[:due]
                when "due_soon"
                  @tasks.due_soon
                when "due_later"
                  @tasks.due_later
                when "past_due"
                  @tasks.past_due
                when "not_due"
                  @tasks.not_due
                else
                  @tasks
                end
      @tasks  = @tasks.search(params[:term])
      @tasks  = @tasks.paginate(page: params[:page], per_page: 5)
    end
end
