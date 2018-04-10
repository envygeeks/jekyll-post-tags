# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

require "jekyll/generator"

module Jekyll
  module Post
    module Tags
      class Generator < Jekyll::Generator

        # --
        # Generate the tags.
        # @param site [Jekyll::Site]
        # @return [nil]
        # --
        def generate(site)
          site.config["tags"] ||= {}
          key = site.config["tags"]["layout"] || "tag"
          site.layouts.key?(key) || key = "default" # Main?
          return error(key) unless site.layouts.key?(key)
          site.config["tags"]["layout"] = key
          generate_tags_with(site)
        end

        # --
        # Generate the tags.
        # @param site [Jekyll::Site] the site
        # @see #generate
        # @return [nil]
        # --
        def generate_tags_with(site)
          site.tags.each_key do |v|
            site.pages << (Page.new(v, site: site).tap do |o|
              o.render(site.layouts, site.site_payload); o.write(site.dest)
            end)
          end
        end

        # --
        # Throw an error.
        # @param layout [String]
        # @see #generate
        # @return [nil]
        # --
        def error(layout)
          Jekyll.logger.error "", "Could not find '#{layout}.html' " \
            "Skipping tag generation."
        end
      end
    end
  end
end
