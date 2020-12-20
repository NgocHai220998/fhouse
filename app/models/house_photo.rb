class HousePhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :house
end
