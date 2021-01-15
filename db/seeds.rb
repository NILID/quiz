author = User.first

themes = [
'Загадки',
'Политики',
]

themes.each { |theme| Theme.create(title: theme) }

Question.create!(title: 'Назовите президента России', author: author, answers_attributes: { '0': {title: "Путин"}, '1': {title: "Горбачев"}, '2': {title: "Сталин"}, '3': {title: "Навальный"} })
