def calculate_sales_tax(product, shipping_address)
  if product.tax_exempt?
    return 0
  end

  case shipping_address.state
  when /FL/i
    tax_rate = 0
  when /GA/i
    tax_rate = 0
  when /AL/i
    tax_rate = 0
  when /UT/i
    tax_rate = 0
  when /CA/i
    tax_rate = 0
  else
    tax_rate = 0
  end

  product.price * tax_rate
end
