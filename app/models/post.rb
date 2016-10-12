class Post < ActiveRecord::Base
  extend Enumerize
  acts_as_taggable

  enumerize :status, in: { wip: 0, published: 1 }

  has_one :category
  belongs_to :user
end
