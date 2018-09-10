class Profession < ApplicationRecord
  has_many :cards

  mount_uploader :icon, ImageUploader
end