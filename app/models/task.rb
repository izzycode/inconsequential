class Task < ApplicationRecord
  validates :description, presence: true
  has_many :sub_tasks, dependent: :destroy

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :ordered, -> { order(due_date: :asc) }

  def due_soon?
    due_date && due_date.future? && due_date < 1.week.from_now.to_date
  end

  def due_later?
    due_date && due_date >= 1.week.from_now.to_date
  end

  def past_due?
    due_date && due_date.past?
  end

  def not_due?
    due_date.nil?
  end
end
