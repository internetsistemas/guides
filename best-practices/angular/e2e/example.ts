import { RepensePmWebAppPage } from './app.po';
import { browser, element, by, protractor } from 'protractor';

browser.driver.manage().window().maximize();

let page: Application;

beforeEach(() => {
    page = new Application();
});


describe('Group Name', function () {

    it('Should do something', () => {

        page.navigateTo('home');

        browser.waitForAngular().then(() => {
            expect( element( by.css('#inputName.form-group') ).getText() ).toBe('something');
        });

    });
    
});