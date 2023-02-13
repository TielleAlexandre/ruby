class WelcomeController < ApplicationController
  def index
    #@nome="Tielle"
    @nome= params[:nome]
    cookies[:curso] ="Curso de Ruby on Rails - COOKIE"
    session[:curso] ="Curso de Ruby on Rails - SESSION"
  end
end
