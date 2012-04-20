Edelbiter.controllers :suggest do

  get :index do
    render 'suggest/index'
  end
  
  post :send do 
    # Das Gem Mail wird hierfuer benutzt (installiert)
    # Mail.defaults do
    #      :smtp 'localhost:25' # Port 25 default, testen!
    #     end
    
    absender  = params[:absender]
    betreff   = params[:betreff]
    nachricht = params[:nachricht]
     
    # mail = Mail.new do
    #        from absender
    #        to 'edelbiter@gmail.com'
    #        subject betreff
    #        body nachricht
    #        via :smtp # padrino sagt optional, to :smtp if defined, otherwise :sendmail
    # end
    
    # email do
    #     from absender
    #     to 'edelbiter@gmail.com'
    #     subject betreff
    #     body nachricht
    #     via :smtp
    # end
    
    # mail.to_s
    #    
    # mail.deliver!
    flash[:notice] = 'Tut uns leid, es gab einen unvorhergesehenen Fehler'
    # end
    redirect url(:suggest, :index)
  end
end
