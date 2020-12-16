class ItemsTag

  include ActiveModel::Model
  attr_accessor :user_id, :image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :tag_name

  with_options presence: true do
    # validates :tag_name
    validates :image
    validates :name,             length: { maximum: 40 }
    validates :explanation,      length: { maximum: 1000 }
    validates :category_id, :condition_id, :delivery_fee_id,
                numericality: { other_than: 0, message: "を選択してください" }
    validates :prefecture_id, :shipping_day_id,  
                  numericality: { other_than: 0, message: "を選択してください" }
    validates :price, 
               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "を半角数字で入力してください" }
    end
  


  def save
    @item = Item.new(image: image, name: name, explanation: explanation, category_id: category_id, condition_id: condition_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, shipping_day_id: shipping_day_id, price: price, user_id: user_id )
    if @item.save
      tag = Tag.find_by(tag_name: tag_name)
      if tag.nil?
        new_tag = Tag.new(tag_name: tag_name)
        if new_tag.save
          ItemTagRelation.create(item_id: @item.id,tag_id:new_tag.id)
        end
      else
        ItemTagRelation.create(item_id: @item.id,tag_id:tag.id)
      end
    end
  end


  # @item = Item.create(image: image, name: name, explanation: explanation, category_id: category_id, condition_id: condition_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, shipping_day_id: shipping_day_id, price: price, user_id: user_id )
  # tag = Tag.create(tag_name: tag_name)
  # ItemTagRelation.create(item_id: @item.id,tag_id:tag.id)

end


