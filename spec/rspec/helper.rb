require "rspec"
require "luna/rspec/formatters/checks"
require "jekyll/post/tags"
require "jekyll"

Dir[File.expand_path("../../support/*.rb", __FILE__)].each do |v|
  require v
end
