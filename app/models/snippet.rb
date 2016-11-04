class Snippet < ApplicationRecord
  belongs_to :kind
  belongs_to :user
  validates :work, presence: true
  validates :is_private?, :inclusion => {:in => [true, false]}

  def self.count_by_kind_id(id)
    where(kind_id: id).count
  end

  def self.viewable(user)
    return where(is_private?: false) if user.nil?
    where(user_id: user.id).or(where(is_private?: false))
  end

end
