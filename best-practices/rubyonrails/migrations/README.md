# Ruby on Rails Migrations

## Creating migration

* Use good name to migrations and follow the [Ruby on Rails Guide](http://guides.rubyonrails.org/active_record_migrations.html).
* Use `rails generate model` to create table.
* Use migrations for update database values (access data). Good pattern is create a rake if the migration will be used more than one time.
* To default add index on relationships, use `t.references :user, index: true` (Rails 4+)

## Cleanup migrations

When the db/migrations has too many files, is a good pattern consolidate all migrations in one file. All history will be in a file based on schema.rb and the command `rake db:migrate` works gracefuly. To do this, please use [jalkoby/squasher](https://github.com/jalkoby/squasher).

## Rollback

Please, be carefuly if command `rake db:rollback` is working correctly after create a migration. This saved my skin when it ran in production.

## Brake migrations

To create a model and rename existing column type, create two migrations, one for each task. Please ensure that `rake db:rollback` is working for each one.

## Frequently fix DB issues

* Use [plentz/lol_dba](https://github.com/plentz/lol_dba) to frequently fix index and other database issues.
* Use [jenseng/immigrant](https://github.com/jenseng/immigrant) to frequently add missing foreign keys of association tables.
