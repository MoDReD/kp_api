module KinopoiskAPI
  class Gallery < Agent
    attr_accessor :id, :url

    def initialize(id)
      @id = id
      @url = "#{DOMAINS[:api]}/#{METHODS[:get_gallery][:method]}?#{METHODS[:get_gallery][:id]}=#{id}"
      @json = json
    end

    def all
      correctly = {}
      gallery.each do |items|
        new_items = []
        items.last.each do |item|
          new_item = {
              image: "#{DOMAINS[:kinopoisk][:poster][:gallery]}/#{item['image']}",
              preview: "#{DOMAINS[:kinopoisk][:poster][:gallery]}/#{item['preview']}"
          }
          new_items.push(new_item)
        end
        correctly[items.first] = new_items
      end
      correctly
    end

    def section(name)
      all[name]
    end

    private

    def gallery
      @json['gallery']
    end

  end
end
