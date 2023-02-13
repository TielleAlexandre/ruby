# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


coins = [
                { description: "Homes",
                  acronym: "hm",
                  url_image: "https://upload.wikimedia.org/wikipedia/pt/0/02/Homer_Simpson_2006.png",
                },
                {
                description: "Pudim",
                acronym: "Puds",
                url_image: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg1CJV5Xfhg2bT2nlEsGgGr26ffkl3lMdus7wIo3lbwXl6QZ2MkCRhbex3bO2mqfyHEtO9i9QtLCGDusXSPqxvDS6lGs8Cjeru0Sj5C_p0RIs7q6K9USDBPftqxOkBKMpMawKDP7ar6qkZ8OWWdZ0ksZy_4Przy9dPAZXlBddqr6Fc9xkwGJ55ZYfhY/s1024/Sonic%20imagem%20png.png",
                },
                {
                  description: "Brunis",
                  acronym: "Bru",
                  url_image: "https://i.pinimg.com/originals/60/cd/ff/60cdff33a7c7d255fb8ec3c153f4ccd8.png",
                }
        ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end