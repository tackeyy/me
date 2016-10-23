index = 0
10.times do
  index += 1
  Category.seed(
    :id,
    id: index,
    user_id: 1,
    name: "カテゴリー#{index}"
  )
end
