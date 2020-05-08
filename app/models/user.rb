include Rails.application.routes.url_helpers
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :images
  has_many :messages
  has_one :location

  def user_avatar
    if self.images.attached?
      #url_for (self.images.first)
      rails_blob_path(self.images.first, disposition: "attachment", only_path: true)
    else
      # Assuming you have a default.jpg in your assets folder
      'assets/default_avatar.jpeg'
    end
  end


end
