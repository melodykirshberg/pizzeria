class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ROLES = %w[owner chef].freeze

  validates :role, inclusion: { in: ROLES }
  before_validation :set_default_role, on: :create

  def has_role?(role_name)
    role.present? && role.to_s == role_name.to_s
  end

  def owner?
    role == "owner"
  end

  def chef?
    role == "chef"
  end

  private

  def set_default_role
    self.role ||= "chef"
  end
end
