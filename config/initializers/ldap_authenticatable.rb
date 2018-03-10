module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable

      def authenticate!
        if valid_credentials?("#{username}@chapman.edu", password)
          success! User.create_or_update_from_active_directory(username)
        else
          fail(:invalid_login)
        end
      rescue UnexpectedActiveDirectoryFormat
        fail(:invalid_login)
      rescue ChapmanIdentityNotFound
        user = User.where(email: "#{username}@chapman.edu")
        identity_info = User.lookup_in_active_directory(username)

        fail(:invalid_identity_info)
      end

      private
        def valid_credentials?(email, password)
          ldap = Net::LDAP.new
          ldap.host = 'bind.chapman.edu'
          ldap.port = 389
          ldap.auth email, password
          password.present? && email.present? && ldap.bind
        end

        def email
          params[:user][:email]
        end

        def password
          params[:user][:password]
        end

        def username
          /^([\w]*)@?.*$/.match(email.downcase)[1]
        end
    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)
