class User < ApplicationRecord
  audited

  enum role: %i[user moderator admin]

  after_initialize :set_default_role, :if => :new_record?

  validates :email, uniqueness: true

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
