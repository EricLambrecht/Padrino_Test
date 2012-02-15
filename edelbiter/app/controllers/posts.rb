Edelbiter.controllers :posts do
  get :index do
    @posts = Post.all(:order => :kurztitel.asc)
    # Hier wird später ausgewählt, welche Schokolade auf der Startseite zu sehehn ist
    @spotlight = Post.get(1)
    render 'posts/index'
  end
  
  get :show, :with => :id do
    @post = Post.get(params[:id])
    render 'posts/show'
  end
end