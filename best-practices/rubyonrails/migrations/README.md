# Ruby on Rails Migrations

## Creating migration

* Use good name to migrations and follow the [Ruby on Rails Guide](http://guides.rubyonrails.org/active_record_migrations.html).
* Use `rails generate model` to create table.
* Use migrations for update database values (access data). Good pattern is create a rake if the migration will be used more than one time.
* By default use `add_index` on relationships.

## Coding Style and Conventions

* The following order is suggested when creating a migration: attributes come first grouped by data type; followed by associations and enumerations come last; all of them in alphabetical order. No need to group associations by integer or references, just order them alphabetically.
* No need to break lines except for the t.timestamps, this way the automatically generated migration may need no changes at all after creation.
* After the `create_table block`, `add_foreign_key` sentences come first and `add_index` sentences come last.
* Always add indexes for enums; it's easy to forget this if not done immediately after creating the migration. Add in the same line which the enum is declared, for example: `t.integer :status, index: true`.
* No need to break line after the the create_table block, this way the automatically generated migration may need no changes at all after creation.
* Break line between `add_foreign_key` and `add_index` sentences.
* It seems that the `add_foreign_key` was not automatically generated in some migrations due to older Rails version, please add it if necessary.
* Use `t.references :model, index: true` instead of `t.integer :model_id, index: true` whenever possible. For example: `t.references :user, index: true` (Rails 4+)
* For decimal data types, use `precision: 10, scale: 2`, for example: `t.decimal :amount, precision: 10, scale: 2`
* If the index name has more than 63 characters, remove the `index: true` and add it manually. The following pattern is suggested for naming the index: `index_<table_name_plural_word>_on_<attribute_name>`.
* For polymorphic associations, use `t.references :<attribute_prefix>able, polymorphic: true, index: true` whenever possible. Follow the [Ruby on Rails Guide](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations)
  * If not possible due to index name length, remove the `index: true` sentence and manually add the index, for example: `add_index :my_associations, [:associatable_id, :associatable_type], name: 'index_associations_on_associatable'`

## Cleanup migrations

When the db/migrations has too many files, is a good pattern consolidate all migrations in one file. All history will be in a file based on schema.rb and the command `rake db:migrate` works gracefuly. To do this, please use [jalkoby/squasher](https://github.com/jalkoby/squasher).

## Rollback

Please, be carefuly if command `rake db:rollback` is working correctly after create a migration. This saved my skin when it ran in production.

## Brake migrations

To create a model and rename existing column type, create two migrations, one for each task. Please ensure that `rake db:rollback` is working for each one.

## Frequently fix DB issues

* Use [plentz/lol_dba](https://github.com/plentz/lol_dba) to frequently fix index and other database issues.
* Use [jenseng/immigrant](https://github.com/jenseng/immigrant) to frequently add missing foreign keys of association tables.
