class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :images
  has_one :location

  def matches
    liked_user_ids = Like.where(user_id: self.id).map(&:liked_user_id)
    likes_me_user_ids = Like.where(liked_user_id: self.id).map(&:user_id)

    matched_ids = liked_user_ids.select{|id| likes_me_user_ids.include?(id) }

    User.where(id: matched_ids)
  end

end
