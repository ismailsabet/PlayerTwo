class Match < ApplicationRecord
  validates_uniqueness_of :user_1, scope: :user_2

  scope :between, -> (user_1, user_2) do
    where("(user_1 = ? AND user_2 = ?) OR (user_1 = ? AND user_2 = ?)", user_1, user_2, user_2, user_1)
  end

  scope :matches_for, -> id do
    matches = where("(user_1 = ? OR user_2 = ?) AND (user_1_approves = ? AND user_2_approves = ?)", id, id, true, true)

    user_ids = []
    matches.each do |match|
      new_id = match.user_1 == id ? match.user_2 : match.user_1
      user_ids << new_id
    end

    User.where(id: user_ids)
  end

  scope :recommended_matches_for, -> id do
    # get account ids to ignore
    matches = where("(user_1 = ? AND user_1_approves IS NOT NULL) OR (user_2 = ? AND user_2_approves IS NOT NULL)", id, id)

    ignore_ids = [id]
    matches.each do |match|
      new_id = match.user_1 == id ? match.user_2 : match.user_1
      ignore_ids << new_id
    end

    User.includes(:images_attachments).where.not(id: ignore_ids).order(id: :asc).limit(10)
  end

end
