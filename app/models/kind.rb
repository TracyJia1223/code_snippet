class Kind < ApplicationRecord
  has_many :snippets, -> {order(created_at: :desc)}, dependent: :nullify
  validates :language, presence: true, uniqueness: true

  def count_for
    return self.snippets.count
  end
end
