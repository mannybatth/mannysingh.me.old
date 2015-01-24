SampleBlog::Admin.controllers :platforms do
  get :index do
    @title = "Platforms"
    @platforms = Platform.all
    render 'platforms/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'platform')
    @platform = Platform.new
    render 'platforms/new'
  end

  post :create do
    @platform = Platform.new(params[:platform])
    if @platform.save
      @title = pat(:create_title, :model => "platform #{@platform.id}")
      flash[:success] = pat(:create_success, :model => 'Platform')
      params[:save_and_continue] ? redirect(url(:platforms, :index)) : redirect(url(:platforms, :edit, :id => @platform.id))
    else
      @title = pat(:create_title, :model => 'platform')
      flash.now[:error] = pat(:create_error, :model => 'platform')
      render 'platforms/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "platform #{params[:id]}")
    @platform = Platform.find(params[:id])
    if @platform
      render 'platforms/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'platform', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "platform #{params[:id]}")
    @platform = Platform.find(params[:id])
    if @platform
      if @platform.update_attributes(params[:platform])
        flash[:success] = pat(:update_success, :model => 'Platform', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:platforms, :index)) :
          redirect(url(:platforms, :edit, :id => @platform.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'platform')
        render 'platforms/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'platform', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Platforms"
    platform = Platform.find(params[:id])
    if platform
      if platform.destroy
        flash[:success] = pat(:delete_success, :model => 'Platform', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'platform')
      end
      redirect url(:platforms, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'platform', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Platforms"
    unless params[:platform_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'platform')
      redirect(url(:platforms, :index))
    end
    ids = params[:platform_ids].split(',').map(&:strip)
    platforms = Platform.find(ids)
    
    if platforms.each(&:destroy)
    
      flash[:success] = pat(:destroy_many_success, :model => 'Platforms', :ids => "#{ids.to_sentence}")
    end
    redirect url(:platforms, :index)
  end
end
