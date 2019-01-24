module Screenshots
  def save_screenshot(name_file, result)
    data = "#{Time.now.strftime("%Y/%B/%d")}"
    hora = "#{Time.now.strftime("%H-%M-%S")}"

    directory_file = "report/screenshots/test_#{result}"
    screenshots = "#{directory_file}/#{data}/#{hora}/#{name_file}.png"
    page.save_screenshot(screenshots)
    embed(screenshots, 'image / png', "Clique aqui, para visualizar a imagem")
  end
end
