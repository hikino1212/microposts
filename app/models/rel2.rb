class Rel2 < ApplicationRecord
  belongs_to :micropost
  belongs_to :follow2, class_name: 'Micropost'

  validates :micropost_id, presence: true
  validates :follow2_id, presence: true
end
