require "rspec/helper"
describe Jekyll::Post::Tags do
  before :each do
    silence_stdout do
      stub_jekyll_site.process
    end
  end

  let :base do
    File.expand_path("../../../../fixture/_site", __FILE__)
  end

  it "should generate html pages" do
    expect(Pathname.new(File.join(base, "tag/hello.html"))).to exist
    expect(Pathname.new(File.join(base, "tag/world.html"))).to exist
  end
end
