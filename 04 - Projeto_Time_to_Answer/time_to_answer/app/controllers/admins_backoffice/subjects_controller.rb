class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :search_subject, only: [:edit, :destroy]
  before_action :search_subject_update, only: [:update]

  def show
    @subjects = Subject.all.order(:description).page(params[:page])
  end

  # Ao clicar no botão de edição de um elemente
  def edit
  end

  # Ao clicar no botão atualizar
  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: "Assunto atualizado."
    else
      render :edit
    end
  end

  # Ao clicar no botão adicionar novo elemento
  def new
    @subject = Subject.new
  end

  # Ao salvar um novo elemento de fato
  def create
    @subject = Subject.new(params_subject)
    if @subject.save()
      redirect_to admins_backoffice_subjects_path, notice: "Assunto cadastrado."
    else
      render :new
    end
  end
  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto excluído."
    else
      render :index
    end
  end

  # Possibilitando que esses métodos fiquem encapsulados
  private

  def params_subject
    params.require(:subject).permit(:id,:description)
  end
  def search_subject
    @subject = Subject.find(params[:format])
  end
  def search_subject_update
    @subject = Subject.find(params[:subject][:id])
  end
 end

