class Hotel < ApplicationRecord
    # has_many :reviews, dependent: :destroy
    has_many_attached :images
end
