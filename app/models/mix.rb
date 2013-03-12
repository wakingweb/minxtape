class Mix < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :art, :tracks_attributes
  
  belongs_to :user
  has_many :tracks
  accepts_nested_attributes_for :tracks, :allow_destroy => true
  mount_uploader :art, ArtUploader
end
