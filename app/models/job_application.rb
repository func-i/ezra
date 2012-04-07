class JobApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  scope :for_job_id, lambda{ |job_id|
    where(:job_id => job_id)
  }

  scope :by_user_id, lambda{ |user_id|
    where(:user_id => user_id)
  }

  scope :still_valid, where("job_applications.state IS NULL OR job_applications.state = ?", :accepted)

  def reject!
    self.update_attributes(:state => :rejected)
  end
  def accept!
    self.update_attributes(:state => :accepted)
  end

  def accepted?
    self.state == 'accepted'
  end
  def rejected?
    self.state == 'rejected'
  end
end
