class Address < SitePrism::Page
  @@address = YAML.load_file("features/pages/address/address.yml")

  def is_address
    title_page_address = @@address["title_page_address"]
    is_address = has_xpath? title_page_address
    if is_address == true
      p "Você está na pagina de endereço."
      click_button_proced_to_checkout
    end
  end

  def click_button_proced_to_checkout
    button_proced_to_checkout = @@address["button_proced_to_checkout"]
    has_xpath? button_proced_to_checkout
    page.find(:xpath, button_proced_to_checkout).click
  end
end
