Edelbiter.controllers :posts do
  get :index do
    @posts = Post.all(:order => :datum.desc)
    render 'posts/index'
  end
  
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'posts/show'
  end
end