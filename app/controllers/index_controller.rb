class IndexController < ApplicationController

    get '/' do
        redirect to("/index.html")
    end

    get '/index.html' do
        erb :index
    end

end
