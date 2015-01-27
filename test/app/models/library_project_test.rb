require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class LibraryProjectTest < Test::Unit::TestCase
  context "LibraryProject Model" do
    should 'construct new instance' do
      @library_project = LibraryProject.new
      assert_not_nil @library_project
    end
  end
end
