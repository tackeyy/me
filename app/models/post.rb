class Post < ActiveRecord::Base
  extend Enumerize

  RECENT_POSTS_CONT = 5

  acts_as_taggable

  enumerize :status, in: { wip: 0, published: 1 }

  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :tags,
                                reject_if: :all_blank,
                                allow_destroy: true

  validates :title,
            presence: true
  validates :body,
            presence: true
  validates :category_id,
            presence: true
end
