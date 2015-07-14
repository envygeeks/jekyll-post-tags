module Jekyll
  class Post
    module Tags
      class Template < Jekyll::Page
        attr_accessor :site, :base, :tag, :dir, :name, :tag_layout

        def initialize(site, tag)
          @site = site
          @tag = tag
          @base = site.source
          @dir, @name = tag_path
          @tag_layout = "tag.html"
          process_tag_template
          setup_defaults
        end

        def regenerate?
          @site.posts.any? do |v|
            @site.regenerator.regenerate?(v)
          end
        end

        def write(*a)
          if regenerate?
            super
          end
        end

        def render(*a)
          if regenerate?
            super
          end
        end

        private
        def process_tag_template
          base = File.join(@base, @site.config["layouts"])
          read_yaml(base, @tag_layout)
          process(@name)
        end

        private
        def tag_path
          pth = @site.config["tag_permalink"] ||= "tag/:tag"
          pth = pth.sub(":tag", @tag).gsub(/\A\//, "").split(
            "/"
          )

          unless pth[-1] =~ /\.html$/
            pth[-1] = "#{pth[-1]}.html"
          end

          [
            pth[0...-1].join("/"),
            pth.last
          ]
        end

        private
        def setup_defaults
          @data["title"] ||= "Tag: #{@tag}"
          @data["description"] ||= "Tag: #{@tag}"
          @data["tag"] = @tag
        end
      end
    end
  end
end
