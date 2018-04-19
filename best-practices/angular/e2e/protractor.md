# Protractor Best Practices
Used for End-to-end tests

* [Protractor example file](example.ts)


## How to start
First of all you need to verify if Protractor is working properly, to check it you need to type ```protractor``` at terminal (application's folder). This command will open a new window in your browser and it will start the e2e tests. Otherwise you must to reinstall your Protractor using the command: `npm install -g protractor`.


## Our tips
* When you start an e2e test you need to define/describe a group using: ``` describe('Group Name', function () { }); ```.
* After that you need to set your tests inside your group using: ``` it('Should do something', () => { }); ```
* The test must verify each possibility in this scenario as well as success or fail.
* Of course you have to valid each case, using alerts, models, texts, etc.


### Usage
* Using Protractor you can get an element using different ways to call it.
* The function ```element()``` return an object/element that you can interact with. Even so you need to point the element that you want, using its id, tagname, css, className, etc, as the example:
```element( by.css('#inputName.form-group') )```.


### Intaractions
Some interactions you can do using Protractor.

#### Inputs
* Get Text: If you want to get the element's text, use `.getText()` to do it.

Example:
```element( by.css('#inputName.form-group') ).getText()```


* Set Text: If you want to write a text into the input element, use `.sendKeys('')` to do it.

Example:
```element( by.css('#inputName.form-group') ).sendKeys('TextHere')```


### Expecting
* The expect function allows you to compare any element or variable, using: `expect()`

Examples:
```
expect( element( by.css('#inputName.form-group') ).getText() ).toBe('something');
```
or
```
expect( element( by.css('#inputName.form-group') ).getText() ).toEqual('some');
```
or
```
expect( element( by.css('#inputName.form-group') ).getText() ).toContain('thing');
```

### Don't forget
* When you need to wait the Angular's loading, you must use: ``` browser.waitForAngular().then(() => { }); ```.
* If you want to prioritize, you need to use `fdescribe()` to prioritize a group and `fit()` to prioritize a test.
