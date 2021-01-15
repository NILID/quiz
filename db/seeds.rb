author = User.first

themes = [
'Загадки',
'Политики',
]

themes.each { |theme| Theme.create(title: theme) }

Question.create!(title: 'Назовите президента России', author: author, theme: Theme.last, answers_attributes: { '0': {title: "Путин", correct: true}, '1': {title: "Горбачев"}, '2': {title: "Сталин"}, '3': {title: "Навальный"} })
