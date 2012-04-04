class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
    store_request(request) unless user_signed_in?

    super
  end

  def after_sign_in_path_for(resource_or_scope)
    redirect_path = nil
    request = get_request

    if request[:controller] == 'jobs' && request[:action] == 'create'
      job = create_job(request[:params])
      redirect_path = job.save ? job_path(job) : new_job_path
    elsif request[:controller] == 'job_applications' && request[:action] == 'create'
      create_job_application(request[:params][:job_id])
      redirect_path = job_path(request[:params][:job_id])
    end

    delete_request

    redirect_path || super
  end

  #HELPER CREATION/EDIT FUNCTIONS FOR REDIRECT AFTER SIGNIN
  def create_job(params)
    job = Job.create(params[:job])
    job.user_id = current_user

    create_tags(job, params[:tags])

    return job
  end

  def create_tags(job, tags)
    unless tags.blank?
      tags = tags.split(',')
      tags.each do |tag_text|
        tag_text.strip!
        tag = Tag.with_name(tag_text).first
        tag ||= Tag.create_with_name!(tag_text)
        job.job_tags.build(:tag => tag)
      end
    end
  end

  def create_job_application(job_id)
    current_user.job_applications.create!(:job_id => job_id) if current_user.job_applications.for_job_id(job_id).blank?
  end

  protected

  def store_request(request)
    session[:stored_request] = Hash.new

    session[:stored_request][:controller] = self.controller_name
    session[:stored_request][:action] = self.action_name
    new_params = params.clone
    new_params.delete(:_method)
    new_params.delete(:action)
    new_params.delete(:controller)

    session[:stored_request][:params] = new_params
  end

  def delete_request
    session[:stored_request] = nil
  end

  def get_request
    session[:stored_request] || {}
  end
end
