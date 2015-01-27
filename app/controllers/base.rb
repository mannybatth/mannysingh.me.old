MannySinghMe::App.controllers :base do

  get :index, :map => "/" do

    puts Account.all
    puts Library.all


    @projects = Project.all(:order => 'created_at')
    render "base/index"
  end
  
end
