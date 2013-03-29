class Review < ActiveRecord::Base
  belongs_to :work
  belongs_to :critic
  attr_accessible :published_on, :score, :url
end

