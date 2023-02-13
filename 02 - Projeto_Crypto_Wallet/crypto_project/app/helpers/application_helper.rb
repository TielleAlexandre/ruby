module ApplicationHelper

  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def application_name
    "CRYPTO_PROJECT"
  end

  def locale
    I18n.locale == :en ? "Estados Unidos" : "Português do Brasil"
  end

end
