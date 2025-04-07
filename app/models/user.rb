class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :role, presence: true, inclusion: { in: ['Admin', 'Student'] }
  validates :email, presence: true, uniqueness: true

  before_validation :set_default_role
  after_create :make_first_user_admin

  def admin?
    role == 'Admin'
  end

  def student?
    role == 'Student'
  end

  private

  def set_default_role
    self.role ||= 'Student'
  end

  def make_first_user_admin
    if User.count == 1
      update_column(:role, 'Admin')
    end
  end
end