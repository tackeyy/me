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

FactoryGirl.define do
  factory :post do
    title ""
    contnt "MyText"
  end
end
