$:.unshift(File.expand_path("../lib", __FILE__))
require "jekyll/post/tags/version"

Gem::Specification.new do |spec|
  spec.description = "Assets using Sprockets 3 for your Jekyll 3"
  spec.files = %W(Rakefile Gemfile README.md LICENSE) + Dir["lib/**/*"]
  spec.homepage = "http://github.com/envygeeks/ruby-jekyll3-post-tags/"
  spec.version = Jekyll::Post::Tags::VERSION
  spec.summary = "Post Tags for Jekyll3"
  spec.email = ["jordon@envygeeks.io"]
  spec.name = "jekyll3-post-tags"
  spec.license = "MIT"
  spec.has_rdoc = false
  spec.require_paths = ["lib"]
  spec.authors = ["Jordon Bedwell"]

  spec.add_runtime_dependency("jekyll", "~> 3.0.0.pre.beta7")
  spec.add_development_dependency("envygeeks-coveralls", "~> 1.0")
  spec.add_development_dependency("luna-rspec-formatters", "~> 3.3")
  spec.add_development_dependency("rspec", "~> 3.3")
end
