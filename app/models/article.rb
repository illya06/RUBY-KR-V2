class Article < ApplicationRecord
  include Visible
  has_many :comments

  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true, length: { minimum: 1 }
end