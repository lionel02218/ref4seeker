class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy

  validates_presence_of :body, :user_id

  scope :ordered_by_creation, -> { order("created_at DESC")}
end
