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
    File.open('pictures/' + @post.id.to_s + '.jpg', 'wb') do |f|
        f.write(params[:pic][:tempfile].read)
         @post.bild = @post.id.to_s + '.jpg'
    end
    
    if @post.save
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
    File.open('pictures/' + @post.id.to_s + '.jpg', 'wb') do |f|
        f.write(params[:pic][:tempfile].read)
        params[:post][:bild] = @post.id.to_s + '.jpg'
    end
    if @post.update(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect url(:posts, :edit, :id => @post.id)
    else
      render 'posts/edit'
    end
  end

  delete :destroy, :with => :id do
    post = Post.get(params[:id])
    if post.destroy
      flash[:notice] = 'Post was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Post!'
    end
    redirect url(:posts, :index)
  end
end
