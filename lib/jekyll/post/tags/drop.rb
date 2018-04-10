# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

require_relative "helpers"
require "liquid/drop/str"

module Jekyll
  module Post
    module Tags
      class Drop < Liquid::Drop::Str
        attr_reader :weight, :site
        extend Forwardable::Extended
        rb_delegate :name, to: :@tag, alias_of: :to_s
        include Helpers

        # --
        # New instance.
        # @return [nil]
        # --
        def initialize(tag, site:, weight: 1)
          super(tag)

          @site = site
          @weight = weight
          @tag = tag
        end

        # --
        # The url of the tag.
        # @return [String]
        # --
        def url
          File.join(*tag_path)
        end

        # --
        # Loop through, and return tags.
        # @param site [Jekyll::Site] the site.
        # @note These should return drops?
        # @return [[]] the tags.
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
