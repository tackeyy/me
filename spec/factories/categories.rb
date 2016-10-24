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

FactoryGirl.define do
  factory :category do
    name ""
    order 1
  end
end
