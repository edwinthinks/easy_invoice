require "virtus"

module EasyInvoice
  class Template
    include Virtus.model

    attribute :currency, String
    attribute :header, String
    attribute :to_title, String
    attribute :invoice_number_title, String
    attribute :date_title, String
    attribute :payment_terms_title, String
    attribute :due_date_title, String
    attribute :purchase_order_title, String
    attribute :quantity_header, String
    attribute :item_header, String
    attribute :unit_cost_header, String
    attribute :amount_header, String
    attribute :subtotal_title, String
    attribute :discounts_title, String
    attribute :tax_title, String
    attribute :shipping_title, String
    attribute :total_title, String
    attribute :amount_paid_title, String
    attribute :balance_title, String
    attribute :terms_title, String
    attribute :notes_title, String

  end
end
