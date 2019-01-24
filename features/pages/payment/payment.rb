class Payment < SitePrism::Page
  @@payment = YAML.load_file("features/pages/payment/payment.yml")
  $order_sucess = ""

  def is_payment
    title_page_payment = @@payment["title_page_payment"]
    is_payment = has_xpath? title_page_payment
    if is_payment == true
      p "Você esta na pagina de pagamento"
      click_button_pay_by_bank_wire
      is_i_confirm_my_order
    end
  end

  def click_button_pay_by_bank_wire
    button_pay_by_bank_wire = @@payment["button_pay_by_bank_wire"]
    button_i_confirm_my_order = @@payment["button_i_confirm_my_order"]
    has_xpath? button_pay_by_bank_wire
    page.find(:xpath, button_pay_by_bank_wire).click
    has_xpath? button_i_confirm_my_order
    page.find(:xpath, button_i_confirm_my_order).click
  end

  def is_i_confirm_my_order
    title_finish_order = @@payment["title_finish_order"]
    title_finish_order = has_xpath? title_finish_order

    if title_finish_order == true
      p "Você esta na pagina de confirmação de pagamento"
      title_finish_order = @@payment["title_finish_order"]
      messege = find(:xpath, title_finish_order).text
      if messege == "Your order on My Store is complete."
        p "Seu pedido foi finalizado com sucesso!!!"
      end
    end
  end
end
