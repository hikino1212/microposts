class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :users
  has_many :rel2s
  has_many :following2s, through: :rel2s, source: :follow2
  has_many :reverses_of_rel2, class_name: 'Rel2', foreign_key: 'follow2_id'
  has_many :follower2s, through: :reverses_of_rel2, source: :micropost
  
  def follow2(other_micropost)
    unless self == other_micropost
      self.rel2s.find_or_create_by(follow2_id: other_micropost.id)
    end
  end

  def unfollow2(other_micropost)
    rel2 = self.rel2s.find_by(follow2_id: other_micropost.id)
    rel2.destroy if rel2
  end

  def following2?(other_micropost)
    self.following2s.include?(other_micropost)
  end

end
