class Track < ActiveRecord::Base
  attr_accessible :artist, :mix_id, :name, :audio
  belongs_to :mix

  acts_as_list :scope => :mix
  mount_uploader :audio, AudioUploader
end
