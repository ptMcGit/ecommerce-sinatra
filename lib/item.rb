class Item < ActiveRecord::Base
  belongs_to :user, foreign_key: :listed_by

  validates :listed_by, presence: true
end
