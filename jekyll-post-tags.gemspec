# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

$:.unshift(File.expand_path("../lib", __FILE__))
require "jekyll/post/tags/version"

Gem::Specification.new do |spec|
  spec.authors = ["Jordon Bedwell"]
  spec.description = "Reusable Post Tags for Jekyll"
  spec.files = %w(Rakefile Gemfile README.md LICENSE) + Dir["lib/**/*"]
  spec.homepage = "http://github.com/envygeeks/jekyll-post-tags"
  spec.version = Jekyll::Post::Tags::VERSION
  spec.summary = "Post Tags for Jekyll"
  spec.email = ["jordon@envygeeks.io"]
  spec.name = "jekyll-post-tags"
  spec.require_paths = ["lib"]
  spec.has_rdoc = false
  spec.license = "MIT"

  spec.add_development_dependency("pry", "~> 0")
  spec.add_development_dependency("rake", "~> 0")
  spec.add_development_dependency("rspec", "~> 3.3")
  spec.add_development_dependency("rubocop", "0.52")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.3")
  spec.add_runtime_dependency("liquid-string-drop", "~> 1.0")
  spec.add_runtime_dependency("jekyll", "~> 3.1")
end
