MannySinghMe::Admin.controllers :languages do
  get :index do
    @title = "Languages"
    @languages = Language.all
    render 'languages/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'language')
    @language = Language.new
    render 'languages/new'
  end

  post :create do
    @language = Language.new(params[:language])
    if @language.save
      @title = pat(:create_title, :model => "language #{@language.id}")
      flash[:success] = pat(:create_success, :model => 'Language')
      params[:save_and_continue] ? redirect(url(:languages, :index)) : redirect(url(:languages, :edit, :id => @language.id))
    else
      @title = pat(:create_title, :model => 'language')
      flash.now[:error] = pat(:create_error, :model => 'language')
      render 'languages/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "language #{params[:id]}")
    @language = Language.find(params[:id])
    if @language
      render 'languages/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'language', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "language #{params[:id]}")
    @language = Language.find(params[:id])
    if @language
      if @language.update_attributes(params[:language])
        flash[:success] = pat(:update_success, :model => 'Language', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:languages, :index)) :
          redirect(url(:languages, :edit, :id => @language.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'language')
        render 'languages/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'language', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Languages"
    language = Language.find(params[:id])
    if language
      if language.destroy
        flash[:success] = pat(:delete_success, :model => 'Language', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'language')
      end
      redirect url(:languages, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'language', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Languages"
    unless params[:language_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'language')
      redirect(url(:languages, :index))
    end
    ids = params[:language_ids].split(',').map(&:strip)
    languages = Language.find(ids)
    
    if languages.each(&:destroy)
    
      flash[:success] = pat(:destroy_many_success, :model => 'Languages', :ids => "#{ids.to_sentence}")
    end
    redirect url(:languages, :index)
  end
end
