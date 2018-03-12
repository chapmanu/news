module ChapmanIdentityLookups
  extend ActiveSupport::Concern

  class_methods do
    def create_or_update_from_active_directory(username)
      data = lookup_in_active_directory(username)
      user = where(email: data['email']).first_or_initialize
      user.first_name = data['firstname']
      user.last_name  = data['lastname']
      user.username   = data['username']
      user.save
      user
    end

    def lookup_in_active_directory(username)
      data = JSON.parse(request(username))
      raise MissingIdentityInfo unless valid_identity_info?(data)
      data
    end

    private

      # In order to create a user in the database, Chapman Identity Service
      # must return at least a non-empty email, username, firstname and lastname
      def valid_identity_info?(info)
        %w(email firstname lastname username).all? { |key| info.has_key?(key) && info[key].present? }
      end

      def request(username)
        api_base_url = Rails.application.secrets.chapman_identities_base_url
        api_user     = Rails.application.secrets.chapman_identities_username
        api_password = Rails.application.secrets.chapman_identities_password

        # Get rid of the @chapman part of the email if they have it
        username = URI::escape(username.gsub(/@chapman\.edu|@mail\.chapman\.edu/, ''))
        uri  = URI.parse(api_base_url + username)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)
        request.basic_auth(api_user, api_password)
        response = http.request(request)

        # Couldn't find the user at all
        raise ChapmanIdentityNotFound if response.code != "200"
        response.body
      end
  end
end

# Custom Error Classes
# Only thrown by this module
class MissingIdentityInfo < StandardError; end
class ChapmanIdentityNotFound < StandardError; end
