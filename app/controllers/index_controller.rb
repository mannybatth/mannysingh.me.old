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

        js_compression :jsmin
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
