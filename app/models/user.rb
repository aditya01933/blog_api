class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
