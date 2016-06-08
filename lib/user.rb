class User < ActiveRecord::Base
  has_many :purchases
  has_many :items, foreign_key: :listed_by
end
