# app/models/hotel.rb
class Hotel < ApplicationRecord
    has_many_attached :images
    has_one_attached :base_image
    
    validates :name, presence: true, length: { maximum: 255 }
    validates :city, presence: true, length: { maximum: 255 }
    validates :country, presence: true, length: { maximum: 255 }
    validates :state, length: { maximum: 255 }, allow_blank: true
    validates :address, presence: true, length: { maximum: 255 }
    validates :loc_lat, :loc_long, presence: true, numericality: true
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :discounted_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :bed, :living_room, :bathroom, :kitchen, :reserved_room, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
    validates :description,presence: true, allow_blank: true
    
end