class AuthController < BaseController

    post '/auth/:name/callback' do
        auth = request.env['omniauth.auth']
        session[:uid] = auth['uid']
        redirect to('/admin')
    end

    get '/auth/login_failure' do
        flash[:message] = "Login Error" #TODO: show login error
        redirect to('/auth/identity')
    end

    get '/auth/logout' do
        session.clear
        redirect to('/')
    end

end
