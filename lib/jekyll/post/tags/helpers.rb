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
          @tag_layout ||= begin
            layout = site.config["tags"]["layout"].sub(%r!\.html$!, "")
            File.join("_layouts", "#{layout}.html")
          end
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
