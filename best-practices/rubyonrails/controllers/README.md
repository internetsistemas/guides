# Ruby on Rails Controllers

## Be RESTful as possible

Ruby on Rails supports RESTful and creating other actions that are outside the standard makes the understanding and maintenance, so it's a good idea to create specific controllers and use the REST methods. For example: An approval routine for a comment.

```ruby
# Instead of this...
class CommentsController < ApplicationController
  def approval
    @comment.approval!
  end
end

# ...You should do this.
class ApprovalCommentsController < ApplicationController
  def update
    @comment.approval!
  end
end
```

And, configure routes to `ApprovalCommentsController` be nested of `CommentsController`. For details see the [Ruby on Rails Guides](http://guides.rubyonrails.org/routing.html).


## Keep clear and simple

* Use [plataformatec/responders](https://github.com/plataformatec/responders) gem to dry up your Rails app (3.2+).
* Set `respond_to` in the `ApplicationController`.
* Use `respond_with` in actions.
* Set the flash messages in the Flash Responder's. For details see [Flash Responder Manual](https://github.com/plataformatec/responders#flashresponder).
* Use private methods and `before_action` to help to mantain controllers clean
* Use before filter to ensure access of users, or similar.
