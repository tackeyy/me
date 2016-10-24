# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#

class Category < ActiveRecord::Base
  has_ancestry

  belongs_to :user
  has_many :posts

  validates :name,
            presence: true

  def self.root
    new(id: 0, name: '親フォルダなし')
  end
end
