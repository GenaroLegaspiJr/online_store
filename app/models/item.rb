class Item < ApplicationRecord
  belongs_to :vat

  def is_scotland_flag?
  	self.name == "Scotland Flag"
  end
end
