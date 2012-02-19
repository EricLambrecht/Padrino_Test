Edelbiter.controllers :suggest do

  get :index do
    render 'suggest/index'
  end
  
  post :send do 
    # Das Gem Mail wird hierfuer benutzt (installiert)
    Mail.defaults do
      smtp 'localhost:25' # Port 25 default, testen!
    end
     
    mail = Mail.new do
          from params[:absender]
            to 'beschwerden@edelbiter.de'
       subject params[:betreff]
          body params[:nachricht]
    end
    mail.deliver!
  end
end
