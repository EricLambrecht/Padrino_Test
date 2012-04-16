Edelbiter.controllers :archive do

  # Index-Seite, hier wir die Default-Einstellung festgelegt  
  get :index do
    @auswahl = Auswahl.new
    @auswahl.reihenfolge = 1
    @auswahl.sortierung = 4
    @auswahl.kategorie = 0
    @auswahl.seite = 1
    @auswahl.ansicht = 0
    redirect url(
        :archive,
        :sort,
        :reihenfolge => @auswahl.reihenfolge,
        :sortierung => @auswahl.sortierung, 
        :kategorie => @auswahl.kategorie, 
        :seite => 1,                   #@auswahl.seite, 
        :ansicht => @auswahl.ansicht)
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
    
    @auswahl.reihenfolge = 1 if @auswahl.sortierung == 0
    
    @posts = Post.all(:oeffentlich => true) if @auswahl.kategorie == 0
    @posts = Post.all(:oeffentlich => true, :kakaogehalt.lt => 70) if @auswahl.kategorie == 1
    @posts = Post.all(:oeffentlich => true, :kakaogehalt.lt => 80, :kakaogehalt.gte => 70) if @auswahl.kategorie == 2
    @posts = Post.all(:oeffentlich => true, :kakaogehalt.gte => 80) if @auswahl.kategorie == 3
    @posts = Post.all(:oeffentlich => true, :wertung.lt => 4) if @auswahl.kategorie == 4
    @posts = Post.all(:oeffentlich => true, :wertung.lt => 7, :wertung.gte => 4) if @auswahl.kategorie == 5
    @posts = Post.all(:oeffentlich => true, :wertung.gte => 7) if @auswahl.kategorie == 6
    @posts = Post.all(:oeffentlich => true, :preis.lt => 2) if @auswahl.kategorie == 7
    @posts = Post.all(:oeffentlich => true, :preis.lte => 4, :preis.gte => 2) if @auswahl.kategorie == 8
    @posts = Post.all(:oeffentlich => true, :preis.gt => 4) if @auswahl.kategorie == 9
    @posts = Post.all(:oeffentlich => true, :design.gte => 6) if @auswahl.kategorie == 10
    @posts = Post.all(:oeffentlich => true, :design.lte => 3) if @auswahl.kategorie == 11
    @posts = Post.all(:oeffentlich => true, :spotlight => true) if @auswahl.kategorie == 12
    
    @posts = @posts.all(:order => :kurztitel.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 0
    @posts = @posts.all(:order => :kurztitel.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 0
    @posts = @posts.all(:order => :preis.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 1
    @posts = @posts.all(:order => :preis.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 1
    @posts = @posts.all(:order => :wertung.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 2
    @posts = @posts.all(:order => :wertung.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 2
    @posts = @posts.all(:order => :kakaogehalt.desc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 3
    @posts = @posts.all(:order => :kakaogehalt.asc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 3
    @posts = @posts.all(:order => :datum.desc) if @auswahl.reihenfolge == 1 && @auswahl.sortierung == 4
    @posts = @posts.all(:order => :datum.asc) if @auswahl.reihenfolge == 0 && @auswahl.sortierung == 4
    
    @anzahlErgebnisse = @posts.size
    
    # Vorbereitung der Seiten-Mechanik
    @postsJeSeite = 3
    if @auswahl.ansicht == 0 && @posts.size > @postsJeSeite
        @anzahlSeiten = sprintf("%.0f", (@anzahlErgebnisse / @postsJeSeite) + 0.5).to_i
        schokoladenAufSeite = @posts.all(:limit => (@postsJeSeite * @auswahl.seite)) - @posts.all(:limit => (@postsJeSeite * (@auswahl.seite-1)))
        @posts = schokoladenAufSeite.all
    end
    render 'archive/index'
  end
  
  # Anzeige eines einzelnen Schokoladen-Artikels
  get :show, :with => :id do
    @post = Post.get(params[:id])
    @balken = false
    if @post != nil && @post.oeffentlich == true
      render 'schokolade/show'
    else
      redirect url(:about, :notFound)
    end
  end

end
