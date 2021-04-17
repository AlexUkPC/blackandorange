class Bando < ApplicationRecord
  belongs_to :user
  mount_uploader :user_bando, UserBandoUploader
end
