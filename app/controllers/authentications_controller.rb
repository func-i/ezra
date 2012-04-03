class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      authentication.auth_response = auth
      authentication.user.apply_omniauth(auth)
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.apply_omniauth(auth)
      current_user.save!
      redirect_to root_url # TODO: redirect to last location (check Devise docs)
    else
      user = User.new
      user.apply_omniauth(auth)
      if user.save
        #flash[:notice] = 'Hello and welcome to SocialStreet'
        sign_in_and_redirect(:user, user)
      else
        puts user.errors.inspect
        session[:omniauth] = auth.except('extra')
        #flash[:warning] = 'Everything looks good, but we still need some more information from you next'
        redirect_to new_user_registration_url
      end
    end
  end
end