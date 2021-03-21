categories = ["仕事", "家庭", "旅行", "ライフハック"]
categories.each do |category|
  Category.create(name: category)
end
