# Frozen-String-Literal: true
# Copyright 2016 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

require "jekyll/generator"

module Jekyll
  module Post
    module Tags

      # --
      # @see https://github.com/jekyll/jekyll
      # Generates the sites tags, using Jekyll's
      #   generators this is controlled by them and we don't
      #   really need to do that much after that.
      #
      # @example
      #   ```yaml
      #   # _config.yml
      #   tag_layout: custom_layout
      #   ```
      # --
      class Generator < Jekyll::Generator
        def generate(site)
          # @note this belongs in your `_config.yml`
          key = (site.config["tag_layout"] || "default").chomp(".html")

          if site.layouts.has_key?(key)
            return site.tags.keys.each do |v|
              tag = Doc.new(v, site: site)
              tag.render(site.layouts, site.site_payload)
              tag.write(site.dest)
              site.pages << tag
            end

          # This error should be configurable or removed entirely
          # because at the end of the day if there is no default.html
          # or a specific tag layout, the user knows this...

          else
            Jekyll.logger.error "", "Could not find '#{key}.html' " \
              "Skipping tags."
          end
        end
      end
    end
  end
end
