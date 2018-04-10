# Frozen-string-literal: true
# Copyright: 2016 - 2018 - MIT License
# Author: Jordon Bedwell
# Encoding: utf-8

require "rspec/helper"
describe Jekyll::Post::Tags do
  let :site do
    stub_jekyll_site
  end

  #

  before :each do |e|
    unless e.metadata[:site]
      silence_stdout do
        stub_jekyll_site.process
      end
    end
  end

  #

  before :each do |e|
    if e.metadata[:site]
      silence_stdout do
        site.process
      end
    end
  end

  #

  it "should generate html pages" do
    path = Jekyll::RSpecHelpers.fixture_path.join("_site/tag")
    expect(path.join("hello.html")).to exist
    expect(path.join("world.html")).to exist
  end

  #

  describe "Jekyll", site: true do
    describe "Document" do
      describe "#data['tags']" do
        it "should make all tags a drop" do
          expect(site.posts.docs).to_not be nil

          site.posts.docs.each do |v|
            v.data["tags"].each do |k|
              expect(k).to be_a Jekyll::Post::Tags::Drop
            end
          end
        end
      end
    end

    #

    describe "Site" do
      describe "#tags" do
        it "should have all keys that are drops" do
          site.tags.each_key do |k|
            expect(k).to be_a Jekyll::Post::Tags::Drop
          end
        end
      end
    end
  end
end
