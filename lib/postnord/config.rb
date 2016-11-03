module Postnord
  class Config

    def self.api_key
      (defined? POSTNORD_API_KEY) ? POSTNORD_API_KEY : ''
    end

    def self.api_version
      (defined? POSTNORD_API_VERSION) ? POSTNORD_API_VERSION : 'v1'
    end

    def self.api_endpoint
      (defined? POSTNORD_API_ENDPOINT) ? POSTNORD_API_ENDPOINT : 'https://api2.postnord.com/rest'
    end

    def self.locale
      (defined? POSTNORD_LOCALE) ? POSTNORD_LOCALE : 'en'
    end

    def self.return_type
      (defined? POSTNORD_RETURN_TYPE) ? POSTNORD_RETURN_TYPE : 'json'
    end

  end
end
