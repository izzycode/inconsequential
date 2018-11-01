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
      redirect_to root_path(completed: params[:completed], due: params[:due]), notice: 'Task was successfully created.'
    else
      redirect_to root_path(completed: params[:completed], due: params[:due]), notice: "Could not create task: #{@task.errors.full_messages.join(', ')}"
    end
  end

  def update
    @task.update(completed: !@task.completed)
    redirect_to root_path(completed: params[:completed], due: params[:due]), notice: "Task was successfully updated."
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to root_path(completed: params[:completed], due: params[:due]), notice: 'Task was successfully destroyed.'
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
                when "true"
                  Task.completed.ordered
                when "false"
                  Task.pending.ordered
                else
                  Task.all.ordered
                end
      @tasks  = case params[:due]
                when "soon"
                  @tasks.due_soon
                when "later"
                  @tasks.due_later
                when "past"
                  @tasks.past_due
                when "not"
                  @tasks.not_due
                else
                  @tasks
                end
    end
end
