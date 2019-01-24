class Account < SitePrism::Page
  @@account = YAML.load_file("features/pages/account/account.yml")

  def is_account
    title_page_account = @@account["title_page_account"]
    is_account = has_xpath? title_page_account
    if is_account == true
      p "Você está na pagina minha conta."
    end
  end

  def create_new_register
    import_elements_register
    first_name = FFaker::Name.name 
    last_name = FFaker::Name.first_name
    password = "123456"
    address1 = FFaker::Address.street_name
    address2 = FFaker::Address.secondary_address
    company = FFaker::Company.name
    address3 = FFaker::Company.suffix
    address4 = FFaker::Company.suffix
    city = FFaker::Address.city
    mobile_phone = "(11) 9999-99999"
    adress_reference = FFaker::Address.secondary_address

    page.find(:css, @input_mr).click
    page.find(:xpath, @input_first_name).set first_name
    page.find(:xpath, @input_last_name).set last_name
    page.find(:xpath, @input_password).set password
    page.find(:xpath, @input_first_address).set address1
    page.find(:xpath, @input_last_address).set address2
    page.find(:xpath, @input_company).set company
    page.find(:xpath, @input_adress1).set address3
    page.find(:xpath, @input_adress2).set address4
    page.find(:xpath, @input_city).set city
    page.find(:xpath, @select_state).click
    page.find(:xpath, @input_zip_postal_code).set "00000"
    page.find(:xpath, @input_mobile_phone).set mobile_phone
    page.find(:xpath, @input_adress_reference).set adress_reference
    page.find(:xpath, @button_create_account).click
    page.find(:xpath, @input_last_name).set last_name
    page.find(:xpath, @input_password).set password
    page.find(:xpath, @button_create_account).click


  end

  def import_elements_register
    @input_mr = @@account["input_mr"]
    @input_first_name = @@account["input_first_name"]
    @input_last_name = @@account["input_last_name"]
    @input_password = @@account["input_password"]
    @input_first_address = @@account["input_first_address"]
    @input_last_address = @@account["input_last_address"]
    @input_company = @@account["input_company"]
    @input_adress1 = @@account["input_adress1"]
    @input_adress2 = @@account["input_adress2"]
    @input_city = @@account["input_city"]
    @select_state = @@account["select_state"]
    @input_zip_postal_code = @@account["input_zip_postal_code"]
    @select_country = @@account["select_country"]
    @input_mobile_phone = @@account["input_mobile_phone"]
    @input_adress_reference = @@account["input_adress_reference"]
    @button_create_account = @@account["button_create_account"]
  end
end
