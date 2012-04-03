class Job < ActiveRecord::Base
  has_one :user

  has_many :job_tags
  has_many :tags, :through => :job_tags

  has_many :job_applications
end
