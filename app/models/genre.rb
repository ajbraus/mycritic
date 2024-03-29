class Genre < ActiveRecord::Base
  has_and_belongs_to_many :critics
  has_many :works
  attr_accessible :name

  validates :name, presence: true
end

