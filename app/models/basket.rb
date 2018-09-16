class Basket < ApplicationRecord

  def self.item_exist item_id
    item = Basket.where(item_id: item_id)

    if item.present?
      [true, item.first]
    else
      [false, nil]
    end
  end

  def item
    Item.find self.item_id
  end

  def self.total
    baskets = Basket.all

    total = 0

    baskets.each do |b|    
      total = total + b.sub_total
    end

    if total > 70
      total = total - (total * 0.12)
    end

    total.round(2)
  end

  def sub_total
    item     = self.item
    quantity = self.quantity
    vat      = item.vat

    sub_total = ( quantity * item.price )

    (sub_total + (sub_total * vat.rate)) - self.discount
  end

  def discount
    discount = 0

    if self.item.is_scotland_flag?
      discount = (quantity - 1) * 5
    end

    discount
  end
end
