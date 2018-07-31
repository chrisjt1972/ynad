module OAuth
  module YNAB
    class Client
      include HTTParty

      def authorization_url
        if Rails.env.production?
          "#{ynab_base_url}/oauth/authorize?client_id=#{ynab_client_id}"\
            "&redirect_uri=#{redirect_uri}&response_type=code"
        elsif Rails.env.development?
          # Redirect URI would be `localhost:3000/callbacks`
          # YNAB auth token will be set in callbacks controller.
          # Setting of the YNAB auth token requires ENV['YNAB_DEV_AUTH_TOKEN']
          # to be set.
          redirect_uri
        end
      end

      def fetch_access_token(code)
        HTTParty.post(
          "#{ynab_base_url}/oauth/token?client_id=#{ynab_client_id}"\
            "&client_secret=#{ynab_client_secret}&redirect_uri=#{redirect_uri}"\
            "&grant_type=authorization_code&code=#{code}"
        )
      end

      private

      def ynab_base_url
        Settings.ynab_base_url
      end

      def ynab_client_id
        Settings.ynab_client_id
      end

      def redirect_uri
        "#{Settings.base_url}/#{Settings.redirect_uri}"
      end

      def ynab_client_secret
        Settings.ynab_client_secret
      end
    end
  end
end
