class WomenController < ApplicationController

  def index
    @women = Gender.find_by_sex('female')
    @womens_inventory = Inventory.where(gender_id: @women.id, size_id: 1)
  end

end
