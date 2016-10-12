class Post < ActiveRecord::Base
  extend Enumerize

  acts_as_taggable

  enumerize :status, in: { wip: 0, published: 1 }

  belongs_to :user
  has_one :category

  accepts_nested_attributes_for :tags,
                                reject_if: :all_blank,
                                allow_destroy: true
end
