index = 0
10.times do
  index += 1
  Category.seed(
    :id,
    id: index,
    name: "カテゴリー#{index}"
  )
end
