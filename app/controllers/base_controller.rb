require 'bundler'
require 'rss/maker'
require 'digest/sha1'
require 'rack-flash'
Bundler.require(:default)

class BaseController < Sinatra::Base

    helpers BaseHelpers
    register Sinatra::AssetPack
    enable :sessions
    use Rack::Flash

    class OmniAuth::Strategies::Identity
        alias :original_other_phase :other_phase
        def other_phase
            if on_registration_path? && request.get?
                redirect '/auth/identity'
            else
                original_other_phase
            end
        end
    end

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

    set :views, Proc.new { File.join(root, "../views") }

end
