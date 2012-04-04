module ApplicationHelper
  def crumb_trail(crumbs)
    render 'shared/crumbs', :crumbs => crumbs
  end

  def form_create_button(f, label='Create')
    f.submit label, :class => "btn btn-primary btn-large", :disable_with => "Wait..."
  end

  def form_update_button(f, label='Update')
    f.submit label, :class => "btn btn-primary btn-large", :disable_with => "Saving"
  end

end
