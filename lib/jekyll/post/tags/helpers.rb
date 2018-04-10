# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

module Jekyll
  module Post
    module Tags
      module Helpers

        # --
        # Provides the layout path.
        # --
        private
        def tag_layout
          @tag_layout ||= File.join("_layouts", site.config["tags"]["layout"])
        end

        # --
        # Provide the write path to the tag.
        # @return [Array<Base,Path>]
        # --
        private
        def tag_path
          @tag_path ||= begin
            path = @site.config["tags"]["path"] || "/tag/:tag.html"
            path = path.sub(":tag", @tag).split("/")
            unless path.last =~ %r!\.html$!
              path << "/index.html"
            end

            [
              path[0...-1].join("/"),
              path.last,
            ]
          end
        end
      end
    end
  end
end
