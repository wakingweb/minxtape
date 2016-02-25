class Mix < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :tracks, -> { order "position ASC" }, dependent: :destroy

  accepts_nested_attributes_for :tracks, :reject_if => lambda { |t| t[:audio].blank? }, allow_destroy: true
  mount_uploader :art, ArtUploader
end
