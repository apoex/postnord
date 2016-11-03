module Postnord
  class Client

    def initialize(options={})
      @api_version  = options[:api_version]  || Config.api_version
      @api_key      = options[:api_key]      || Config.api_key
      @api_endpoint = options[:api_endpoint] || Config.api_endpoint
      @locale       = options[:locale]       || Config.locale
      @return_type  = options[:return_type]  || Config.return_type
    end

    def do_request(service, endpoint, params={})
      uri = build_uri(service, endpoint)

      params.merge!(
        apikey: @api_key,
        locale: @locale,
      )

      uri.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(uri)

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(req)
      end

      Response.new(res)
    end

    private

    def build_uri(service, endpoint)
      URI(
        @api_endpoint +
        '/' + service +
        '/' + @api_version +
        '/' + endpoint +
        '.' + @return_type
      )
    end
  end
end
