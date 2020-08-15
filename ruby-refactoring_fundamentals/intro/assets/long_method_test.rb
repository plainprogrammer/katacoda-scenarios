require "minitest/autorun"
require_relative "./long_method"

class TestExample < MiniTest::Unit::TestCase
  Product = Struct.new(:price, :tax_exempt?)
  ShippingAddress = Struct.new(:state)

  def setup
    @destination = ShippingAddress.new('FL')
  end

  def test_exempt_product
    product = Product.new(15, true)
    destination = ShippingAddress.new('FL')

    assert_equal 0.0, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_florida
    product = Product.new(15, false)
    destination = ShippingAddress.new('FL')

    assert_equal 1.05, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_georgia
    product = Product.new(15, false)
    destination = ShippingAddress.new('GA')

    assert_equal 0.90, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_alabama
    product = Product.new(15, false)
    destination = ShippingAddress.new('AL')

    assert_equal 0.30, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_utah
    product = Product.new(15, false)
    destination = ShippingAddress.new('UT')

    assert_equal 1.05, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_california
    product = Product.new(15, false)
    destination = ShippingAddress.new('CA')

    assert_equal 1.95, calculate_sales_tax(product, destination)
  end

  def test_nonexempt_product_for_unsupported_states
    product = Product.new(15, false)
    destination = ShippingAddress.new('MS')

    assert_equal 0.0, calculate_sales_tax(product, destination)
  end
end
