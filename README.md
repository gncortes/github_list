# github_list
#### Um aplicativo que lista os 100 primeiros repositórios criado nos Github 

### Processo de instalação do aplicativo, no seu terminal na raiz do projeto digite os seguintes comandos:
##### flutter pub get 
##### flutter run
##### Para executar os testes integrados: flutter drive --driver=test_driver/integration_test.dart --target=integration_test/widget_test.dart


## Design do projeto baseado no Drive Domain Design
### Estrutura (diretório lib): 
##### presentation : Camada responsável pela Interface de Usuário, as telas e componentes são encontrados aqui.
##### application : Camada responsável pelo Gerenciamento de Estados da aplicação, as stores mobx são encontradas aqui.
##### domain: Camada responsável pelas classes de dados, tipos de erros, regra de negócio e interfaces a serem implementadas pela camada mais externa.
##### infraestructure: Camada responsável por implementar as interfaces do domínio da aplicação, é aqui onde fica a conexão com repositórios externos e gerenciamento de armazenamento local do aplicativo.

# Meu perfil no linkedin
https://www.linkedin.com/in/gabriel-novais-b063151a2/
