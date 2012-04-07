class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable

  mount_uploader :avatar, AvatarUploader


  #ASSOCIATIONS
  has_many :authentications
  
  has_many :user_tags
  has_many :tags, :through => :user_tags

  has_many :user_files

  has_many :jobs

  has_many :job_applications


  #ACCESSORS
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :telephone, :city, :province, :name, :twitter_handle, :website, :bio, :avatar, :location, :description, :user_files_attributes

  accepts_nested_attributes_for :user_files

  scope :with_application_for_job, lambda{ |job|
    joins(:job_applications).where("job_applications.job_id = ?", job.id)
  }


  #METHODS
  def apply_omniauth(omniauth)
    auth = Authentication.where(:provider => omniauth['provider'], :uid => omniauth['uid'])
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :auth_response => omniauth) unless auth.count > 0

    info_hash = omniauth['info']
    info_hash ||= omniauth['extra']['user_hash'] if omniauth['extra']
    info_hash ||= []

    self.email = info_hash['email'] if self.email.blank?
    self.name = "#{info_hash['first_name']} #{info_hash['last_name']}" if self.name.blank?  && (info_hash['first_name'] || info_hash['last_name'])
    self.location = info_hash['location'] if self.location.blank?
    self.remote_avatar_url = info_hash['image'] if info_hash['image']
    save
  end

end
