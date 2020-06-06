class Game < ApplicationRecord

  belongs_to :user
  validates_presence_of :name, :playtime

  scope :recently_played, -> id do
    Game.where(user_id: id, recent: true).limit(3)
  end

  scope :most_played, -> id do
    Game.where(user_id: id).order(playtime: :desc).limit(5)
  end

end
