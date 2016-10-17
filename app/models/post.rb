class Post < ActiveRecord::Base
  extend Enumerize

  acts_as_taggable

  enumerize :status, in: { wip: 0, published: 1 }

  belongs_to :user
  belongs_to :category

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
