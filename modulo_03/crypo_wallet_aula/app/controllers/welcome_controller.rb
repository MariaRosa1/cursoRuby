class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby"
    session[:curso] = 'O dado'
    @meu_nome = params[:nome]
    @idade = params[:idade]
    @curso = 'Rails'
  end
end
