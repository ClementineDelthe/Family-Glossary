class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :definition
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true
end
