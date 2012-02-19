Edelbiter.controllers :suggest do

  get :index do
    render 'suggest/index'
  end
  
  post :send do 
    # Das Gem Mail wird hierfuer benutzt (installiert)
    #Mail.defaults do
    #  smtp 'localhost:25' # Port 25 default, testen!
    #end
    
    absender  = params[:absender]
    betreff   = params[:betreff]
    nachricht = params[:nachricht]
     
    mail = Mail.new do
          from absender
            to 'beschwerden@edelbiter.de'
       subject betreff
          body nachricht
           via :smtp # padrino sagt optional, to :smtp if defined, otherwise :sendmail
    end
    
    mail.to_s
    
    mail.deliver!
  end
end
