module KinopoiskAPI
  class Reviews < Agent
    attr_accessor :id, :url

    def initialize(id)
      @id   = id
      @url  = "#{DOMAINS[:api]}/#{METHODS[:get_reviews][:method]}?#{METHODS[:get_reviews][:id]}=#{id}"
      @json = json
    end

    def all
      {
          pages: pages,
          page: page,
          quantity: quantity,
          reviews: reviews
      }
    end

    def pages
      @json['pagesCount']
    end

    def page
      @json['page']
    end

    def quantity
      {
          reviews: @json['reviewAllCount'],
          good_reviews: @json['reviewPositiveCount'],
          good_reviews_in_percent: @json['reviewAllPositiveRatio'],
          bad_reviews: @json['reviewNegativeCount'],
          neutral_reviews: @json['reviewNeutralCount']
      }
    end

    def reviews
      correctly = []
      json_reviews.each do |item|
        type_array = item['reviewType'].split('_')
        type = type_array.last
        new_item = {
            id: item['reviewID'],
            type: type,
            data: item['reviewData'],
            author: {
                name: item['reviewAutor'],
                avatar: "#{DOMAINS[:kinopoisk][:poster][:gallery]}/#{item['reviewAutorImageURL']}"
            },
            title: item['reviewTitle'],
            description: item['reviewDescription']
        }
        correctly.push(new_item)
      end
      correctly
    end

    private

      def json_reviews
        @json['reviews']
      end

  end
end
