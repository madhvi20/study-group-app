class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, presence: true, uniqueness: true

  before_validation :set_default_role
  after_create :make_first_user_admin

  def admin?
    roles.exists?(name: 'Admin')
  end

  def student?
    roles.exists?(name: 'Student')
  end

  private

  def set_default_role
    if roles.empty?
      student_role = Role.find_by(name: 'Student')
      roles << student_role if student_role
    end
  end

  def make_first_user_admin
    if User.count == 1
      admin_role = Role.find_by(name: 'Admin')
      roles << admin_role if admin_role
    end
  end
end