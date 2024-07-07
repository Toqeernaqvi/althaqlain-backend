class Hotel < ApplicationRecord
    # has_many :reviews, dependent: :destroy
    has_many_attached :images
    has_one_attached :base_image
    mount_uploader :base_image, ImageUploader
    mount_uploader :images, ImageUploader



end
