class Item < ActiveRecord::Base
  belongs_to :user, foreign_key: :listed_by
  has_many :purchases
  validates :listed_by, presence: true
end
