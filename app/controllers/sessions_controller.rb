class SessionsController < Devise::SessionsController
  #Force Faceboook login
  def new
    respond_to do |format|
      format.js
      format.html do
        sign_in_and_redirect(:user, User.last)
#        redirect_to '/auth/facebook'
      end
    end
  end
end
