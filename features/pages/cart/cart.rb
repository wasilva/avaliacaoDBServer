class Cart < SitePrism::Page
  @@cart = YAML.load_file("features/pages/cart/cart.yml")
  $product = ""

  def selected_product
    product_selected = @@cart["cart_selected_product"]
    has_css? product_selected
    $product = find(product_selected).text
  end

  def is_cart
    title_shopping_cart_summary = @@cart["title_shopping_cart_summary"]
    proceed_to_checkout = @@cart["proceed_to_checkout"]
    is_cart = has_xpath? title_shopping_cart_summary
    if is_cart == true
      has_text? $product
      has_xpath? proceed_to_checkout
      page.all(:xpath, proceed_to_checkout)[0].click
      p "O produto: #{$product}, está no carrinho."
    end
  end
end
