class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :inventory

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :inventory_present
  validate :order_present

  before_save :finalise

  def unit_price
    if persisted?
      self[:unit_price]
    else
      inventory.product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

    def inventory_present
      if inventory.nil?
        errors.add(:inventory, "is not valid or is not active")
      end
    end

    def order_present
      if order.nil?
        errors.add(:order, "is not a valid order")
      end
    end

    def finalise
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end

end
