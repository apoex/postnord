module Postnord
  class Client

    def initialize(options={})
      @api_version  = options[:api_version]  || Config.api_version
      @api_key      = options[:api_key]      || Config.api_key
      @api_endpoint = options[:api_endpoint] || Config.api_endpoint
      @locale       = options[:locale]       || Config.locale
      @return_type  = if options.has_key?(:return_type)
        options[:return_type]
      else
        Config.return_type
      end
    end

    def do_request(service, endpoint, params={})
      uri = build_uri(service, endpoint)

      params.merge!(
        apikey: @api_key,
        locale: @locale,
      )

      uri.query = URI.encode_www_form(params)

      res = Faraday.get(uri)

      Response.new(res)
    end

    private

    def build_uri(service, endpoint)
      url = @api_endpoint +
      "/" + service +
      "/" + @api_version +
      "/" + endpoint
      url += "." + @return_type if @return_type

      URI(url)
    end
  end
end
