# Style Guides

## API Errors

For the errors returned by the API, we use a format inspired by the the
[JSON API specification](http://jsonapi.org/format/#errors). The API will
always respond with an errored HTTP status (401, 404, 422...) and the following
object in the response body.

```ruby
{
  status: '<HTTP error status>',
  code: '<the error identifier, used by the backed to generate the error>',
  title: '<a localized string that briefly describes the error>',
  details: ['<a list of localized strings that detail the error(s)>']
}
```

The `status` property always match the response status code. The `details`
property may not be present, if any details were provided in the backend.
That usually happens with self explained errors, such as `401 UNAUTHORIZED`.

### Rendering errors

In onder to make sure all errors are returned in the expected format, avoid
rendering a JSON that was manually build. Instead, use one of the controller
helper methods to render errors.
