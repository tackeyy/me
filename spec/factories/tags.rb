# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  taggings_count :integer          default(0)
#

FactoryGirl.define do
  factory :tag do
    name ""
    order 1
  end
end
