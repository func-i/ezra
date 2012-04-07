class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, :through => :user_tags

  has_many :job_tags
  has_many :jobs, :through => :job_tags

  scope :with_name, lambda{ |tag_text|
    where(:name => tag_text.downcase)
  }

  def self.create_with_name!(name_text)
    Tag.create!(:name => name_text)
  end
end
