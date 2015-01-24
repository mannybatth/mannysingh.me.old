require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class SampleBlog::App::ProjectsHelperTest < Test::Unit::TestCase
  context "SampleBlog::App::ProjectsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend SampleBlog::App::ProjectsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
