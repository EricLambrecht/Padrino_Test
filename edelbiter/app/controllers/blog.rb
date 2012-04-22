Edelbiter.controllers :blog do
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
    @blogposts = Blogpost.all(:oeffentlich => true, :order => :datum.desc)
    # PostsJeSeite muss identisch mit PostsJeSeite im nächsten Controller sein!
    @aufzaehlung = @blogposts.all(:spotlight => true)
    @seite = 1
    @postsJeSeite = 4
    @anzahlErgebnisse = @blogposts.size
    @anzahlSeiten = sprintf("%.0f", (@anzahlErgebnisse / @postsJeSeite) + 0.5).to_i
    postsAufSeite = @blogposts.all(:limit => @postsJeSeite)
    @blogposts = postsAufSeite.all
    render 'blog/index'
  end
  
  get :index, :with => :seite do
    @seite = params[:seite].to_i
    @blogposts = Blogpost.all(:oeffentlich => true, :order => :datum.desc)
    # PostsJeSeite muss identisch mit PostsJeSeite im vorherigen Controller sein!
    @aufzaehlung = @blogposts.all(:spotlight => true)
    @postsJeSeite = 4
    @anzahlErgebnisse = @blogposts.size
    @anzahlSeiten = sprintf("%.0f", (@anzahlErgebnisse / @postsJeSeite) + 0.5).to_i
    postsAufSeite = @blogposts.all(:limit => (@postsJeSeite * @seite)) - @blogposts.all(:limit => (@postsJeSeite * (@seite-1)))
    @blogposts = postsAufSeite.all
    render 'blog/index'
  end
  
  get :show, :with => :id do
    @blogpost = Blogpost.get(params[:id])
    render 'blog/show'
  end

end
