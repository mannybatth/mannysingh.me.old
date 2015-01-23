class AdminController < BaseController

    get '/admin' do
        erb :admin
    end

    #Post management

    get '/admin/create' do
        @post = Post.new

        erb :create
    end

    get '/admin/edit/:ref' do
        @post = Post.where(:ref => params[:ref]).first

        erb :create
    end

    post '/admin/submit' do
        ref = params[:ref].strip
        title = params[:title].strip_tags
        content = params[:content]

        target_post = nil

        if ref.empty?
            target_post = Post.new
        else
            target_post = Post.where(:ref => ref).first
        end

        target_post.title = title
        target_post.markup = content

        target_post.user = @session.user

        target_post.save

        redirect to('/')
    end

    #User management

    get '/admin/add_user' do
        @user = User.new

        erb :user
    end

    get '/admin/edit_user/:user_name' do
        @user = User.where(:user_name => params[:user_name]).first

        erb :user
    end

    post '/admin/submit_user' do
        prev_user_name = params[:prev_user_name].strip
        user_name = params[:user_name].strip_tags
        display_name = params[:display_name].strip_tags
        password = params[:password].strip

        target_user = nil

        if prev_user_name.empty?
            target_user = User.new
        else
            target_user = User.where(:user_name => prev_user_name).first
        end

        target_user.user_name = user_name
        target_user.display_name = display_name

        target_user.password = password if !password.empty?

        target_user.save

        redirect to('/admin')
    end

    get '/admin/delete_user/:user_name' do
        if User.count > 1
            @target = User.where(:user_name => params[:user_name]).first
            @target.delete if @target != nil
        end

        redirect to('/admin')
    end

end
