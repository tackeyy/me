class Category < ActiveRecord::Base
  has_ancestry

  belongs_to :user
  has_many :post

  validates :name,
            presence: ture

  def self.root
    new(id: 0, name: '親フォルダなし')
  end
end
