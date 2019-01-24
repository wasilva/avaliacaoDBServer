Dado("que eu acesse a pagina My Story") do
  home.load
  expect(page).to have_current_path("http://automationpractice.com/index.php", url: true)
  p "URL acessada: #{page.current_url}"
end

Dado("escolho um produto") do
  home.search_product
  home.click_button_search
  search.click_button_add_to_cart
  cart.selected_product
  search.click_button_proceed_to_checkout
  p "Produto selecionado: #{$result}"
end
