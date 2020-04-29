# README
## Для работы необходим docker/docker-compose и свободный 3000-й порт

## Краткое описание

Проект с использованием Rails 5.2. Состоит из планировщика и веб-приложения с двумя точками входа:
- для диспетчера `http://localhost`
- веб-сокет ActionCable `/cable`

Аутентификация/авторизация не предусмотрена

На главной странице выведен список рейсов, который был заполнен посредством вызова `db:seed`. Если вызвать `db:seed`
повторно, таблица с вылетами очистится и заполнится новыми значениями, при этом все состояния будут сброшены.


## Первый запуск
`cd project_dir && docker-compose build && docker-compose run --rm web bash -c "bundle && bundle exec rails db:create db:migrate db:seed"`


## Последующие запуски:

* поднять веб-сервер
`cd project_dir && docker-compose up -d`

* поднять Sidekiq
`cd project_dir && docker-compose run --rm web bash -c "bundle exec sidekiq"`


## Запуск тестов
`docker-compose run --rm web bash -c "COVERAGE=Y bundle exec rails t"`


## Запуск rubocop
`docker-compose run --rm web bash -c "bundle exec rubocop"`
