<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.1-brightgreen.svg" alt="Swift 5.1">
    </a>
</p>

Для локального развертывания сервера необходимо выполнить следующие дейсвтия:
В Терминале:
1. name$ brew install postgresql
2. name$ initdb /usr/local/var/postgres
3. name$ brew services start postgresql
4. name$ createdb mycooldb;

Далее открыть проект, в нём найти файл configure.swift и добавить в него следующие изменения:

let postgresqlConfig = PostgreSQLDatabaseConfig(
    hostname: "127.0.0.1",
    port: 5432,
    username: "vladislavfrolov", <---- заменить на собственное имя пользователя
    database: "SmartmateDatabase",
    password: nil
  )
  services.register(postgresqlConfig)
  
После этого можно собирать проект и проверять запросы по адресу: http://localhost:8080/
