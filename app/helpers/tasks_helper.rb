module TasksHelper
  def badge_class_for(task)
    if task.due_later?
      "badge badge-success"
    elsif task.due_soon?
      "badge badge-warning"
    elsif task.past_due?
      "badge badge-danger"
    else
      ""
    end
  end
end
