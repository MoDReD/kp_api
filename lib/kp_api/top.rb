module KpApi
  class Top < Agent
    attr_accessor :url

    def initialize(top_list=nil)
      if !top_list.nil? && !METHODS[:get_top][:types][top_list].nil?
        @type       = METHODS[:get_top][:types][top_list]
        @page       = 1
        gen_url
        @json       = json
        @page_count = @json['pagesCount']
        @all        = nil
      else
        #todo
        raise ArgumentError
      end
    end

    def view
      @json['items'].map do |film|
        film_hash(film,'id')
      end
    end

    def view_all(limit=15)
      if @all.nil?
        all = view
        while @page <= limit && next_page
          all += @json['items'].map do |film|
            film_hash(film,'id')
          end
        end
        @all = all
        @all
      else
        @all
      end
    end

    def ids_all(limit=15)
      view_all(limit).map{|film| film[:id]}
    end

    private

      def gen_url
        @url = [
          "#{DOMAINS[:api]}#{METHODS[:get_top][:method]}",
          "?#{METHODS[:get_top][:type]}=#{@type}",
          "&#{METHODS[:get_top][:page]}=#{@page}"
        ].join('')
      end


  end
end
