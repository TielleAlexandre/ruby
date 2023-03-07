namespace :dev do

  DEFAULT_PASS =123456

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
end









