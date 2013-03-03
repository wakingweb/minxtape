class Mix < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :tracks_attributes
  
  belongs_to :user
  has_many :tracks
  accepts_nested_attributes_for :tracks, :allow_destroy => true
end
