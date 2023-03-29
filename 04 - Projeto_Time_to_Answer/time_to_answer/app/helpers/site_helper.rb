module SiteHelper
  def msg_topo
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas"
    when 'questions'
      "Resultados para o termo: #{params[:term]}"
    when 'subject'
      "Exibindo as questões para o assunto: #{params[:subject_name]}"
    end
  end

end
