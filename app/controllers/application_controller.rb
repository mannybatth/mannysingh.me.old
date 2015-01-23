require 'bundler'
require 'rss/maker'
require 'digest/sha1'
require 'rack-flash'
Bundler.require(:default)

class ApplicationController < Sinatra::Base

    helpers ApplicationHelpers

    enable :sessions
    use Rack::Flash
    use OmniAuth::Builder do
        provider :identity, :fields => [:email]
    end

    OmniAuth.config.on_failure do |env|
        if env['omniauth.error']
            error_type   = CGI::escape(env['omniauth.error'].error)
            error_reason = CGI::escape(env['omniauth.error'].error_reason)
            endpoint =
                "/auth/login_failure?error_type=#{error_type}&error_reason=#{error_reason}"
        else
            endpoint = '/auth/login_failure'
        end
        [302, {'Location' => endpoint, 'Content-Type'=> 'text/html'}, []]
    end

    register Sinatra::AssetPack
    assets do
        serve '/js', :from => 'app/assets/js'
        js :application, [
            '/js/jquery.js',
            '/js/bootstrap.min.js'
            ]

        serve '/css', :from => 'app/assets/css'
        css :application, [
            '/css/bootstrap.min.css',
            '/css/stylish-portfolio.css',
            '/css/font-awesome/css/font-awesome.min.css',
            '/css/styles.css'
            ]

        serve '/img', :from => 'app/assets/img'
        serve '/fonts', :from => 'app/assets/fonts'
        js_compression :jsmin
        css_compression :sass
    end

    set :views, Proc.new { File.join(root, "app/views") }

    before do
        protected! if request.path_info.start_with?("/admin")
    end

end
