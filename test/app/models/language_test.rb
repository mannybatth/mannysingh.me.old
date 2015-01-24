require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class LanguageTest < Test::Unit::TestCase
  context "Language Model" do
    should 'construct new instance' do
      @language = Language.new
      assert_not_nil @language
    end
  end
end
