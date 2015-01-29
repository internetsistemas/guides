## Ruby on Rails Services

###### Introduction

Rails services isn't in default app/ structure. We create this folder to help to mantain controllers and models clean. Services is a layer between them. Usually it has business logic and integration between others apps.

###### Class methods and object methods

When calling a service is good pattern show what we are calling. Things like

`PaymentService.new(card, value).process!`

is better than

`PaymentService.process(card, value)`

because if we want try if card credit is valid before, we memoize the object into 'def payment' and use

`payment.valid? ? payment.process : fail InvalidCardError`

like sample.rb

###### Never forget about rules

* [Sandy Metz Rules](http://robots.thoughtbot.com/sandi-metz-rules-for-developers)

* [Hound CI](https://houndci.com) is good to validate code style and other things.

* Use ActiveRecord::Base.transaction to keep all process methods in transaction. Good pattern to rollback when a method fail and keep previous database status.

* [SOLID principles](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
