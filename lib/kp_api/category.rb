module KpApi
  class Category < Agent
    attr_accessor :url

    def initialize(country_id=1)
      @country_id = country_id
      @url  = "#{DOMAINS[:api]}#{METHODS[:navigator_filters  ][:method]}?countryID=#{country_id}"
      @url2 = "#{DOMAINS[:api]}#{METHODS[:get_all_cities_view][:method]}?countryID=#{country_id}"
      @json = json

      unless status
        raise ApiError.new(@json[:message], @json[:data])
      end
    end

    def genres
      h(@json['genre'])
    end

    def countries
      h(@json['country'])
    end

    def cities
      json2

      if @json2['countryName'].nil?
        raise ApiError.new(@json2[:message], @json2[:data])
      else
        @json2['cityData'].map{|city|
          {
            id:   int_data(String, city["cityID"   ]),
            name: str_data(String, city["cityName" ])
          }
        }
      end
    end

    private
      def h(j)
        j.map do |item|
          {
            id:       int_data(String, item["id"      ]),
            name:     str_data(String, item["name"    ]),
            popular:  bool_data(String, item["popular" ])
          }
        end
      end

    #private end
  end
end
