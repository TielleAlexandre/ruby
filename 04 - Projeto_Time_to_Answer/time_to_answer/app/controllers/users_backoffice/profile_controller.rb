class UsersBackoffice::ProfileController < UsersBackofficeController
  before_action :set_user
  before_action :verifyPasswordAndPassword_confirmationIsNotNull, only: [:update]

  def edit
    #para que os compos de user_profile aparecem no formulário, caso o user_profile não exista
    @user.build_user_profile if @user.user_profile.blank?
  end

  def update
    if @user.update(params_user)
      #Após a atualização da senha, o usuário não precisa fazer login novamente
      bypass_sign_in(@user)
      redirect_to users_backoffice_profile_path, notice: "Usuário atualizado com sucesso"
    else
    render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def params_user
    params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,user_profile_attributes: [:address, :gender, :birthdate])
  end

  def verifyPasswordAndPassword_confirmationIsNotNull
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
