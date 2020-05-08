class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :user_id

  scope :latest, -> { order(created_at: :desc).limit(1) }
end
