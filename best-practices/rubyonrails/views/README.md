## Ruby on Rails Views

###### Queries

* Avoid use queries on view

* Don't reference a model class directly from a view

###### Tips

* Use helpers to reduce view duplication and complexity.

* Use partials to keep views skinny

* Don't use instance variables in partials. Pass local variables to partials from view templates.

* Use only one instance variable in each view.

* Use `_url` suffixes for named routes in mailer views and redirects. Use `_path` suffixes for named routes everywhere else.

* Put application-wide partials in the `app/views/application` directory.

* Use the default `render 'partial'` syntax over `render partial: 'partial'`.

* Use link_to for GET requests, and button_to for other HTTP verbs.
