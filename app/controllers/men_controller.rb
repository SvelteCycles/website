class MenController < ApplicationController

  def index
    @men = Gender.find_by_sex('male')
    @mens_inventory = Inventory.where(gender_id: @men.id, size_id: 1)
  end

end
