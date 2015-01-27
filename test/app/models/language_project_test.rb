require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class LanguageProjectTest < Test::Unit::TestCase
  context "LanguageProject Model" do
    should 'construct new instance' do
      @language_project = LanguageProject.new
      assert_not_nil @language_project
    end
  end
end
