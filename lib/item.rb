class Item < ActiveRecord::Base
  belongs_to :user

  validates :listed_by, presence: true
end
