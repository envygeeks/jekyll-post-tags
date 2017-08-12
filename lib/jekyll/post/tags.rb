# Frozen-String-Literal: true
# Copyright 2015 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

require "jekyll"

module Jekyll
  module Post
    module Tags
      require_relative "tags/drop"
      require_relative "tags/generator"
      require_relative "tags/version"
      require_relative "tags/page"
      require_relative "tags/hook"
    end
  end
end
