module KpApi
  class FilmSearch < Agent
    attr_accessor :keyword, :url

    def initialize(keyword)
      @keyword = URI.encode(keyword)
      @page = 1
      gen_url
      @json = json
      @page_count = @json['pagesCount']
    end

    def found?
      @page_count != 0
    end

    def films_count
      @json['searchFilmsCountResult']
    end

    def view
      @json['searchFilms'].map do |film|
        film_hash(film, 'id')
      end
    end

    private

      def gen_url
        @url = [
          "#{DOMAINS[:api]}#{METHODS[:search_film][:method]}",
          "?#{METHODS[:search_film][:keyword]}=#{@keyword}",
          "&#{METHODS[:search_film][:page]}=#{@page}"
        ].join('')
      end

  end
end
