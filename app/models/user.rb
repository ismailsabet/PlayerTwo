include Rails.application.routes.url_helpers
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :images
  has_many :messages
  has_one :location

  validates_presence_of :firstname, :lastname, :bio, :images
  validate :validate_age

  def user_avatar
    if self.images.attached?
      #url_for (self.images.first)
      rails_blob_path(self.images.first, disposition: "attachment", only_path: true)
    else
      # Assuming you have a default.jpg in your assets folder
      'assets/default_avatar.jpeg'
    end
  end

  def quicksort(array)
    #If only one user return back the only index
    return array if array.length <= 1
    pivot = array.delete_at(rand(array.length))

    left = Array.new
    right = Array.new

    array.each do |x|
      if x <= pivot
        left << x
      else
        right << x
      end
    end

    return *quick_sort(left), pivot ,*quick_sort(right)

  end

  private

  def validate_age
      if dob.present? && dob > 18.years.ago.to_date
          errors.add(:dob, 'You are under 18 years old.')
      end
  end

end
