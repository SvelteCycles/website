class MenController < ApplicationController

  def index
    @male = Gender.find_by_sex('male')
    @mens_products = @male.products.distinct
  end

end
