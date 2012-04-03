class JobsController < ApplicationController
  def index
    
  end

  def show
    @job = Job.find params[:id]
  end
end