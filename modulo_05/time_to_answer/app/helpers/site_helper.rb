module SiteHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas"
    when 'questions'
      "Resultado para a pesquisa \"#{params[:term]}\""
    when 'subject'
      "Mostrando questões para assunto #{params[:subject]}"
    end
  end
end
