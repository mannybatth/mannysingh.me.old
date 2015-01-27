MannySinghMe::Admin.controllers :projects do
  get :index do
    @title = "Projects"
    @projects = Project.all
    render 'projects/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'project')
    @project = Project.new
    @languages_list = Language.all
    @libraries_list = Library.all
    @platforms_list = Platform.all
    render 'projects/new'
  end

  post :create do
    selected_languages = params[:project][:languages]
    selected_libraries = params[:project][:libraries]
    selected_platforms = params[:project][:platforms]
    params[:project].delete('languages')
    params[:project].delete('libraries')
    params[:project].delete('platforms')
    @project = Project.new(params[:project])
    @project.languages = Language.all(:id => selected_languages)
    @project.libraries = Library.all(:id => selected_libraries)
    @project.platforms = Platform.all(:id => selected_platforms)
    if @project.save
      @title = pat(:create_title, :model => "project #{@project.id}")
      flash[:success] = pat(:create_success, :model => 'Project')
      params[:save_and_continue] ? redirect(url(:projects, :index)) : redirect(url(:projects, :edit, :id => @project.id))
    else
      @title = pat(:create_title, :model => 'project')
      flash.now[:error] = pat(:create_error, :model => 'project')
      render 'projects/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "project #{params[:id]}")
    @project = Project.get(params[:id])
    @selected_languages = []
    @selected_libraries = []
    @selected_platforms = []
    @project.libraries.each do |library|
      @selected_libraries << library.id
    end
    @project.languages.each do |language|
      @selected_languages << language.id
    end
    @project.platforms.each do |platform|
      @selected_platforms << platform.id
    end
    @languages_list = Language.all
    @libraries_list = Library.all
    @platforms_list = Platform.all
    if @project
      render 'projects/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'project', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "project #{params[:id]}")
    @project = Project.get(params[:id])
    if @project
      @project.languages = Language.all(:id => params[:project][:selected_languages])
      @project.libraries = Library.all(:id => params[:project][:selected_libraries])
      @project.platforms = Platform.all(:id => params[:project][:selected_platforms])
      params[:project].delete('selected_languages')
      params[:project].delete('selected_libraries')
      params[:project].delete('selected_platforms')
      params[:project].each do |key, value|
        @project[key] = value
      end
      if @project.save
        flash[:success] = pat(:update_success, :model => 'Project', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:projects, :index)) :
          redirect(url(:projects, :edit, :id => @project.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'project')
        render 'projects/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'project', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Projects"
    project = Project.get(params[:id])
    if project
      if project.destroy
        flash[:success] = pat(:delete_success, :model => 'Project', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'project')
      end
      redirect url(:projects, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'project', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Projects"
    unless params[:project_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'project')
      redirect(url(:projects, :index))
    end
    ids = params[:project_ids].split(',').map(&:strip)
    projects = Project.all(:id => ids)
    
    if projects.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Projects', :ids => "#{ids.to_sentence}")
    end
    redirect url(:projects, :index)
  end
end
