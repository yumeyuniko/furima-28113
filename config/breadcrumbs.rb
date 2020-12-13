crumb :root do
  link "Home", root_path
end


crumb :items do
  link "商品一覧", item_top_path
  parent :root
end


crumb :new_item_path do
  link "商品出品", new_item_path
  parent :items
end

crumb :edit_item_path do
  link "商品編集", edit_item_path
  parent :items
end


crumb :contacts do
  link "お問合せ", contacts_index_path
  parent :items
end
