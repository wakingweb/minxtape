class Track < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :mix

  acts_as_list scope: :mix
  mount_uploader :audio, AudioUploader
end
