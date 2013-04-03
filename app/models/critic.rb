class Critic < ActiveRecord::Base
  has_and_belongs_to_many :genres
  has_many :reviews
  attr_accessible :name, :url

  validates :name, presence: true
end
