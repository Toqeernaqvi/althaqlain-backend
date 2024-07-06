# app/serializers/hotel_serializer.rb
class HotelSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
  
    attributes :id, :name, :city, :country, :state, :address, :loc_lat, :loc_long, :rating, :price, :images_urls, :base_image_url
  
    def images_urls
      object.images.map { |image| rails_blob_url(image, only_path: true) } if object.images.attached?
    end
  
    def base_image_url
      rails_blob_url(object.base_image, only_path: true) if object.base_image.attached?
    end
  end
  