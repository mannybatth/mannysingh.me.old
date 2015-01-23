class IndexController < BaseController

    assets do
        serve '/js', :from => '../assets/js'
        serve '/css', :from => '../assets/css'
        serve '/img', :from => '../assets/img'
        serve '/fonts', :from => '../assets/fonts'

        js :app, [
            '/js/jquery.js',
            '/js/bootstrap.min.js'
            ]

        css :app, [
            '/css/bootstrap.min.css',
            '/css/stylish-portfolio.css',
            '/css/font-awesome/css/font-awesome.min.css',
            '/css/styles.css'
            ]

        js_compression :uglify
        css_compression :sass
        prebuild true
    end

    get '/' do
        redirect to("/index.html")
    end

    get '/index.html' do
        erb :index
    end

    #Auth
    post '/auth/:name/callback' do
        auth = request.env['omniauth.auth']
        session[:uid] = auth['uid']
        redirect '/admin'
    end

    get '/auth/login_failure' do
        flash[:message] = "Login Error" #TODO: show login error
        redirect '/auth/identity'
    end

    get '/auth/logout' do
        session.clear
        redirect '/'
    end

end

class OmniAuth::Strategies::Identity
    alias :original_other_phase :other_phase
    def other_phase
        if on_registration_path? && request.get?
            status 404
        else
            original_other_phase
        end
    end
end
