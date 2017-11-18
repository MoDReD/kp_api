module KpApi
  class GlobalSearch < Agent
    attr_accessor :keyword, :url

    def initialize(keyword)
      @keyword = URI.encode(keyword)
      @url     = "#{DOMAINS[:api]}/#{METHODS[:search_global][:method]}?#{METHODS[:search_global][:keyword]}=#{@keyword}"
      @json    = json
    end

    def films_count
      @json['searchFilmsCountResult']
    end

    def names_count
      @json['searchPeoplesCountResult']
    end

    def youmean
      film_hash(@json['youmean'])
    end

    def films
      @json['searchFilms'].map do |film|
        film_hash(film)
      end
    end

    def peoples
      json['searchPeople'].map do |name|
        people_hash(name)
      end
    end


  end
end
