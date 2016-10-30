class Snippet < ApplicationRecord
  belongs_to :kind
  belongs_to :user
  validates :work, presence: true

  def self.count_by_kind_id(id)
    where(kind_id: id).count
  end

  # def self.group_by_kind
  #
  #   group {|s| s.kind.language}
  #   # find(:all, :select => 'kinds.*, count(kinds.language) as kind_count',
  #   #          :joins => 'left outer join kinds on snippets.kind_id = kinds.id',
  #   #          :group => 'kinds.language'
  #   #         )
  # end
end
