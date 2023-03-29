class AdminsBackoffice::QuestionsController < AdminsBackofficeController
  before_action :search_question, only: [:edit, :destroy]
  before_action :search_question_update, only: [:update]
  before_action :search_subjects, only: [:edit, :new]

  def index
    @questions = Question.all.includes(:subject)
                         .order(:description)
                         .page(params[:page])

  end

  # Ao clicar no botão de edição de um elemento
  def edit
  end

  # Ao clicar no botão atualizar
  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_index_path, notice: "Questão atualizada."
    else
      render :index
    end
  end

  # Ao clicar no botão adicionar novo elemento
  def new
    @question = Question.new
    3.times { @question.answers.build}
  end

  # Ao salvar um novo elemento de fato
  def create
    @question = Question.new(params_question)
    if @question.save()
      redirect_to admins_backoffice_questions_index_path, notice: "Questão cadastrada."
    else
      render :index
    end
  end
  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_index_path, notice: "Questão excluída."
    else
      render :index
    end
  end

  # Possibilitando que esses métodos fiquem encapsulados
  private

  def params_question
    params.require(:question).permit(:id,:description,:subject_id,
                                     answers_attributes: [:id, :description, :correct, :_destroy])
  end
  def search_question
    @question = Question.find(params[:format])
  end
  def search_subjects
    @subjects = Subject.all
  end
  def search_question_update
    @question = Question.find(params[:question][:id])
  end
end
