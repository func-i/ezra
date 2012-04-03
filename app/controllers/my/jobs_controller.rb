class My::JobsController < My::BaseController
  def new
    @job = Job.new
  end

  def create
    @job = create_job(params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    
  end

end