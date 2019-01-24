class Authentication < SitePrism::Page
  @@authentication = YAML.load_file("features/pages/authentication/authentication.yml")
  $email_faker = ""

  def is_authentication
    title_page_authentication = @@authentication["title_page_authentication"]
    is_authentication = has_xpath? title_page_authentication
    if is_authentication == true
      p "Você está na pagina de autenticação."
    end
  end

  def click_create_account
    email_faker = FFaker::Internet.email
    button_create_account = @@authentication["button_create_account"]
    input_email = @@authentication["input_email"]
    has_css? input_email
    page.all(:css, input_email)[0].set email_faker
    has_css? button_create_account
    page.find(:css, button_create_account).click
  end
end
