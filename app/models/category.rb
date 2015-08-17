class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :items

  paginates_per 3

end
