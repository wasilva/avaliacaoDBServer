Dir[File.join(File.dirname(__FILE__), "../pages/*_page.rb")].each { |file| require file }

module PagesObjects
  def screenshots(file_name, result)
    directory_file = "results/screenshots/test#{result}"
    printscreen = "#{directory_file}/#{file_name}.png"
    page.save_screenshot(printscreen)
    embed(printscreen, "image/png", "Clique aqui, para ver a imagem ")
  end

  def home
    @home ||= Home.new
  end

  def search
    @search ||= Search.new
  end

  def cart
    @cart ||= Cart.new
  end

  def authentication
    @authentication ||= Authentication.new
  end

  def account
    @account ||= Account.new
  end

  def address
    @address ||= Address.new
  end

  def shipping
    @shipping ||= Shipping.new
  end

  def payment
    @payment ||= Payment.new
  end
end
