module KinopoiskAPI
  class Similar < Agent
    attr_accessor :id, :url

    def initialize(id)
      @id   = id
      @url  = "#{DOMAINS[:api]}/#{METHODS[:get_similar][:method]}?#{METHODS[:get_similar][:id]}=#{id}&type=#{METHODS[:get_similar][:type]}"
      @json = json
    end

    def all
      correctly = []
      json['items'].each do |items|
        items.each do |item|
          rating_array = item['rating'].delete(' ').split('(')
          new_item = {
              title: {
                  ru: item['nameRU'],
                  en: item['nameEN']
              },
              year: item['year'],
              rating: rating_array.first,
              number_of_rated: rating_array.last.delete(')'),
              poster: "#{DOMAINS[:kinopoisk][:poster][:film]}_#{item['id']}.jpg",
              duration: item['filmLength'],
              countries: item['country'].split(',').map { |country| country.strip },
              genres: item['genre'].split(',').map { |genre| genre.strip }
          }
          correctly.push(new_item)
        end
      end
      correctly
    end

    private

      def items
        @json['items']
      end

  end
end
