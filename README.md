# КиноПоиск API (Gem)

Этот gem создан для упрощения работы с КиноПоиск API в проектах на Ruby.
Гем рабтает через API от кинопоиска. 
Используется соответсвенно не официально, прикидываясь андройдом.

### Что нового

* Изменено название гема.
* Восстановленна работа API использует последню версию подписи 5.0.0.
* Написны тесты.

## Установка

Добавьте эту строку в Gemfile вашего приложения:

```ruby
gem 'KpApi'
```

Затем выполните:

    $ bundle


## Использование

### Глобальные функции

```ruby
api = KinopoiskAPI::Class 
```

```ruby
api.status 
#   > true  [Полученна следующая станица]
#   > false [Достигли конца пагинации]
```

```ruby
#   Оригинальный хеш кинопоиска
api.data 
```

```ruby
#   Оригинальный хеш кинопоиска (используется в некоторых классах для дополнительного запроса). 
#   Пример: __film.peoples_full__)
api.data2 
```

```ruby
#   Статус парсинга json 
#   Boolean
api.status 
```

```ruby
#   Статус парсинга json дополнительного запроса.
#   Boolean
api.status2
```

### Исключения 

При ошибке выбасывается исключение __KpApi::ApiError__. Доступные методы.

```ruby
# http код ответа
e.code
=> "404"
```

```ruby
# Тело ответа
e.body
=> [key:false]
```


## Классы 

### Фильм

```ruby
film = KinopoiskAPI::Film.new(film_id)
```

```ruby
#   Вся информация о фильме(включая rating, rent, budget).
film.view
```
```ruby
# Рейтинги фильма и т.д.
film.rating
```
```ruby
# Даты премьер и т.д.
film.rent
```

```ruby
# Бюджет и сборы.
film.budget
```

```ruby
# Люди связанные с фильмом(Не полный список, смотрите ниже).
film.peoples
```

```ruby
# Люди связанные с фильмом(Полный список). Генерирует новый запрос к API.
film.peoples_full
```


### Люди(Режисеры, актеры, операторы и т.д.).

```ruby
people = KinopoiskAPI::People.new(people_id)
```

```ruby
# Детальная информация о человеке.
people.view
```

```ruby
# Фильмы связанные с конкретным человеком.
people.films
```

```ruby
# Массив id фильмов связанных с конкретным человеком.
people.films_ids
```


### Категории

```ruby
category = KinopoiskAPI::Category.new
```

```ruby
# Страны
category.countries
```

```ruby
# Жанры
category.genres
```


### Сегодня в кино

```ruby
today = KinopoiskAPI::TodayFilms.new
```

```ruby
#   Список фильмов
today.view
```

```ruby
#   Массив id фильмов
today.film_ids
```

### Глобальный поиск

```ruby
search = KinopoiskAPI::GlobalSearch.new('Q')
```
```ruby
#   Скорее всего вы искали этот фильм
search.exactly
```
```ruby
#   Возможно, вы искали эти фильмы
search.maybe
```
```ruby
#   Или даже этих людей
search.peoples
```


### Поиск по фильмам

```ruby
search = KinopoiskAPI::FilmSearch.new('Q')
```

```ruby
#   Список фильмов (не более 20)
search.view
```

```ruby
#   Колличество найденных фильмов
search.films_count
```

```ruby
#   Текущая страница
search.current_page
```

```ruby
#   Колличество страниц
search.page_count
```

```ruby
#   Следующая страница
search.next_page
#   > true  [Полученна следующая станица]
#   > false [Достигли конца пагинации]
```


### Поиск по людям

```ruby
search = KinopoiskAPI::PeopleSearch.new('Q')
```

```ruby
#   Список людей (не более 20)
search.view
```

```ruby
#   Колличество найденных фильмов
search.peoples_count
```

```ruby
#   Текущая страница
search.current_page
```

```ruby
#   Колличество страниц
search.page_count
```

```ruby
#   Следующая страница
search.next_page
#   > true  [Полученна следующая станица]
#   > false [Достигли конца пагинации]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

