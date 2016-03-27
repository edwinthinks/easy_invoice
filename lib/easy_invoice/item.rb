require "virtus"
module EasyInvoice
  class Item
    include Virtus.model
    
    attribute :name, String
    attribute :quantity, Integer
    attribute :unit_cost, Float
    attribute :description, String
  end
end