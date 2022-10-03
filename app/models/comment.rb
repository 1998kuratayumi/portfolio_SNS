class Comment < ApplicationRecord
  has_many :comment_notices, dependent: :destroy
  belongs_to :post
  belongs_to :user
end
