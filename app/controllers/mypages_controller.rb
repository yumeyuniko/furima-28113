class MypagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_user.items.includes(:record).references(:record).where(records: { id: nil })
    # SELECT `items`.* FROM `items` WHERE `items`.`user_id` = 1
    @records = current_user.items.joins(:record).where.not(records: { id: nil })
    # SELECT `items`.* FROM `items` INNER JOIN `records` ON `records`.`item_id` = `items`.`id` WHERE `items`.`user_id` = 1 AND `records`.`id` IS NOT NULL
  end
end
