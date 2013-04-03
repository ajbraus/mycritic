class Review < ActiveRecord::Base
  belongs_to :work
  belongs_to :critic
  attr_accessible :published_on, :score, :url, :work_id, :critic_id


  validates :critic_id,
            :work_id, presence: true
end

