Edelbiter.controllers :archive do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    @posts = Post.all(:order => :kurztitel.asc)
    render 'archive/index'
  end
  
  post :index do
    # @posts = Post.abc
    # redirect 'archive/1-2-3-4-5/6'
  end
  
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'schokolade/show'
  end

end
