class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable
  include ChapmanIdentityLookups
  attr_accessor :encrypted_password # used by Devise for :database_authenticatable

  ############################
  # ::: INSTANCE METHODS ::: #
  ############################

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def role_label
    role.nil? ? "None" : role
  end
end
