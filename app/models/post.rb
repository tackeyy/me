# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  title       :string(255)
#  body        :text(65535)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  RECENT_POSTS_CONT = 5
  LATEST_POSTS_COUNT = 3

  acts_as_taggable

  enum status: { wip: 0, published: 1 }

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
