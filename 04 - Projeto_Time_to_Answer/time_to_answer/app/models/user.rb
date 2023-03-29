class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  # permite que os dados de outras tabelas sejam recebidos. E tbm não permite que uma vez
  # criado o perfil, ele não seja excluído
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank
  #validations
  # validação apenas na atualização
  validates :first_name, presence: true, length: {minimum: 3}, on: :update

  private

  #atributos virtuais
  def full_name
    [self.first_name, self.last_name].join(' ')
  end

end
