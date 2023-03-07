class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :verifyPasswordAndPassword_confirmationIsNotNull, :search_admin_update, only: [:update]
  before_action :search_admin, only: [:edit, :destroy]

  def index
    @admins = Admin.all.page(params[:page])
  end

  # Ao clicar no botão de edição de um elemente
  def edit
  end

  # Ao clicar no botão atualizar
  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_index_path, notice: "Administrador atualizado."
    else
      render :edit
    end
  end

  # Ao clicar no botão adicionar novo elemento
  def new
    @admin = Admin.new
  end

  # Ao salvar um novo elemento de fato
  def create
    @admin = Admin.new(params_admin)
    if @admin.save()
      redirect_to admins_backoffice_admins_index_path, notice: "Administrador cadastrado."
    else
      render :new
    end
  end
  def destroy
    if @admin.destroy
      redirect_to admins_backoffice_admins_index_path, notice: "Administrador excluído."
    else
      render :index
    end
  end

  # Possibilitando que esses métodos fiquem encapsulados
  private

  def params_admin
    params.require(:admin).permit(:id,:email,:password,:password_confirmation)
  end
  def search_admin
    @admin = Admin.find(params[:format])
  end
  def search_admin_update
    @admin = Admin.find(params[:admin][:id])
  end
  def verifyPasswordAndPassword_confirmationIsNotNull
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
