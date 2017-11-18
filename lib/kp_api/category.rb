module KpApi
  class Category < Agent
    attr_accessor :url

    def initialize
      @url = "#{DOMAINS[:api]}/#{METHODS[:navigator_filters][:method]}"
      @json = json
    end

    def genres
      h(@json['genre'])
    end

    def countries
      h(@json['country'])
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
