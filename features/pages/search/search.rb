class Search < SitePrism::Page
  @@search = YAML.load_file("features/pages/search/search.yml")

  def click_button_add_to_cart
    button_add_to_cart = @@search["button_add_to_cart"]
    has_xpath? button_add_to_cart
    page.all(:xpath, button_add_to_cart)[0].click
    # page.all(:xpath, ".//li/descendant::a[contains(@title, #{$result})]/parent::h5/following-sibling::div[2]/a[1]")[0].click
  end

  def click_button_proceed_to_checkout
    button_proceed_to_checkout = @@search["button_proceed_to_checkout"]
    has_xpath? button_proceed_to_checkout
    page.find(:xpath, button_proceed_to_checkout).click
  end
end
