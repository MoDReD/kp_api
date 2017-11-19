module KpApi
  class LiveSearch < Agent
    attr_accessor :keyword, :url

    def initialize(keyword)
      @keyword = URI.encode(keyword)
      @url     = "#{DOMAINS[:api]}#{METHODS[:search_live][:method]}?#{METHODS[:search_live][:keyword]}=#{@keyword}"
      @json    = json

      unless status
        raise ApiError.new(@json[:message], @json[:data])
      end
    end

    def found?
      !@json['items'].nil?
    end

    def items
      if found?
        @json['items'].map{|item|
          if item['type'] == "KPFilmObject"
            film_hash(item, 'id')
          elsif item['type'] == "KPPeopleObject"
            people_hash(item)
          end
        }.compact
      end
    end


  end
end
