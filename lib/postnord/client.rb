module Postnord
  class Client
    POSTNORD_API_KEY = ''
    POSTNORD_API_VERSION = 'v1'
    POSTNORD_API_ENDPOINT = 'https://api2.postnord.com/rest'
    POSTNORD_LOCALE = 'en'
    POSTNORD_RETURN_TYPE = 'json'

    def initialize(options={})
      @api_version = options[:api_version] || POSTNORD_API_VERSION
      @api_key = options[:api_key] || POSTNORD_API_KEY
      @locale = options[:locale] || POSTNORD_LOCALE || 'en'
      @returntype = options[:returntype] || POSTNORD_RETURN_TYPE || 'json'
    end

    def do_request(service, endpoint, params={})
      uri = build_uri(service, endpoint)

      params.merge!(
        apikey: POSTNORD_API_KEY,
        locale: POSTNORD_LOCALE,
      )

      uri.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(uri)

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(req)
      end

      JSON.parse(res.body)
    end

    private

    def build_uri(service, endpoint)
      URI(
        POSTNORD_API_ENDPOINT +
        '/' + service +
        '/' + POSTNORD_API_VERSION +
        '/' + endpoint +
        '.' + POSTNORD_RETURN_TYPE
      )
    end
  end
end
