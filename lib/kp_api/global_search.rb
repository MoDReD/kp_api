module KpApi
  class GlobalSearch < Agent
    attr_accessor :keyword, :url

    def initialize(keyword)
      @keyword = URI.encode(keyword)
      @url     = "#{DOMAINS[:api]}#{METHODS[:search_global][:method]}?#{METHODS[:search_global][:keyword]}=#{@keyword}"
      @json    = json

      unless status
        raise ApiError.new(@json[:message], @json[:data])
      end
    end

    def found?
      films_count != 0  || peoples_count != 0
    end

    def films_count
      if @json['searchFilmsCountResult'].nil?
        0
      else
        @json['searchFilmsCountResult']
      end
    end

    def peoples_count
      if @json['searchPeoplesCountResult'].nil?
        0
      else
        @json['searchPeoplesCountResult']
      end
    end

    def youmean
      film_hash(@json['youmean'], 'id')
    end

    def films
      unless @json['searchFilms'].nil?
        @json['searchFilms'].map do |film|
          film_hash(film, 'id')
        end
      end
    end

    def peoples
      unless @json['searchPeople'].nil?
        @json['searchPeople'].map do |name|
          people_hash(name)
        end
      end
    end


  end
end
