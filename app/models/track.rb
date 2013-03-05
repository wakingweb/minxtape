class Track < ActiveRecord::Base
  attr_accessible :mix_id, :artist, :name, :audio, :position
  belongs_to :mix

  acts_as_list :scope => :mix
  mount_uploader :audio, AudioUploader
end
