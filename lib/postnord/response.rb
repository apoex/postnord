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
      if @code == "200"
        JSON.parse(@data.body)
      else
        @data.body
      end
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
