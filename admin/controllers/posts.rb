Admin.controllers :posts do

  get :index do
    @posts = Post.all
    render 'posts/index'
  end

  get :new do
    @post = Post.new
    render 'posts/new'
  end

  post :create do
    @post = Post.new(params[:post])


    @post.wertung = nil if @post.wertung == ''
    @post.design = nil if @post.design == ''
    @post.fett = nil if @post.fett == ''
    @post.zucker = nil if @post.zucker == ''
    @post.kohlenhydrate = nil if @post.kohlenhydrate == ''
    @post.kakaogehalt = nil if @post.kakaogehalt == ''
    @post.bild = 'temp.jpg'
    
    @post.datum = DateTime.now
    
    
    if @post.save
      @neu = Post.last(:titel => @post.titel)
      if params[:pic]
        File.open('public/pictures/' + @neu.id.to_s + '.jpg', 'wb') do |f|
          f.write(params[:pic][:tempfile].read)
          @neu.update(:bild => @neu.id.to_s + '.jpg')
        end
      end
      
      flash[:notice] = 'Post was successfully created.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/new'
    end
  end

  get :edit, :with => :id do
    @post = Post.get(params[:id])
    render 'posts/edit'
  end

  put :update, :with => :id do
    @post = Post.get(params[:id])
    if params[:pic]
      File.open('public/pictures/' + @post.id.to_s + '.jpg', 'wb') do |f|
        f.write(params[:pic][:tempfile].read)
        params[:post][:bild] = @post.id.to_s + '.jpg'
      end
    end
    
    @eingabe = params[:post]
    
    # Numerische Werte auf nil setzen, wenn leer-String vorhanden
    @eingabe[:wertung] = nil if @eingabe[:wertung] == ''
    @eingabe[:design] = nil if @eingabe[:design] == ''
    @eingabe[:fett] = nil if @eingabe[:fett] == ''
    @eingabe[:zucker] = nil if @eingabe[:zucker] == ''
    @eingabe[:kohlenhydrate] = nil if @eingabe[:kohlenhydrate] == ''
    @eingabe[:kakaogehalt] = nil if @eingabe[:kakaogehalt] == ''
    
    
    # Wenn der alte Post unveroeffentlicht und der neue (durch Eingabe) oeffentlich sein soll
    # puts @post.oeffentlich
    # puts @eingabe[:oeffentlich]
    
    if ( !@post.oeffentlich and (@eingabe[:oeffentlich].to_i == 1) )
      # ...dann aendere das Datum auf jetzt.
      puts 'ich bin HIER'
      @eingabe[:datum] = DateTime.now.to_s
    end
    
    if @post.update(@eingabe)
      flash[:notice] = 'Post was successfully updated.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = Post.get(params[:id])
    if post.destroy
      File.delete('public/pictures/' + post.id.to_s + '.jpg')
      flash[:notice] = 'Post was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Post!'
    end
    redirect url(:posts, :index)
  end
end
