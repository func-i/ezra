class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def index
    
  end

  def show
    @job = Job.find params[:id]
  end
end