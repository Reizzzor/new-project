# Новый проект

## Сборка

```bash
make install
```
`GITHUB_API_TOKEN` нужно указать только один раз, он будет сохранен в `.env` файле

## Запуск
Сброс базы данных, выполнение всех миграций и заполнение начальными данными
```bash
make db-migrate-fresh
```
Запуск проекта
```bash
make start
```
Запуск в общей сети Docker, необходимо для сетевого взаимодействия нескольких проектов
```bash
make start-ext
```
Удаление всех сервисов
```bash
make shutdown
```

## Разработка
Создание файла миграции, необходимо, чтобы созданный файл в контейнере Docker имел доступ к записи
```bash
make migration name=...
```

## Тестирование
```bash
# Валидации оформления кода
make cs
# Запуск unit-тестов
make test
```
Ускоренный запуск unit-тестов без анализа покрытия
```bash
make test-fast
```
Полная проверка проекта, валидация оформления кода и unit-тесты
```bash
make full-check
```
