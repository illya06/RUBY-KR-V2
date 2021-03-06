class Article < ApplicationRecord
  include Visible
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 1 }

  scope :is_public, ->(val = true) { where(status: "public") }
end