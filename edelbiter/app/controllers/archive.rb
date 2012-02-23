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
    
      # Form-Builder:
      # =f.select :kategorie, :grouped_options => {'' => [['Alle',0]],
      # 'Kakaogehalt' => [['Unter 70%',1],['70% bis 80%',2],['&Uuml;ber 80%',3]],
      # 'Wertung' => [['0 bis 3 Punkte',4],['4 bis 6 Punkte',5],['7 bis 12 Punkte',6]],
      # 'Preis' => [['Unter 2 EUR',7],['2 bis 4 EUR',8],['&Uuml;ber 4 EUR',9]],
      # 'Anderes' => [['Gutes Design',10],['Schlechtes Design',11],['Bemerkenswert',12],['Sauere Schokolade',13]]}
    
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
    
    render 'archive/index'
  end
  
  # Anzeige eines einzelnen Schokoladen-Artikels
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'schokolade/show'
  end

end
