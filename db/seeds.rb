author = User.first

themes = [{
         title:'Политики',
     questions: [
                  {title: 'Назовите президента России', answers_attributes: { '0': {title: "Путин", correct: true}, '1': {title: "Горбачев"}, '2': {title: "Сталин"}, '3': {title: "Навальный"}}},
                  {title: 'Назовите президента США',    answers_attributes: { '0': {title: "Трамп", correct: true}, '1': {title: "Байден"},   '2': {title: "Кличко"}, '3': {title: "Навальный"}}}
                ]
}]

themes.each do |t|
  theme = Theme.create!(title: t[:title])

  t[:questions].each do |question|
    Question.create!(title: question[:title], author: author, theme: theme, answers_attributes: question[:answers_attributes])
  end
end