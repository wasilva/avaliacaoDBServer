class Shipping < SitePrism::Page
  @@shipping = YAML.load_file("features/pages/shipping/shipping.yml")

  def is_shipping
    title_page_shipping = @@shipping["title_page_shipping"]
    is_shipping = has_xpath? title_page_shipping
    if is_shipping == true
      p "Você esta na pagina de entrega"
    end
  end

  def click_button_proceed_to_checkout
    button_proceed_to_checkout = @@shipping["button_proceed_to_checkout"]
    check_terms = @@shipping["check_terms"]
    has_xpath? check_terms
    page.find(:xpath, check_terms).click
    has_xpath? button_proceed_to_checkout
    page.find(:xpath, button_proceed_to_checkout).click
  end
end
