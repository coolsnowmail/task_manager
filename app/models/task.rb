class Task < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  validates :name, presence: true
  enum state: { 'new task' => 1, 'start' => 2, 'finished' => 3 }
  validates :state, inclusion: { in: Task.states.keys }
end
