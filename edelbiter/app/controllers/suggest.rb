Edelbiter.controllers :suggest do

  get :index do
    render 'suggest/index'
  end
  
  post :send do 
    # Das Gem Mail wird hierfuer benutzt (installiert)
    Mail.defaults do
      sendmail 'localhost:25' # Port 25 default, testen!
    end
    
    absender  = params[:absender]
    betreff   = params[:betreff]
    nachricht = params[:nachricht]
     
    mail = Mail.new do
          from absender
            to 'edelbiter@gmail.com'
       subject betreff
          body nachricht
           via :sendmail # padrino sagt optional, to :smtp if defined, otherwise :sendmail
    end
    
    #mail.to_s
    
    mail.deliver!
    flash[:notice] = 'Post was successfully created.'
    redirect url(:suggest, :index)
  end
end
