class Hotel < ApplicationRecord
    has_many_attached :images
    has_one_attached :base_image
end
  