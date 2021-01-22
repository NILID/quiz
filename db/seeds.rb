puts '-'*50
puts 'Please, run db:seed once, no more =)'
puts '-'*50


author = User.first

themes = [{
     title: 'Политики',
     questions: [
                  {title: 'Назовите президента России в 2002 году', answers_attributes: { '0': {title: 'Путин', correct: true}, '1': {title: 'Горбачев'}, '2': {title: 'Сталин'}, '3': {title: 'Навальный'}}},
                  {title: 'Кто обещал "мочить в сортире"', answers_attributes: { '0': {title: 'Путин', correct: true}, '1': {title: 'Горбачев'}, '2': {title: 'Сталин'}, '3': {title: 'Навальный'}}},
                  {title: 'Кто обещал показать "Кузькину мать"', answers_attributes: { '0': {title: 'Хрущев', correct: true}, '1': {title: 'Сталин'}, '2': {title: 'Брежнев'}, '3': {title: 'Путин'}}},
                  {title: 'Назовите президента США в 2020 году', answers_attributes: { '0': {title: 'Трамп', correct: true}, '1': {title: 'Байден'},   '2': {title: 'Кличко'}, '3': {title: 'Навальный'}}},
                  {title: 'У какого революционера кличка была "Старик"', answers_attributes: { '0': {title: 'Ленин', correct: true}, '1': {title: 'Сталин'}, '2': {title: 'Берия'}, '3': {title: 'Троцкий'}}},
                  {title: 'Кто так и не смог поступить в Венскую художественную школу? А жаль...', answers_attributes: { '0': {title: 'Гитлер', correct: true}, '1': {title: 'Муссолини'}, '2': {title: 'Наполеон'}, '3': {title: 'Сталин'}}},
                  {title: 'Кто получил прозвище "Кровавый"', answers_attributes: { '0': {title: 'Николай II', correct: true}, '1': {title: 'Александр III'}, '2': {title: 'Иван IV'}, '3': {title: 'Сталин'}}},
                  {title: 'При ком была Олимпиада-80', answers_attributes: { '0': {title: 'Брежнев', correct: true}, '1': {title: 'Андропов'}, '2': {title: 'Черненко'}, '3': {title: 'Горбачев'}}},
                  {title: 'Самый долгоживущий правитель России в истории (на 2020 год)', answers_attributes: { '0': {title: 'Горбачев', correct: true}, '1': {title: 'Путин'}, '2': {title: 'Сталин'}, '3': {title: 'Брежнев'}}},
                  {title: 'Первый президент США', answers_attributes: { '0': {title: 'Вашингтон', correct: true}, '1': {title: 'Джефферсон'}, '2': {title: 'Гаррисон'}, '3': {title: 'Тайлер'}}},
                  {title: 'Первый президент России', answers_attributes: { '0': {title: 'Ельцин', correct: true}, '1': {title: 'Путин'}, '2': {title: 'Горбачев'}, '3': {title: 'Медведев'}}},
                  {title: 'Танцевал на сцене с Осиным', answers_attributes: { '0': {title: 'Ельцин', correct: true}, '1': {title: 'Путин'}, '2': {title: 'Горбачев'}, '3': {title: 'Медведев'}}}
                ]
}, {
     title: 'Имена',
     questions: [
                  {title: 'Имя российского поэта Есенина', answers_attributes: { '0': {title: 'Сергей', correct: true}, '1': {title: 'Иван'}, '2': {title: 'Алексей'}, '3': {title: 'Константин'}}},
                  {title: 'Как зовут Обломова в одноименном романе',    answers_attributes: { '0': {title: 'Илья', correct: true}, '1': {title: 'Петр'},   '2': {title: 'Александр'}, '3': {title: 'Роман'}}},
                  {title: 'Самое популярное мужское имя в Москве в 2020 году', answers_attributes: { '0': {title: 'Александр', correct: true}, '1': {title: 'Дмитрий'},   '2': {title: 'Даниил'}, '3': {title: 'Иван'}}},
                  {title: 'Дополните: "Выходила на берег ..."', answers_attributes: { '0': {title: 'Катюша', correct: true}, '1': {title: 'Настюша'},   '2': {title: 'Павлушка'}, '3': {title: 'Ивашка'}}},
                  {title: 'У какого мужского имени нет женской формы', answers_attributes: { '0': {title: 'Андрей', correct: true}, '1': {title: 'Антон'}, '2': {title: 'Александр'}, '3': {title: 'Виктор'}}},
                  {title: 'Как зовут известного автогонщика Шумахера', answers_attributes: { '0': {title: 'Михаэль', correct: true}, '1': {title: 'Михаил'}, '2': {title: 'Ральф'}, '3': {title: 'Микаэль'}}}
                ]
}]

themes.each do |t|
  theme = Theme.create!(title: t[:title])

  t[:questions].each do |question|
    Question.create!(title: question[:title], author: author, theme: theme, answers_attributes: question[:answers_attributes])
  end
end