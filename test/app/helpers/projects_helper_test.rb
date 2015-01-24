require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class MannySinghMe::App::ProjectsHelperTest < Test::Unit::TestCase
  context "MannySinghMe::App::ProjectsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend MannySinghMe::App::ProjectsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
