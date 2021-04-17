class Bando < ApplicationRecord
  belongs_to :user
  mount_uploader :user_bando, UserBandoUploader
  has_many :comments, dependent: :destroy
  is_impressionable
  acts_as_votable
end
