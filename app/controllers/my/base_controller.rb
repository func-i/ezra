class My::BaseController < ApplicationController  
  before_filter :authenticate_user!
  before_filter :set_nav

  def set_nav
    @nav = :dashboard
  end
    
end
