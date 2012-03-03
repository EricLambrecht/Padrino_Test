Admin.controllers :blogposts do

  get :index do
    @blogposts = Blogpost.all
    render 'blogposts/index'
  end

  get :new do
    @blogpost = Blogpost.new
    render 'blogposts/new'
  end

  post :create do
    @blogpost = Blogpost.new(params[:blogpost])
    
    @blogpost.datum = DateTime.now
    
    if @blogpost.save
      flash[:notice] = 'Blogpost wurde erfolgreich erstellt.'
      redirect url(:blogposts, :edit, :id => @blogpost.id)
    else
      render 'blogposts/new'
    end
  end

  get :edit, :with => :id do
    @blogpost = Blogpost.get(params[:id])
    render 'blogposts/edit'
  end

  put :update, :with => :id do
    @blogpost = Blogpost.get(params[:id])
    
    @eingabe = params[:blogpost]
    
    if ( !@blogpost.oeffentlich and (@eingabe[:oeffentlich].to_i == 1) )
      # ...dann aendere das Datum auf jetzt.
      puts 'ich bin HIER'
      @eingabe[:datum] = DateTime.now.to_s
    end
    
    if @blogpost.update(@eingabe)
      flash[:notice] = 'Blogpost wurde erfolgreich aktualisiert.'
      redirect url(:blogposts, :edit, :id => @blogpost.id)
    else
      render 'blogposts/edit'
    end
  end

  delete :destroy, :with => :id do
    blogpost = Blogpost.get(params[:id])
    if blogpost.destroy
      flash[:notice] = 'Blogpost wurde erfolgreich gel&ouml,scht.'
    else
      flash[:error] = 'Unable to destroy Blogpost!'
    end
    redirect url(:blogposts, :index)
  end
end
