Admin.controllers :abouts do

  get :index do
    @abouts = About.all
    render 'abouts/index'
  end

  get :new do
    @about = About.new
    render 'abouts/new'
  end

  post :create do
    @about = About.new(params[:about])
    if @about.save
      flash[:notice] = 'About was successfully created.'
      redirect url(:abouts, :edit, :id => @about.id)
    else
      render 'abouts/new'
    end
  end

  get :edit, :with => :id do
    @about = About.get(params[:id])
    render 'abouts/edit'
  end

  put :update, :with => :id do
    @about = About.get(params[:id])
    if @about.update(params[:about])
      flash[:notice] = 'About was successfully updated.'
      redirect url(:abouts, :edit, :id => @about.id)
    else
      render 'abouts/edit'
    end
  end

  delete :destroy, :with => :id do
    about = About.get(params[:id])
    if about.destroy
      flash[:notice] = 'About was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy About!'
    end
    redirect url(:abouts, :index)
  end
end
