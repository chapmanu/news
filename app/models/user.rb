class User < ApplicationRecord
  devise :database_authenticatable, :trackable
  include ChapmanIdentityLookups

  ############################
  # ::: INSTANCE METHODS ::: #
  ############################

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
