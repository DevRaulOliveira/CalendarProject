# Calendar Project

![image](https://github.com/user-attachments/assets/73414eaf-081f-4991-86c8-c5d9bf6e547e)

Essse arquivo contem as informações a respeito do projeto de Calendário. A documentação visa incluir também especificações tecnicas e outras informações a respeito do projeto de forma organizada.

## Especificações

O projeto até o momento possui como conteúdo uma planilha do excel em formato CSV. Contendo todas as informações a respeito de todos os feriados do País.
Está em fase de migração para uma tabela em Cloud, utilizando o serviço da AWS RDS, sendo armazenado no PostgreSQL **sem o serviço Aurora** incluso.

## Base de dados

A base de dados da tabela de feriados, poderá possuir **uma dimensão de 7MB** de tamanho, sendo uma tabela leve e podendo ser armazenada utilizando recursos gratuitos.

## Queries

As queries do projeto Calendar estão salvas na pasta desse repositório [Queries](https://wiki.python.org.br/CoresNoTerminal)------. Todas as Queries foram desenvolvidas utilizando como base o Oracle SQL, tendo em vista que esse é o banco de dados que irá armazenar as informações, a versão do **Oracle é a 23.1.1**.
