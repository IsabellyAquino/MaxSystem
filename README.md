<h1 align="center"> Sistema de agendamento de academia </h1>

<p align="center">Aplicação desenvolvida MVP(Minimum Viable Product) para resolução de um problema apresentado pelo Senai no curso técnico em Desenvolvimento de Sistemas. O projeto é um CRUD simples no padrão arquitetura MVC(Model-View-Controller) relacionado a agendamento de academia.
 <br/>
</p>


## 💻 Projeto

O principal objetivo deste projeto é fornecer uma solução básica para a gestão de horários para agendamento de academia. É uma ferramenta que permite aos usuários:

- Inserir informações de novos agendamentos, com a data, hora e número do apartamento.
- Pesquisar agendamentamento por apartamento.
- Editar informações de agendamentos existentes.
- Listar todos os agendamentos armazenados no banco de dados ordenados por data e hora.
- Excluir agendamentos do banco de dados.



### 📋 Pré-requisitos

Antes de executar a aplicação, é necessário configurar o ambiente. Certifique-se de que o seguinte está instalado e configurado em sua máquina:

- Java Development Kit (JDK)
- MySQL Server
- IDE de sua escolha (Eclipse, IntelliJ IDEA, etc.)
- Maven (gerenciador de dependências)
- Server WildFly

Além disso, você precisará criar um banco de dados MySQL para armazenar as informações dos agendamentos. O script SQL para a criação do banco pode ser encontrado no diretório sql deste projeto.

## 📦 Implantação

Para implantar o sistema em um ambiente de produção, você precisará de um servidor web compatível com aplicativos Spring Boot. Consulte a documentação do Spring Boot para obter mais informações sobre implantação.


### 🔧 Instalação

Aqui estão os passos para configurar o ambiente de desenvolvimento:

Clone o repositório para sua máquina local:

git clone https://github.com/IsabellyAquino/MaxSystem.git

## Executando a aplicação

Importe o projeto para a IDE de sua escolha.

Configure as informações de conexão com o banco de dados no arquivo src/main/java/dao/AgendarDAO.java.

Execute a aplicação selecionando o projeto desenvolvido com o botão direito do mouse em seguida executando  Run as/Run on Server, selecione WidFly e Finish.  

Abra um navegador da web e acesse a interface de usuário (geralmente, em http://localhost:8080/sa6).


## 🛠️ Tecnologias Utilizadas

- Linguagem de programação: Java
- Padrão de arquitetura: MVC (Model-View-Controller)
- Framework: Spring Boot
- Framework Web: Spring Web
- Framework de persistência: Spring Data JPA
- Frontend: Bootstrap, HTML e CSS
- Banco de dados: MySQL
- IDE: Eclipse
- WildFly
