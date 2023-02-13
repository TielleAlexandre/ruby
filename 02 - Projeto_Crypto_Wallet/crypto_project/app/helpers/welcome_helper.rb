module WelcomeHelper

  def ambiente_rails
      if Rails.env.development?
        "Desenvolvimento"
      elsif Rails.env.production?
        "Produção"
      end
    end
end
