module Postnord
  class Response
    attr_reader :code
    def initialize(data)
      @data = data
      @code = data.status
    end

    def data
      JSON.parse(@data.body)
    rescue JSON::ParserError
      @data.body
    end

    def to_h
      {
        code: code,
        data: data,
      }
    end
  end
end
