Admin.controllers :additionals do

  get :index do
    @additionals = Additional.all
    render 'additionals/index'
  end

  get :new do
    @additional = Additional.new
    render 'additionals/new'
  end

  post :create do
    @additional = Additional.new(params[:additional])
    if @additional.save
      flash[:notice] = 'Additional was successfully created.'
      getcontent      
      redirect url(:additionals, :edit, :id => @additional.id)
    else
      render 'additionals/new'
    end
  end

  get :edit, :with => :id do
    @additional = Additional.get(params[:id])
    render 'additionals/edit'
  end

  put :update, :with => :id do
    @additional = Additional.get(params[:id])
    if @additional.update(params[:additional])
      flash[:notice] = 'Additional was successfully updated.'
      getcontent
      redirect url(:additionals, :edit, :id => @additional.id)
    else
      render 'additionals/edit'
    end
  end

  delete :destroy, :with => :id do
    additional = Additional.get(params[:id])
    if additional.destroy
      flash[:notice] = 'Additional was successfully destroyed.'
      getcontent      
    else
      flash[:error] = 'Unable to destroy Additional!'
    end
    redirect url(:additionals, :index)
  end
end


def getcontent
  $additional = Additional.all
  if !$additional
    $additional = nil
  end
  $additional = $additional[0]
end