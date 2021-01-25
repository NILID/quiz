puts '-'*50
puts 'Please, run db:seed once, no more =)'
puts '-'*50

User.create!(email: 'user@mail.test',  login: 'user_test', password: '12345678', password_confirmation: '12345678')

author = User.first

unless author
  puts '!!!!  You need create one user with admin role first of all !!!!'
  return
end

themes = [
  {  title: 'Политики',
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
  ]},

  {  title: 'Имена',
     questions: [
                  {title: 'Имя российского поэта Есенина', answers_attributes: { '0': {title: 'Сергей', correct: true}, '1': {title: 'Иван'}, '2': {title: 'Алексей'}, '3': {title: 'Константин'}}},
                  {title: 'Как зовут Обломова в одноименном романе',    answers_attributes: { '0': {title: 'Илья', correct: true}, '1': {title: 'Петр'},   '2': {title: 'Александр'}, '3': {title: 'Роман'}}},
                  {title: 'Самое популярное мужское имя в Москве в 2020 году', answers_attributes: { '0': {title: 'Александр', correct: true}, '1': {title: 'Дмитрий'},   '2': {title: 'Даниил'}, '3': {title: 'Иван'}}},
                  {title: 'Дополните: "Выходила на берег ..."', answers_attributes: { '0': {title: 'Катюша', correct: true}, '1': {title: 'Настюша'},   '2': {title: 'Павлушка'}, '3': {title: 'Ивашка'}}},
                  {title: 'У какого мужского имени нет женской формы', answers_attributes: { '0': {title: 'Андрей', correct: true}, '1': {title: 'Антон'}, '2': {title: 'Александр'}, '3': {title: 'Виктор'}}},
                  {title: 'Как зовут известного автогонщика Шумахера', answers_attributes: { '0': {title: 'Михаэль', correct: true}, '1': {title: 'Михаил'}, '2': {title: 'Ральф'}, '3': {title: 'Микаэль'}}}
  ]},

  {  title: 'Футбол',
     questions: [
                  {title: 'Какой клуб выиграл финал Кубка Англии 1986 года?', answers_attributes: { '0': {title: 'Ливерпуль', correct: true}, '1': {title: 'Спартак'}, '2': {title: 'Эвертон'}, '3': {title: 'Манчестер'}}},
                  {title: 'Какой вратарь является рекордсменом по количеству выигранных матчей за сборную Англии, выиграв 125 матчей за свою игровую карьеру?',    answers_attributes: { '0': {title: 'Питер Шилтон', correct: true}, '1': {title: 'Оливер Кан'}, '2': {title: 'Александр Филимонов'}, '3': {title: 'Дэвид Бекхэм'}}},
                  {title: 'Сколько голов Лиги забил Юрген Клинсманн за Тоттенхэм Хотспур в сезоне Премьер-лиги 1994/1995 во время его 41 старта в лиге?', answers_attributes: { '0': {title: '21', correct: true}, '1': {title: '20'},   '2': {title: '19'}, '3': {title: '22'}}},
                  {title: 'Кто управлял Вест Хэм Юнайтед между 2008 и 2010?', answers_attributes: { '0': {title: 'Джанфранко Зола', correct: true}, '1': {title: 'Олег Романцев'}, '2': {title: 'Илья Цымбаларь'}, '3': {title: 'Ивашка'}}},
                  {title: 'В каком году «Арсенал» переехал на стадион «Эмирейтс» из Хайбери?', answers_attributes: { '0': {title: '2006', correct: true}, '1': {title: '2007'}, '2': {title: '2005'}, '3': {title: '2004'}}},
                  {title: 'Можете назвать менеджера сборной Англии в 1977 году?', answers_attributes: { '0': {title: 'Рон Гринвуд', correct: true}, '1': {title: 'Стивен Джонс'}, '2': {title: 'Ральф Шумахер'}, '3': {title: 'Питер Гэбриэль'}}}
  ]},

  {  title: 'Страны',
     questions: [
                  {title: 'Где находится Пирамида Гизы и Большой Сфинкс?', answers_attributes: { '0': {title: 'Египет', correct: true}, '1': {title: 'Ирак'}, '2': {title: 'Тунис'}, '3': {title: 'ОАЭ'}}},
                  {title: 'Где находится Колизей?', answers_attributes: { '0': {title: 'Италия', correct: true}, '1': {title: 'Греция'}, '2': {title: 'Испания'}, '3': {title: 'Турция'}}},
                  {title: 'Где находится Ангкор-Ват?', answers_attributes: { '0': {title: 'Камбоджа', correct: true}, '1': {title: 'ОАЭ'},   '2': {title: 'Мексика'}, '3': {title: 'Турция'}}},
                  {title: 'Где находится статуя Свободы?', answers_attributes: { '0': {title: 'США', correct: true}, '1': {title: 'Канада'}, '2': {title: 'Франция'}, '3': {title: 'Англия'}}},
                  {title: 'Где находится Тадж Махал?', answers_attributes: { '0': {title: 'Индия', correct: true}, '1': {title: 'Камбоджа'}, '2': {title: 'Китай'}, '3': {title: 'Тунис'}}},
                  {title: 'Где находится Памятник Азади?', answers_attributes: { '0': {title: 'Иран', correct: true}, '1': {title: 'Ирак'}, '2': {title: 'Каир'}, '3': {title: 'Тунис'}}},
                  {title: 'Где находится Стоунхендж?', answers_attributes: { '0': {title: 'Великобритания', correct: true}, '1': {title: 'Ирландия'}, '2': {title: 'Швейцария'}, '3': {title: 'Исландия'}}},
                  {title: 'Где находится Башня чучхе?', answers_attributes: { '0': {title: 'Северная Корея', correct: true}, '1': {title: 'Южная Корея'}, '2': {title: 'Китай'}, '3': {title: 'Вьетнам'}}}
  ]}
]

themes.each do |t|
  theme = Theme.create!(title: t[:title])

  t[:questions].each do |question|
    Question.create!(title: question[:title], author: author, theme: theme, answers_attributes: question[:answers_attributes])
  end
end