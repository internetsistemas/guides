# Ruby on Rails Enums

Ruby on Rails 4.0+ implements native enums support, but it has limitations:

* Hard to localize.
* Doesn't support multiple atributes with same enum.
* DRY (we need to declare in every model).

So, we're using the [EnumerateIt](https://github.com/cassiomarques/enumerate_it). And it implements:

* Localize easily.
* Prefix: Support the same enum in multiple atributes.
* Select values on `select_tag`: `AccountStatus.to_a # => [['Inactive', 0], ['Active', 1]]`
* Create scopes and helpers automatically.
* Implements Magic Powers.

Nothing is perfect:

* Be carefuly when you are creating status. `'inactive'` and similar status should be 0, others status, you can select other number.
* Gem find the correct translations at: `enumerations.%{class_name}.%{value}`
* Only assigns by enumerator: `comment.status = CommentStatus::DRAFT`
