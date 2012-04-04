class My::JobsController < My::BaseController
  def index
    @jobs = current_user.jobs
    @sub_nav = :my_jobs
  end

  def create
    @job = create_job(params)
    if @job.save
      redirect_to @job
    else
      render :file => 'jobs/new.html.erb'
    end
  end

  def edit
    @job = Job.find params[:id]
  end

  def update
    @job = Job.find params[:id]
    if @job.update_attributes(params[:job])
      @job.job_tags.destroy_all
      create_tags(@job, params[:tags])
      redirect_to @job
    else
      render :edit
    end

  end

  def destroy
    @job.destroy
  end

end