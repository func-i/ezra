class Authentication < ActiveRecord::Base

  serialize :auth_response, Hash

  belongs_to :user

  scope :facebook, where(:provider => "facebook")

  def facebook?
    provider == "facebook"
  end

  def fb_auth_token
    auth_response["credentials"]["token"] if facebook?
  end
end
