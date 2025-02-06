class Task < ApplicationRecord
  belongs_to :category
  validates :title, :due_date, presence: true

  def progress
    completed ? 100 : 0
  end
end
