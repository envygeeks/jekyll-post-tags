# Frozen-String-Literal: true
# Copyright 2015 - 2017 Jordon Bedwell - MIT License
# Encoding: UTF-8

$:.unshift(File.expand_path("../lib", __FILE__))
require "jekyll/post/tags/version"

Gem::Specification.new do |spec|
  spec.authors = ["Jordon Bedwell"]
  spec.description = "Reusable Post Tags for Jekyll"
  spec.files = %W(Rakefile Gemfile README.md LICENSE) + Dir["lib/**/*"]
  spec.homepage = "http://github.com/envygeeks/jekyll-post-tags"
  spec.version = Jekyll::Post::Tags::VERSION
  spec.summary = "Post Tags for Jekyll"
  spec.email = ["jordon@envygeeks.io"]
  spec.name = "jekyll-post-tags"
  spec.require_paths = ["lib"]
  spec.has_rdoc = false
  spec.license = "MIT"

  spec.add_runtime_dependency("jekyll", "~> 3.1")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.3")
  spec.add_development_dependency("rspec", "~> 3.3")
end
