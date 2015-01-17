class SessionsController < ApplicationController
  def login
    @email = params[:email]
    @passowrd = params[:password]

    @orgs = ActiveSupport::JSON.decode(RestClient.get('http://54.183.116.48/organizations/'))
    @orgs.each do |org|
      logger.debug org

      if @email.eql?(org['email'])
        session[:organization] = org['_id']
        logger.debug "LOGGED IN!!!!"

        redirect_to '/'
      end
    end

  end

  def create
  end
end
