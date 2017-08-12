# Frozen-String-Literal: true
# Copyright 2016 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

require_relative "helpers"
require "liquid/drop/str"

module Jekyll
  module Post
    module Tags

      # --
      # @see https://github.com/envygeeks/liquid-string-drop
      # Provides a string drop that we can wrap directly
      #   back into Jekyll without disrupting the ways users
      #   work, and without disrupting the way Jekyll currently
      #   works with it's own stuff.
      # --
      class Drop < Liquid::Drop::Str
        attr_reader :weight, :site
        extend Forwardable::Extended
        rb_delegate :name, to: :@tag, alias_of: :to_s
        include Helpers

        # --
        def initialize(tag, site:, weight: 1)
          super(tag)

          @site = site
          @weight = weight
          @tag = tag
        end

        # --
        def url
          File.join(*tag_path)
        end

        # --
        # @return [[]] the tags.
        # Loop through tags, set them up and then, pass
        #   them back out.
        # --
        def self.to_tags(site:)
          div = 4.0 / site.tags.values.max_by(&:size).size
          site.tags.each_with_object([]) do |(k, v), o|
            weight = format("%.2f", div * v.size)

            o << new(k, {
              weight: weight.to_f,
              site: site,
            })
          end
        end
      end
    end
  end
end
