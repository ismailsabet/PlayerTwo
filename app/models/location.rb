class Location < ApplicationRecord
  belongs_to :user

  validates_presence_of :address1, :city, :country
end
