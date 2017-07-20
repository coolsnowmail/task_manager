class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :email, uniqueness: true
  enum role: { 'admin' => 1, 'user' => 2 }
  validates :role, inclusion: { in: User.roles.keys }
end
