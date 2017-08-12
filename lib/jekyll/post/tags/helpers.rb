# Frozen-String-Literal: true
# Copyright 2016 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

module Jekyll
  module Post
    module Tags
      module Helpers

        # --
        # Provides the layout path.
        # --
        private
        def tag_layout
          return @tag_layout ||= begin
            File.join("_layouts", (site.config["tag_layout"] \
              ||= "default.html").gsub(/^_layouts\//, ""))
          end
        end

        # --
        # Provide the write path to the tag.
        # @return [Array<Base,Path>]
        # --
        private
        def tag_path
          return @tag_path ||= begin
            path = @site.config["tag_path"] || "/tag/:tag.html"
            path = path.sub(":tag", @tag).split("/")
            unless path.last =~ /\.html$/
              path << "/index.html"
            end

            [
              path[0...-1].join("/"),
              path.last
            ]
          end
        end
      end
    end
  end
end
