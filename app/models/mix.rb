class Mix < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :art, :art_cache, :remove_art, :tracks_attributes
  
  belongs_to :user
  has_many :tracks, -> { order "position ASC" }, dependent: :destroy
  accepts_nested_attributes_for :tracks, :reject_if => lambda { |t| t[:audio].blank? }, allow_destroy: true
  mount_uploader :art, ArtUploader
end
