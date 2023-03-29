class Question < ApplicationRecord
  # suject conhece question e question conhece subject
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  # reject_if rejeita dados em branco de answers que vierem da view
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  paginates_per 5



  # metodos estáticos
  # #pode retirar o nome Question
  # #métodos de classe
  def self.search(page, term)
    Question.includes(:answers)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
  end
  def self.last_questions(page)
    Question.includes(:answers).order('created_at desc').page(page)
  end

  #scopes para pesquisa no BD
  scope :search, ->(page, term){
    includes(:answers, :subject)
    .where("lower(description) LIKE ?", "%#{term.downcase}%")
    .page(page)
  }
  scope :search_subject_, ->(page, subject_id){
    includes(:answers,:subject)
      .where(subject_id: subject_id)
      .page(page)
  }

  scope :last_questions, ->(page){
   includes(:answers,:subject)
     .order('created_at desc').page(page)
  }


end
