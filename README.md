# EasyInvoice
InvoicedLite API Wrapper for Ruby

Please look here for list of parameters:
https://github.com/Invoiced/invoice-generator-api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_invoice'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_invoice

## Usage

You can directly input `options`
```ruby
options = {
    :from=>"Invoiced, Inc.", 
    :to=>"Parag", 
    :logo=>"https://invoiced.com/img/logo-invoice.png", 
    :number=>1,
    :items=>[
        {
            :name=>"Starter plan", 
            :quantity=>1, 
            :unit_cost=>99
        }
    ], 
    :notes=>"Thanks for your business!"
}
# Initialize Invoice
invoice = EasyInvoice::Invoice.new(options: options)
# Perform API call to retrieve pdf.
invoice.generate_pdf
# Pdf data is stored in invoice.pdf
invoice.pdf
```

Or you can define `EasyInvoice::Template` and `EasyInvoice::Item` and pass them into the initialization
```ruby
template = EasyInvoice::Template.new({currency: "USD", header: "Custom Header"})
item = EasyInvoice::Item.new({name: "Item1", quantity: 5, unit_cost: "5"})

invoice = EasyInvoice::Invoice.new(template: template, items: [item])
invoice.generate_pdf
invoice.pdf
```
