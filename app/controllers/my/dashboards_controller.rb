class My::DashboardsController < My::BaseController

  def show
    @jobs = Job.order_for_user(current_user).all
    @sub_nav = :home
  end
end