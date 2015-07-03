# Ruby on Rails I18n

* Use method `t` or `l` into views to call I18n of this page.
* Don't use locales on models and services
* Avoid using quotation marks or single quotes without

## Files organization

Languages are primarily stored in directories, i.e.:

* `config/locales/pt-BR/...`
* `config/locales/en/...`
* `config/locales/es/...`

Inside languages directories we use the following structure:

* **Enums**: `enumerations/`

  Stores EnumerateIt locales, and each enum is a file. For example: `Sex` - `config/locales/pt-BR/enumerations/sex.yml`

  ```yml
  pt-BR:
    enumerations:
      sex:
        male: Masculino
        female: Feminino
  ```

* **Models**: `models/`

  Stores model locales, and each model is a file too. For example: `Post` - `config/locales/pt-BR/models/post.yml`


  ```yml
  pt-BR:
    activerecord:
      models:
       post:
          one: Post
          other: Posts
      attributes:
        post:
          title: Título
          body: Texto
          slug: URL
  ```

* **Vendors**: `vendors/`

  Stores rails, responders, devise, and any other gems in each file. For example: `config/locales/pt-BR/vendors/devise.yml` and `config/locales/pt-BR/vendors/rails.yml`

* **Views**: `views/`

  Because views aren't organized in specific classes, we use the following structure in YAML files:

  * For common things like add, cancel, ...:

    ```yml
    pt-BR:
      views:
        common:
          add: Adicionar
          cancel: Cancelar
          delete: Excluir
    ```

  * For project branch and infos:

    ```yml
    pt-BR:
      views:
        project:
          name: Meu Projeto Legal!
    ```

  * For common sections in the project like toolbar, etc:

    ```yml
    pt-BR:
      views:
        toolbar:
          my_account: Minha Conta
          logout: Sair
    ```

  * Controllers, for example `ClientsController`:

    ```yml
    pt-BR:
      views:
        clients:
          index:
            title: Cadastro de Clientes
            grid:
              # grid locales

          show:
            title: '%{name}'

          new:
            title: Adicionar Novo Cliente
            form:
              # form locales, but prefer SimpleForm's locales

          edit:
            title: 'Editar %{name}'
            form:
              # form locales, but prefer SimpleForm's locales
    ```

And, the most important: When you're working in a Gem/Rails Engine **never** forget to add the namespaces:

* Enums:

  ```yml
  pt-BR:
    enumerations:
      project_name/sex:
        male: Masculino
        female: Feminino
  ```

* Models:

  ```yml
  pt-BR:
    activerecord:
      models:
       project_name/post:
          one: Post
          other: Posts
      attributes:
        project_name/post:
          title: Título
          body: Texto
          slug: URL
  ```

* Views:

  ```yml
  pt-BR:
    views:
      project_name:
        # ...
  ```
