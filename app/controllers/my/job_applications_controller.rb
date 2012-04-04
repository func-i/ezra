class My::JobApplicationsController < My::BaseController
  before_filter :load_job, :only => [:create]

  def index
    @applications = current_user.job_applications
    @sub_nav = :my_applications
  end
  
  def create
    create_job_application params[:job_id]
    redirect_to job_path(params[:job_id])
  end

  protected

  def load_job
    @job = Job.find params[:job_id]
  end
end