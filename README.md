# <img src= "src/assets/image/logo1.png" width=30px> Tapiocaria GlauGlau
<div align="center">

<img src= "src/assets/image/logo2.png" width=290px>
</div>

Site de uma tapiocaria / Lanchonete, o design do projeto é inspirado em um totem de autoatendimento, e a versão mobile é inspirado em apps de delivery. Esse projeto é um trabalho da faculdade, na disciplina de Web I.

## <img src= "src/assets/image/logo1.png" width=30px> Topicos

- [Descrição do Projeto](#descrição-do-projeto)
- [Screenshots Do Projeto](#screenshots-do-projeto)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Endpoints da API](#endpoints-da-api)
- [Como Executar o Projeto Localmente](#como-executar-o-projeto-localmente)
- [Como Configurar o Banco De Dados](#como-configurar-o-banco-de-dados)
- [Licença](#licença)
- [Contato](#contato)

## <img src= "src/assets/image/logo1.png" width=30px> Descrição do Projeto

Este projeto é **uma aplicação web para uma lanchonete/tapiocaria**, desenvolvida para proporcionar uma experiência intuitiva e prática para os clientes. O site permite que os usuários escolham seus lanches de forma rápida e eficiente, com um fluxo de navegação otimizado tanto para **autoatendimento em totens** (quando integrado ao Electron) quanto para uso em **dispositivos móveis**, onde o design se adapta para parecer um aplicativo de pedidos.

### Funcionalidades principais:

**Tela de entrada:** O usuário escolhe se é um cliente cadastrado ou não.
- Se **cadastrado**, insere o CPF para login e é direcionado à página de vendas.
- Se **não cadastrado**, acessa diretamente a página de vendas sem necessidade de login.

**Página de vendas:** O cliente pode navegar entre três categorias de lanches:
- Tapiocas
- Sanduíches
- Cuscuz

**Seleção de lanches:**

- Ao escolher uma categoria, é exibida uma lista de lanches disponíveis.
- O primeiro item da lista é um lanche personalizável, onde o cliente pode escolher os recheios.

Esse sistema foi projetado para ser facilmente adaptado a um **totem de autoatendimento** utilizando **Electron**, garantindo uma experiência fluida em estabelecimentos físicos. Além disso, quando acessado via **dispositivos móveis**, o layout se transforma para simular um **aplicativo de pedidos**, tornando o uso ainda mais intuitivo.

## <img src= "src/assets/image/logo1.png" width=30px> Screenshots Do Projeto
**Screenshots Mobile - (Clique nas imagens para amplia-las)**

<div class="mobile">
  Atualização em breve 

</div>

**Screenshots Desktop - (Clique nas imagens para amplia-las)**

<div class="desktop">

  <img src="readme/Desktop/image.png"  width="100%">
  <img src="readme/Desktop/image-1.png"  width="49.5%">
  <img src="readme/Desktop/image-2.png"  width="49.5%">

</div>



## <img src= "src/assets/image/logo1.png" width=30px> Tecnologias Utilizadas

- **Frontend**:

  [![My Skills](https://skillicons.dev/icons?i=js,html,css)](https://skillicons.dev)

- **Backend**:
  
  [![My Skills](https://skillicons.dev/icons?i=spring,kotlin,postgres)](https://skillicons.dev)

- **APIs**:
  - Endpoints RESTful para gerenciamento de alimentos, recheios e vendas
    

## </> Endpoints da API

Atualização em breve

## </> Estrutura do Banco de Dados

Atualização em breve 

## </> Como Executar o Projeto Localmente

1. Clone este repositório:
   ```bash
   git clone git clone https://github.com/Glauedson/Tapiocaria.git
   ```
2. Navegue até o diretório do projeto:
   ```bash
   cd Tapiocaria
   ```

4. Abra o arquivo `index.html` no navegador ou rode localmente com um servidor (ex: `Live Server` no VS Code).

## </> Como Configurar o Banco De Dados

Como configurar o banco de dados PostgreSQL e executar os scripts `create.sql` e `insert.sql` para iniciar corretamente o jogo.

### 1. Instalar o PostgreSQL

Se ainda não possui o PostgreSQL instalado, siga os passos abaixo:

1. Baixe o instalador do PostgreSQL no site oficial: 

    ```http
    https://www.postgresql.org/download/
    ```

2. Durante a instalação, defina uma senha para o usuário postgres.

3. Certifique-se de instalar o **pgAdmin** para gerenciar o banco de forma visual (opcional).

### 2. Criando o Banco de Dados

Após instalar o PostgreSQL, siga os passos para criar o banco de dados:

**Usando o pgAdmin:**

1. Abra o **pgAdmin**.

2. Conecte-se ao servidor PostgreSQL.

3. Clique com o botão direito em **Databases** e selecione **Create > Database**.

4. No campo **Database name**, insira `witl` e clique em **Save**.

**Usando o terminal (psql):**

1. Abra o terminal e execute:

    ```ps
    psql -U postgres
    ``` 
2. Digite a senha do usuário `postgres`.

3. Crie o banco de dados com:
    ```sql
    CREATE DATABASE Tapiocas;
    ```

### 3. Executando os Scripts SQL

Agora, vamos criar as tabelas e inserir os dados iniciais.

**Usando o pgAdmin:**

1. No **pgAdmin**, expanda **Databases > Tapiocas > Schemas > public**.

2. Clique em **Query Tool**.

3. Copie e cole o conteúdo do arquivo `create.sql` e execute.

4. Faça o mesmo para `insert.sql`.

**Usando o terminal (psql):**

1. No terminal, conecte-se ao banco de dados:
    ```ps
    psql -U postgres -d witl_db
    ```
2. Execute os arquivos SQL:
    ```bash
    \i /caminho/para/create.sql
    \i /caminho/para/insert.sql
    ```

### 4. Verificando os Dados

Após rodar os scripts, você pode conferir se os dados foram inseridos corretamente.

No **pgAdmin** ou no **terminal**, execute:

```sql
SELECT * FROM sanduiches;
```

Isso deve exibir os sanduiches do catalogo.

## 📄 Licença

Este projeto não possui uma licença definida. Sinta-se livre para utilizar e modificar o código conforme necessário.

## 📩 Contato

Para dúvidas ou sugestões, entre em contato:

- **Nome**: Glauedson Carlos Rodrigues
- **Email**: (gluedson18s@gmail.com)
