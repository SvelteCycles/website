class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :customer

  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end

  private

    def set_order_status
      self.order_status_id = 1
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end

end
