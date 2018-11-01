class Task < ApplicationRecord
  validates :description, presence: true
  has_many :sub_tasks, dependent: :destroy
end
