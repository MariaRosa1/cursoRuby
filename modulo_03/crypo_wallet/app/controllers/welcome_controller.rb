class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @idade = params[:idade]
    @curso = 'Rails'
  end
end
