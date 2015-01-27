require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class PlatformProjectTest < Test::Unit::TestCase
  context "PlatformProject Model" do
    should 'construct new instance' do
      @platform_project = PlatformProject.new
      assert_not_nil @platform_project
    end
  end
end
