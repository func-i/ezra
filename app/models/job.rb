class Job < ActiveRecord::Base
  has_one :user

  has_many :job_tags, :dependent => :destroy
  has_many :tags, :through => :job_tags

  has_many :job_applications

  validates :title, :presence => true

  scope :order_for_user, lambda{ |user|
    joins("LEFT OUTER JOIN job_applications AS ja ON ja.job_id = jobs.id AND ja.user_id = #{user.id}").
      order("coalesce(ja.id, -1) DESC, jobs.created_at DESC")

  }
end
