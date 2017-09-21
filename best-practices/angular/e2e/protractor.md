# Protractor Best Practices
Used for End-to-end tests

* [Protractor example file](example.ts)


## How to start
First of all you need to verify if Protractor is working properly, to check it you'll need to type ```protractor``` at shell (app's folder), this command will open a new window in your browser and it's going to start the e2e tests, otherwise you must to reinstall your protractor using the command: `npm install -g protractor`.


## Our tips
* When you're going to start an e2e test you need to define/describe a group using: ``` describe('Group Name', function () { }); ```.
* After that you'll need to set your tests inside your group using: ``` it('Should do something', () => { }); ```
* The test has to verify every possibility in this scenario even if wrongs.
* Of course you have to valid each case, using alerts, models, texts, etc.


### Usage
* Using protractor you can get an element using different ways to call it.
* The function ```element()``` will return an object/element that you can interact with, even so you'll need to point the element you want, using the element: id, tagname, css, className, etc, as the example:
```element( by.css('#inputName.form-group') )```.


### Intaractions
Some interactions you can do using protractor.

#### Inputs
* Get Text: If you want to get the element's text, use `.getText()` to do it.

Example:
```element( by.css('#inputName.form-group') ).getText()```


* Set Text: If you want to write a text into the input element, use `.sendKeys('')` to make it happens.

Example:
```element( by.css('#inputName.form-group') ).sendKeys('TextHere')```


### Expecting
* If you need the inputs value to be something you're able to do that using: ``` expect() ```. The expect function allows you to compare any element or variable to something, also using:
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
* When you need to wait the angular loading, you'll need to use: ``` browser.waitForAngular().then(() => { }); ```.
* If you want to prioritize a test, you'll need to use `fdescribe()` to prioritize a group and `fit()` to prioritize a test.
