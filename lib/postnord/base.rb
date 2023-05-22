module Postnord
  class Base
    class MissingMandatoryParameters < StandardError; end

    def self.call(params)
      validate_params(params)

      client.do_request(service, endpoint, params)
    end

    def self.client
      @client ||= Client.new(options)
    end

    private

    def self.validate_params(params)
      missing_params = (mandatory_params - params.keys.map(&:to_s))

      unless missing_params.empty?
        fail MissingMandatoryParameters, missing_params
      end
    end

    def self.action
      self.name.split("::").last.tap { |e| e[0] = e[0].downcase }
    end

    def self.mandatory_params
      fail NotImplementedError, "mandatory_params"
    end

    def self.endpoint
      fail NotImplementedError, "endpoint"
    end

    def self.options
      {}
    end
  end
end
