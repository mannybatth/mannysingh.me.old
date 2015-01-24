require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class LibraryTest < Test::Unit::TestCase
  context "Library Model" do
    should 'construct new instance' do
      @library = Library.new
      assert_not_nil @library
    end
  end
end
