require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class PlatformTest < Test::Unit::TestCase
  context "Platform Model" do
    should 'construct new instance' do
      @platform = Platform.new
      assert_not_nil @platform
    end
  end
end
