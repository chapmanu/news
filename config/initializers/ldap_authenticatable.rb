module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable

      def authenticate!
        if valid_credentials?(username, password)
          success! User.create_or_update_from_active_directory(username)
        else
          fail(:invalid_login)
        end
      # User credentials were correct, but AD either did not find them
      # or they're missing: email, username, first or lastname
      rescue MissingIdentityInfo, ChapmanIdentityNotFound
        fail(:invalid_identity_info)
      end

      private
        # Must be email address, username alone doesn't work
        def valid_credentials?(username, password)
          email = "#{username}@chapman.edu"
          ldap = Net::LDAP.new
          ldap.host = 'bind.chapman.edu'
          ldap.port = 389
          ldap.auth email, password
          password.present? && email.present? && ldap.bind
        end

        def password
          params[:user][:password]
        end

        # Accommodates both username and email as input
        def username
          /^([\w]*)@?.*$/.match(params[:user][:username].downcase)[1]
        end
    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)
