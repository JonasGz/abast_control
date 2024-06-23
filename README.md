# Controle de abastecimento

O app consiste no salvamento de abastecimentos do usuário, salvando o tipo de combustível, valor gasto e localização do abastecimento.

## Getting Started

O app nesta versão inicial possui suporte para Android e iOS e disponibiliza layouts para duas possibilidades, a primeira considernado altura do dispositivo igual ou menor a 667 e outra para acima desse valor, conforme fotos abaixo:

## Features

### Login
Sistema de autenticação com o Firebase:

<img src="https://i.imgur.com/a24pORu.png" width="300" />

### Signup
Sistema de cadastro com o Firebase:

<img src="https://i.imgur.com/hF4Cp1r.png" width="300" />

### Adicionar abastecimento
A página recebe duas informações:
- Tipo de combustível
- Valor

<img src="https://i.imgur.com/oHcb8s3.png" width="300" />

### Lista de abastecimentos
A página lista os abastecimentos adicionados, informando:
- Tipo de combustível
- Valor
- Localização do abastecimento

<img src="https://i.imgur.com/Z6pYaQe.png" width="300" />

## Feature adicionais

### Adicionar foto do usuário
O app permite que o usuário tire uma fotografia durante o cadastro e salve para ter um avatar durante o uso do app.

### Localização
O app utiliza o package [Geolocator](https://pub.dev/packages/geolocator) para obter as informações de latitude e longitude no momento do abastecimento e converte as informações em endereço válido com a [API Geocoding](https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding?hl=pt-br).

### Greetings
O app possui um package [greetingspk](https://pub.dev/packages/greetingpk) que realiza a funcionalidade de saudar o usuário com bom dia, boa tarde ou boa noite conforme o horário local do dispositivo.

O package foi desenvolvido e está disponível no repositório Pub: [greetingspk](https://pub.dev/packages/greetingpk)

Obs: nessa primeira versão, possui suporte apenas para o formato horário de 24 horas.

<img src="https://i.imgur.com/YUmZHyN.png" width="300" />




