class Hotel < ApplicationRecord
    # has_many :reviews, dependent: :destroy
    has_many_attached :images
    has_one_attached :base_image

end
