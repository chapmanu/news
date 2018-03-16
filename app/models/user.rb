class User < ApplicationRecord
  include ChapmanIdentityLookups
  devise :database_authenticatable, :rememberable, :trackable
  attr_accessor :encrypted_password # used by Devise for :database_authenticatable

  ############################
  # :::   VALIDATIONS    ::: #
  ############################

  validates :first_name,  presence: { message: 'must be present.' }
  validates :last_name,   presence: { message: 'must be present.' }
  validates :email,       presence: { message: 'must be present.' }

  ############################
  # ::: INSTANCE METHODS ::: #
  ############################

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def role_label
    role == "admin" ? "Administrator" : "None"
  end

  def admin?
    role == "admin"
  end
end
