module KpApi
  class ApiError < StandardError

    def initialize(message, data)
      super(message)
      @data = data
    end
    attr_reader :data

    def code
      @data[:code]
    end

    def body
      @data[:body]
    end


  end
end
