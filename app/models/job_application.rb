class JobApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  scope :for_job_id, lambda{ |job_id|
    where(:job_id => job_id)
  }

  scope :by_user_id, lambda{ |user_id|
    where(:user_id => user_id)
  }
end
