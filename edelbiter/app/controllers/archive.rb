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

  # Index-Seite, hier wir die Default-Einstellung festgelegt  
  get :index do
    @auswahl = Auswahl.new
    @auswahl.reihenfolge = 1
    @posts = Post.all(:order => :kurztitel.asc)
    render 'archive/index'
  end
  
  # Post Methode empfängt Benutzerauswahl
  post :index do
    @auswahl = Auswahl.new(params[:auswahl])
    redirect url(:archive, :sort, :reihenfolge => @auswahl.reihenfolge)
  end
  
  # Seite, die nach einer Suchanfrage angezeigt wird
  get :sort, :with => :reihenfolge do
    @auswahl = Auswahl.new
    @auswahl.reihenfolge = params[:reihenfolge]
    @posts = Post.all(:order => :kurztitel.asc) if @auswahl.reihenfolge == 1
    @posts = Post.all(:order => :kurztitel.desc) if @auswahl.reihenfolge == 0
    render 'archive/index'
  end
  
  # Anzeige eines einzelnen Schokoladen-Artikels
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'schokolade/show'
  end

end
