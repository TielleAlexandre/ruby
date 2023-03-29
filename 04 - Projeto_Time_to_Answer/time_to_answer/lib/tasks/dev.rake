namespace :dev do

  DEFAULT_PASS =123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o Ambiente de Desenvolvimento."
  task setup: :environment do
    puts "Apagando o banco de dados."
    ( %x(rails db:drop) )
    puts "Criando o banco de dados"
    ( %x(rails db:create) )
    puts "Migrando o banco de dados"
    ( %x(rails db:migrate) )
    puts "Cadastrando o admin padrão"
    ( %x(rails dev:add_default_admin) )
    puts "Cadastrando o user padrão"
    ( %x(rails dev:add_default_user) )
    puts "Cadastrando admin extras"
    ( %x(rails dev:add_extra_admins) )
    puts "Cadastrando assuntos padrões"
    ( %x(rails dev:add_subjects) )
    puts "Cadastrando perguntas e respostas"
    ( %x(rails dev:add_answers_and_questions) )
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASS,
      password_confirmation: DEFAULT_PASS
    )
  end

  desc "Adiciona o administrador extra"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASS,
        password_confirmation: DEFAULT_PASS
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASS,
      password_confirmation: DEFAULT_PASS
    )
  end

  desc "Adiciona assuntos padrões"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Adiciona perguntas e respostas"
  task add_answers_and_questions: :environment do
      Subject.all.each do |sub|
        rand(5..10).times.each do |i|
          params = create_question_params()
          answers_array = params[:question][:answers_attributes]
          add_answers(answers_array)
          elect_true_answer(answers_array)
          Question.create!(params[:question])
       end
    end
  end

  desc "Reseta o contador  dos assuntos"
  task reset_subject_counter: :environment do
    puts "Resentandos os contadores de assunto."
     Subject.all.each do |sub|
      Subject.reset_counters(sub.id, :questions)
    end
  end


  private
  def create_question_params(sub= Subject.all.sample)
  {question:{
    description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
      subject: sub,
      answers_attributes:[]
    }}
  end

  def create_answer_params(correct=false)
    {description: Faker::Lorem.sentence,
     correct: correct }
  end

  def add_answers(answers_array=[])
    (1..4).each do |item|
      answers_array.push(
        create_answer_params
      )
    end
  end

  def  elect_true_answer(answers_array=[])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end
end








