class Home < SitePrism::Page
  set_url "/"
  @@home = YAML.load_file("features/pages/home/home.yml")
  $result = ""
  # element :input_search, "#search_query_top"

  def search_product
    input_search = @@home["input_search"]
    sort_products
    has_css? input_search
    page.find(:css, input_search).set "#{$result}"
  end

  def click_button_search
    button_search = @@home["button_search"]
    sort_products
    has_css? button_search
    page.find(:css, button_search).click
  end

  def sort_products
    products = YAML.load_file("features/pages/home/home.yml")["products"]
    $result = products.sample
  end
end
