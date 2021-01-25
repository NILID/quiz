class User < ApplicationRecord
  audited

  enum role: %i[user moderator admin]

  after_initialize :set_default_role, :if => :new_record?

  validates :email,
            :login, uniqueness: true
  validates :login, presence:   true,
                    uniqueness: true,
                    exclusion:  { in: LOGIN_BLACKLIST },
                    length:     { in: 3..12 },
                    format:     { with: /\A[A-Za-z0-9_]+\z/ }


  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
