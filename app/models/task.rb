class Task < ApplicationRecord
  validates :description, presence: true
  has_many :sub_tasks, dependent: :destroy

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
end
