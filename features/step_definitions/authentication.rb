Dado("cadastro o meu usuário") do
  authentication.is_authentication
  authentication.click_create_account
  account.is_account
  account.create_new_register
  address.is_address
end
