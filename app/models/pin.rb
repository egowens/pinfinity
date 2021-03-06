class Pin < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :equation, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
