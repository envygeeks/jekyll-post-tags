module Jekyll
  module Tags
    class Generator < Jekyll::Generator
      priority :low; safe true

      def generate(site)
        if site.layouts.has_key?("tag")
          then site.tags.keys.each do |t|
            site.pages.push(
              Post::Tags::Template.new(
                site, t
              )
            )
          end
        end
      end
    end
  end
end
