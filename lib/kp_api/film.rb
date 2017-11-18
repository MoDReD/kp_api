module KpApi
  class Film < Agent
    attr_accessor :id, :url

    def initialize(id)
      @id   = id.to_i
      @url  = "#{DOMAINS[:api]}#{METHODS[:get_film][:method]}?#{METHODS[:get_film][:id]}=#{id}"
      @url2 = "#{DOMAINS[:api]}#{METHODS[:get_staff][:method]}?#{METHODS[:get_staff][:id]}=#{id}"
      @json = json

      unless status
        raise ApiError.new(@json[:message], @json[:data])
      end

    end

    def view
      film_hash(@json).merge(rating).merge(rent).merge(budget)
    end

    def rating
      {
        :rating_good_review             => int_data('ratingData', 'ratingGoodReview', nil),
        :rating_good_review_vote_count  => int_data('ratingData', 'ratingGoodReviewVoteCount'),
        :rating                         => int_data('ratingData', 'rating', nil, Float),
        :rating_vote_count              => int_data('ratingData', 'ratingVoteCount'),
        :rating_await                   => int_data('ratingData', 'ratingAwait', nil),
        :rating_await_count             => int_data('ratingData', 'ratingAwaitCount'),
        :rating_imdb                    => int_data('ratingData', 'ratingIMDb', nil, Float),
        :rating_imdb_vote_count         => int_data('ratingData', 'ratingIMDbVoteCount'),
        :rating_film_critics            => int_data('ratingData', 'ratingFilmCritics', nil),
        :rating_film_critics_vote_count => int_data('ratingData', 'ratingFilmCriticsVoteCount'),
        :rating_rf_critics              => int_data('ratingData', 'ratingRFCritics', nil),
        :rating_fr_critics_vote_count   => int_data('ratingData', 'ratingRFCriticsVoteCount')
      }
    end

    def rent
      {
        :distributors           => str_data('rentData',  'Distributors'),
        :premiere_world_country => str_data('rentData',  'premiereWorldCountry'),
        :distributor_release    => str_data('rentData',  'distributorRelease'),
        :premiere_ru            => time_data('rentData', 'premiereRU'),
        :premiere_world         => time_data('rentData', 'premiereWorld'),
        :premiere_dvd           => time_data('rentData', 'premiereDVD'),
        :premiere_blu_ray       => time_data('rentData', 'premiereBluRay')
      }
    end

    def budget
      {
        :gross_ru    => int_data('budgetData', 'grossRU',    nil),
        :gross_usa   => int_data('budgetData', 'grossUSA',   nil),
        :gross_world => int_data('budgetData', 'grossWorld', nil),
        :budget      => int_data('budgetData', 'budget',     nil)
      }
    end

    def peoples
      unless @json['creators'].nil?
        @json['creators'].map { |items|
          items.map do |item|
            people_hash_old(item)
          end
        }.flatten
      end
    end

    def peoples_full
      json2
      unless @json2['creators'].nil?
        @json2['creators'].map { |items|
          items.map do |item|
            people_hash_old(item)
          end
        }.flatten
      end
    end

    ##########################
    ##########################
    ##########################


    private

      def people_hash_old(item)
        Hash[
          [
            [:id,              item['id'].to_i       ],
            [:kp_type,         item['type']          ],
            [:poster_url,      !item['posterURL'].nil? ? "#{DOMAINS[:kinopoisk][:poster][:name]}_#{item['id']}.jpg" : nil],
            [:name_ru,         item['nameRU']        ],
            [:name_en,         item['nameEN']        ],
            [:description,     item['description']   ],
            [:profession_text, item['professionText']],
            [:profession_key,  item['professionKey'] ]
          ]
        ]
      end

  end
end
