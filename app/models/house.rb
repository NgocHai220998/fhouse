class House < ApplicationRecord
  has_many :house_photos
  belongs_to :user
  has_many :comment
  accepts_nested_attributes_for :house_photos, allow_destroy: true, reject_if: proc { |attributes| attributes["photo"].blank? }
end
