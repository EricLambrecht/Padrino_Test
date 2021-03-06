class Edelbiter < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Sinatra::SimpleNavigation

  enable :sessions

  $additional = Additional.all
  if !$additional
    $additional = nil
  end
  $additional = $additional[0]
 


  ##
  # Caching support
  #
  # register Padrino::Cache
  # enable :caching
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
  # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
  # set :public_folder, "foo/bar" # Location for static assets (default root/public)
  # set :reload, false            # Reload application files (default in development)
  # set :default_builder, "foo"   # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"       # Set path for I18n translations (default your_app/locales)
  # disable :sessions             # Disabled sessions by default (enable if needed)
  # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
  # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #
  
  set :delivery_method, :smtp => {
    :adress               => "smtp.googlemail.com",
    :port                 => 587,
    :domain               => 'edelbiter.de',
    :user_name            => "edelbiter@gmail.com",
    :password             => 'rohrzucker',
    :authentication       => :plain,
    :enable_starttls_auto => true
  }
  
  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #

  get :index, :map => "/" do
    
    # Hier wird ausgewählt, welcher Beitrag auf der Startseite zu sehen ist.
    
    if (Post.last(:oeffentlich => true).datum + 2) >= DateTime.now
      @spotlight_name = "Aktueller Test:"
      @post = Post.last(:oeffentlich => true)
    elsif (Blogpost.last(:oeffentlich => true).datum + 2) >= DateTime.now
      @spotlight_name = "Aktueller Blogeintrag:"
      @post = Blogpost.last(:oeffentlich => true)
    else
      @spotlight_name = "Heute im Rampenlicht:"
      spotlights = Post.all(:spotlight => true)
      randomDateID = (DateTime.now.strftime('%d').to_i + (30 * (DateTime.now.strftime('%m').to_i-1))) % spotlights.size
      @post = spotlights[randomDateID]
    end
    
    @posts = Post.all(:order => :kurztitel.asc)
    @balken = true
    
    # Twitter
    @tweets = Twitter.user_timeline("edelbiter", :count => 4)
    render 'schokolade/index'
    
  end
  
  # Ab hier werden falsche Seitenaufrufe abgefangen
  
  get '/post/:url' do
    redirect 'http://www.edelbiter.tumblr.com/post/' + params[:url]
  end
  
  get '/post/:url/:url2' do
    redirect 'http://www.edelbiter.tumblr.com/post/' + params[:url]
  end
  
  get '/page/:url' do
    redirect 'http://www.edelbiter.tumblr.com/page/' + params[:url]
  end
  
  get '/liste1' do
    redirect '/'
  end
  
  get '/liste2' do
    redirect '/'
  end
  
  get '/edelbiter' do
    redirect url(:about, :index)
  end
  
  # Shorturls
  get '/s/:shorty' do
    if params[:shorty].to_i.to_s == params[:shorty]
      redirect url(:archive, :show, :id => params[:shorty])
    else
      redirect url(:about, :notFound)
    end
  end
  
  get '/b/:shorty' do
    if params[:shorty].to_i.to_s == params[:shorty]
      redirect url(:blog, :show, :id => params[:shorty])
    else
      redirect url(:about, :notFound)
    end
  end
  
  not_found do
    status 404
    redirect url(:about, :notFound)
  end
  
end