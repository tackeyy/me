# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer          default(0)
#

class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy

  validates :name,
            presence: true
end
