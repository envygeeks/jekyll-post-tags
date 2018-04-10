# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

$:.unshift(File.expand_path("../lib", __FILE__))
require "jekyll/post/tags/version"

Gem::Specification.new do |s|
  s.authors = ["Jordon Bedwell"]
  s.description = "Reusable Post Tags for Jekyll"
  s.files = %w(Rakefile Gemfile README.md LICENSE) + Dir["lib/**/*"]
  s.homepage = "http://github.com/envygeeks/jekyll-post-tags"
  s.version = Jekyll::Post::Tags::VERSION
  s.summary = "Post Tags for Jekyll"
  s.email = ["jordon@envygeeks.io"]
  s.name = "jekyll-post-tags"
  s.require_paths = ["lib"]
  s.has_rdoc = false
  s.license = "MIT"

  s.required_ruby_version = ">= 2.4.0"
  s.add_runtime_dependency("jekyll", "~> 3.1")
  s.add_development_dependency("rake", "~> 0")
  s.add_development_dependency("simplecov", "~> 0.16")
  s.add_development_dependency("luna-rspec-formatters", "~> 3.3")
  s.add_runtime_dependency("liquid-string-drop", "~> 1.0")
  s.add_development_dependency("rspec", "~> 3.3")
  s.add_development_dependency("rubocop", "0.52")
  s.add_development_dependency("pry", "~> 0")
end
