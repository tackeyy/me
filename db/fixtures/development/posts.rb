index = 0
20.times do
  index += 1
  Post.seed(
    :id,
    id: index,
    user_id: 1,
    category_id: rand(1..Category.all.size),
    title: "これはタイトルです#{index}",
    body: '### リスト

    - リスト
    - リスト
    - リスト

    ### 番号付きリスト
    #
    #1. 番号付きリスト
    #1. 番号付きリスト
    #1. 番号付きリスト',
    status: 'published',
    tag_list: "タグ#{rand(1..20)}, タグ#{rand(1..20)}, タグ#{rand(1..20)}"
  )
end
