# Quality Monitoring MongoDB

Este projeto é uma aplicação para gerenciamento de alertas e previsões de chuva, utilizando MongoDB e ASP.NET Core. A aplicação oferece uma API RESTful para interagir com os dados, permitindo a criação, leitura, atualização e exclusão de alertas e previsões.

## Funcionalidades

- **Gerenciamento de Alertas**: Criar, ler, atualizar e excluir alertas.
- **Gerenciamento de Previsões de Chuva**: Criar, ler, atualizar e excluir previsões de chuva.
- **Documentação da API**: Utilização do Swagger para visualizar e testar as rotas da API.
- **Ambiente Contêinerizado**: Docker e Docker Compose para facilitar a execução da aplicação.

## Tecnologias Utilizadas

- ASP.NET Core
- MongoDB
- Docker
- Docker Compose
- Swagger
- Postman (para testes das requisições)
- Azure DevOps (para CI/CD)

## Como Executar

### Pré-requisitos

Antes de executar o projeto, certifique-se de que possui as seguintes tecnologias instaladas:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [ASP.NET Core](https://dotnet.microsoft.com/download/dotnet-core)
- [MongoDB](https://www.mongodb.com/try/download/community)
- [Postman](https://www.postman.com/)
- [Azure DevOps](https://azure.microsoft.com/en-us/services/devops/) (para CI/CD)

### Passos

1. Clone o repositório:

   ```bash
   git clone https://github.com/fabriciorosanet/QualityMonitoring-FIAP.git
   cd pasta de sua escolha

# CI/CD
Este projeto utiliza Azure DevOps para CI/CD, permitindo a integração contínua e a entrega contínua em dois ambientes:

### Ambientes
#### Staging: O ambiente de staging é utilizado para testes de integração e validação antes do deployment em produção.
#### Produção: O ambiente de produção é onde a aplicação é disponibilizada para os usuários finais.
### Pipeline de CI/CD
#### Build: A aplicação é construída sempre que uma alteração é feita na branch principal.
#### Testes: Os testes automatizados são executados para garantir que a aplicação funcione conforme o esperado.
### Deploy:
#### Staging: Após uma build bem-sucedida, a aplicação é implantada automaticamente no ambiente de staging.
#### Produção: Após a aprovação das mudanças no ambiente de staging, as alterações são promovidas para o ambiente de produção.

### Como Testar as Requisições (validação)
Você pode usar o Postman para testar as rotas da API. A coleção de requisições já está incluída no projeto.

### Docker
O projeto já inclui um Dockerfile e um docker-compose.yml configurados para a aplicação. Para executar a aplicação em um ambiente contêinerizado.

### Contribuição
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.