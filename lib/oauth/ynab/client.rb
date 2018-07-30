module OAuth
  module YNAB
    class Client
      include HTTParty

      def authorization_url
        "#{ynab_base_url}/oauth/authorize?client_id=#{ynab_client_id}"\
          "&redirect_uri=#{redirect_uri}&response_type=code"
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
