module Postnord
  class Response
    def initialize(data)
      @data = data
      @code = data.code
      @status = data.msg
    end

    def code
      @data.code
    end

    def status
      @data.status
    end

    def data
      JSON.parse(@data.body)
    rescue JSON::ParserError
      @data.body
    end

    def to_h
      {
        code: @code,
        status: @status,
        data: data,
      }
    end
  end
end
