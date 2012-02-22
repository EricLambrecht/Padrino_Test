Edelbiter.controllers :archive do

  # Index-Seite, hier wir die Default-Einstellung festgelegt  
  get :index do
    @auswahl = Auswahl.new
    @auswahl.reihenfolge = 0
    @auswahl.sortierung = 4
    @auswahl.kategorie = 0
    @auswahl.seite = 1
    @auswahl.ansicht = 0
    @posts = Post.all(:oeffentlich => true, :order => :datum.asc)
    render 'archive/index'
  end
  
  # Post Methode empfängt Benutzerauswahl
  post :index do
    @auswahl = Auswahl.new(params[:auswahl])
    redirect url(
        :archive,
        :sort,
        :reihenfolge => @auswahl.reihenfolge,
        :sortierung => @auswahl.sortierung, 
        :kategorie => @auswahl.kategorie, 
        :seite => 1,                   #@auswahl.seite, 
        :ansicht => @auswahl.ansicht)
  end
  
  # Seite, die nach einer Suchanfrage angezeigt wird
  # Regel Nummer Eins: Don't Repeat Yourself...
  
  get :sort, :with => [:reihenfolge, :sortierung, :kategorie, :ansicht, :seite] do
    @auswahl = Auswahl.new
    @auswahl.reihenfolge = params[:reihenfolge]
    @auswahl.sortierung = params[:sortierung]
    @auswahl.kategorie = params[:kategorie]
    @auswahl.seite = params[:seite]
    @auswahl.ansicht = params[:ansicht]
    @posts = Post.all(:oeffentlich => true, :order => :kurztitel.desc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 0
    @posts = Post.all(:oeffentlich => true, :order => :kurztitel.asc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 0
    @posts = Post.all(:oeffentlich => true, :order => :preis.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 1
    @posts = Post.all(:oeffentlich => true, :order => :preis.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 1
    @posts = Post.all(:oeffentlich => true, :order => :wertung.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 2
    @posts = Post.all(:oeffentlich => true, :order => :wertung.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 2
    @posts = Post.all(:oeffentlich => true, :order => :kakaogehalt.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 3
    @posts = Post.all(:oeffentlich => true, :order => :kakaogehalt.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 3
    @posts = Post.all(:oeffentlich => true, :order => :datum.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 4
    @posts = Post.all(:oeffentlich => true, :order => :datum.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 4
    render 'archive/index'
  end
  
  # Anzeige eines einzelnen Schokoladen-Artikels
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'schokolade/show'
  end

end
