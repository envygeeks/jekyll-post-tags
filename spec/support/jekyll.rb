module Jekyll
  module RSpecHelpers

    # --
    # The path to the fixture directory.
    # @note this is where we store data files.
    # @return [Pathutil] the path.
    # --
    def self.fixture_path
      @path ||= Pathutil.new("spec/fixture").expand_path
    end

    # --
    # @note we don't really use the return.
    # @return [Array<String,String>] the outputs.
    # Silences stdout.
    # --
    def silence_stdout
      oldo, olde = $stdout, $stderr
      $stdout = StringIO.new
      $stderr = StringIO.new
      yield

    ensure
      $stdout = oldo if oldo
      $stderr = olde if olde
    end

    # --
    def stub_jekyll_site(oth_opts = {})
      path = RSpecHelpers.fixture_path

      Jekyll::Site.new(Jekyll.configuration({
        "source" => path.to_s,
        "destination" => path.join(
          "_site").to_s,
      }))
    end

    # --
    def get_stubbed_file(files)
      RSpecHelpers.fixture_path.join("_site",
        *files).read
    end

    def self.cleanup_trash
      %W(.asset-cache .jekyll-metadata _site
      _assets .jekyll-cache).each do |v|
        fixture_path.join(v).rm_rf
      end
    end
  end
end

RSpec.configure do |c|
  c.include Jekyll::RSpecHelpers
  c.before(:each) { Jekyll::RSpecHelpers.cleanup_trash }
  c.after (:each) { Jekyll::RSpecHelpers.cleanup_trash }
end
