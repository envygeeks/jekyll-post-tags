# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

require_relative "helpers"

module Jekyll
  module Post
    module Tags

      # --
      # Provides the base page for all tags that get built,
      #   this is mostly modeled after Jekyll's own pages, posts
      #   documents and otherwise.
      # --
      class Page < Jekyll::Page
        attr_accessor :site, :base, :tag, :dir, :name
        include Helpers

        # --
        # Initialize a new instance.
        # @return [Page]
        # --
        def initialize(tag, site:)
          @site = site
          @tag = tag
          @base = site.source
          @dir, @name = tag_path
          process_tag_template
          setup_defaults
        end

        # --
        # Since this class is dynamic, and it's path being
        #   dynamic too, we provide a "realpath" method so that
        #   anything using Git, or otherwise can determine
        #   what the actual path is.
        # @return [String]
        # --
        def realpath
          @site.tags[@tag].sort_by do |v|
            v.data["date"]
          end.first.relative_path
        end

        # --
        # Pull out the base data from within the layout.
        # Most of the time this will simply just be empty.
        # @return [Hash]
        # --
        private
        def process_tag_template
          read_yaml(@base, tag_layout)
          process(@name)
        end

        # --
        # Set the defaults.
        # --
        private
        def setup_defaults
          @data["type"] = "tag"
          @data["description"] ||= "Post Tag: #{@tag}"
          @data["title"] ||= "Post Tag: #{@tag}"
          @data["tag"] = @tag
        end
      end
    end
  end
end
