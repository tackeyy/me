module Users::CategoriesHelper
  def nested_categories(categories)
    categories.map do |category, sub_categories|
      render(category) + content_tag(
        :div, nested_categories(sub_categories),
        class: 'nested_categories'
      )
    end.join.html_safe
  end

  def selectable_categories(category)
    categories = current_user.categories.where.not(id: category.id)
    categories.to_a.insert(0, Category.root)
  end
end
