class My::JobApplicationsController < My::BaseController
  before_filter :load_job, :only => [:index_for_job, :show, :accept, :reject]

  def index
    @applications = current_user.job_applications
    @sub_nav = :my_applications
  end

  def create
    create_job_application params[:job_id]
    redirect_to job_path(params[:job_id])
  end


  def show
    @application = @job.job_applications.find params[:id]
    @user = @application.user
  end

  def index_for_job
    @applications = @job.job_applications.still_valid
    @sub_nav = :my_jobs
  end
  
  def accept
    application = @job.job_applications.find params[:id]
    application.accept!
    redirect_to index_for_job_my_job_application_index_path(@job)
  end

  def reject
    application = @job.job_applications.find params[:id]
    application.reject!
    redirect_to index_for_job_my_job_application_index_path(@job)
  end

  protected

  def load_job
    @job = current_user.jobs.find params[:job_id]
  end
end