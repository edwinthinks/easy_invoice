require "excon"
require "virtus"
require "json"

require_relative "item"
require_relative "template"

BASE_URL = "http://invoice-generator.com"

module EasyInvoice
  class Invoice
    include Virtus.model

    attribute :items, Array[EasyInvoice::Item]
    attribute :template, EasyInvoice::Template
    attribute :options, Hash
    attribute :currency, String
    attribute :logo, String
    attribute :from, String
    attribute :to, String
    attribute :number, String
    attribute :purchase_order, String
    attribute :due_date, String
    attribute :discounts, Integer
    attribute :tax, Integer
    attribute :shipping, Integer
    attribute :amount_paid, Integer
    attribute :notes, String
    attribute :terms, String
    attribute :pdf, String

    def generate_pdf
      response = Excon.post(BASE_URL, body: self.payload.to_s, headers: {"Content-Type" => "application/json"})
      if response.status == 200
        self.pdf = response.body
        return true
      else
        return false
      end
    end

    def payload
      payload = self.attributes.select { |k,v| v.is_a?(String) || v.is_a?(Integer) }

      payload[:items] = self.items.map { |item| item.attributes}

      template_attributes = self.template.attributes
      payload.merge(template_attributes)

      #Add any extra options
      payload.merge(self.options)

      payload.to_json
    end

  end
end