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
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASS,
      password_confirmation: DEFAULT_PASS
    )
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









