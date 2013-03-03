class Track < ActiveRecord::Base
  attr_accessible :artist, :mix_id, :title
  belongs_to :mix
  acts_as_list :scope => :mix
  mount_uploader :audio, AudioUploader
end
