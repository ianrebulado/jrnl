class Task < ApplicationRecord
  belongs_to :category

  validates :task_name, presence: :true
  validates :due_date, presence: :true

  scope :due_today, -> { where(due_date: Date.today) }
end