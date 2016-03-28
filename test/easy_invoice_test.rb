require 'minitest/autorun'
require_relative '../lib/easy_invoice'

class EasyInvoiceTest < Minitest::Test
  def setup
    @item = EasyInvoice::Item.new(name: "Hello")
    @template = EasyInvoice::Template.new
    @ei = EasyInvoice::Invoice.new(items: [@item], template: @template)
  end

  def test_options
    ei = EasyInvoice::Invoice.new(options: {})
    refute ei.pdf
    ei.generate_pdf
    assert ei.pdf
  end

  def test_generate_pdf
    refute @ei.pdf
    @ei.generate_pdf
    assert @ei.pdf
  end

end