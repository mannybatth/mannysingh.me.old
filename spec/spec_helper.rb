
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
RACK_ENV = Padrino.env unless defined?(RACK_ENV)
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

RSpec.configure do |config|
  
  config.before(:suite) { DataMapper.auto_migrate! }

end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app MannySinghMe::App
#   app MannySinghMe::App.tap { |a| }
#   app(MannySinghMe::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
