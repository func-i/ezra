class My::ProfilesController < My::BaseController
  def edit
  end

  def update
    if current_user.update_attributes(params[:user])

      current_user.user_tags.destroy_all
      tags = params[:tags].split(',')
      tags.each do |tag_text|
        tag_text.strip!
        tag = Tag.with_name(tag_text).first
        tag ||= Tag.create_with_name!(tag_text)
        current_user.user_tags.build(:tag => tag)
      end

#      raise params[:file]
      current_user.user_files.build(:file => params[:file]) unless params[:file].blank?

      current_user.save
      
      redirect_to profile_path(current_user)
    else
      render :edit
    end

  end
end