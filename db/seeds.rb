author = User.first

Question.create!(title: 'Назовите президента России', author: author, answers_attributes: { '0': {title: "Путин"}, '1': {title: "Горбачев"}, '2': {title: "Сталин"}, '3': {title: "Навальный"} })

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
