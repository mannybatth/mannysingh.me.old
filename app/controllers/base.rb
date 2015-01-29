MannySinghMe::App.controllers :base do

  get :index, :map => "/" do
    @projects = Project.all(:order => :created_at.desc)
    render "base/index"
  end
  
end
