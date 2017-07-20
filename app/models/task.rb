class Task < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  enum state: { 'new task' => 1, 'start' => 2, 'finished' => 3 }
  validates :state, inclusion: { in: Task.states.keys }
end
