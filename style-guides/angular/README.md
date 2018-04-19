# Angular JS

## Style

* Single responsibility
Apply the single responsibility principle (SRP) to all components, services, Directives and so on. It makes the code more reusable, easier to read, maintain and avoid possibles mistakes.

```javascript
/* Bad */
// app.module.js
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, Component, OnInit } from '@angular/core';

class Client {
  id: number;
  name: string;
}

@Component({
  selector: 'my-app',
  template: `
  <h1>{{title}}</h1>
  <pre>{{clients | json}}</pre>
  `,
  styleUrls: ['app/app.component.css']
})
class AppComponent implements OnInit {
  title = 'My Store';
  clients: Client[] = [];
  ngOnInit() {
    getClients().then(clients => this.clients = clients);
  }
}

@NgModule({
  imports: [ BrowserModule ],
  declarations: [ AppComponent ],
  exports: [ AppComponent ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
platformBrowserDynamic().bootstrapModule(AppModule);
const CLIENTS: Client[] = [
  {id: 1, name: 'Tony Stark'},
  {id: 2, name: 'John Snow'},
  {id: 3, name: 'Tyrion Lannister'},
];

function getClients(): Promise<Client[]> {
  return Promise.resolve(CLIENTS);
}
```

It best pratice redestribute the Modules, Components, Directives into dedicated files.

```javascript
/* Good */
// app.module.ts
@NgModule({
  imports: [ BrowserModule ],
  declarations: [ AppComponent ],
  exports: [ AppComponent ],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
platformBrowserDynamic().bootstrapModule(AppModule);
const CLIENTS: Client[] = [
  {id: 1, name: 'Tony Stark'},
  {id: 2, name: 'John Snow'},
  {id: 3, name: 'Tyrion Lannister'},
];
```

```javascript
/* Good */
// app.component.ts
@Component({
  selector: 'my-app',
  template: `
  <h1>{{title}}</h1>
  <pre>{{clients | json}}</pre>
  `,
  styleUrls: ['app/app.component.css']
})
class AppComponent implements OnInit {
  title = 'My Store';
  clients: Client[] = [];
  ngOnInit() {
    getClients().then(clients => this.clients = clients);
  }
}
```

```javascript
/* Good */
// client.model.ts
export class Client {
  id: number;
  name: string;
}
```

```javascript
/* Good */
// app.module.ts
@Injectable()
export class ClientService {
  getClients) {
    return Promise.resolve(CLIENTS);
  }
}
```

* Small functions
The principle is the same. Small functions are easy to read, understand and maintain

```javascript
/* Bad */
function sellProduct(client:Client, product:Product, quantityToSell) {
  if(product.quantity >0 || product.quantity >= quantityToSell){
    this.product.price = this.product.value - this.productService.checkDiscunt(client.creditCar, product);
    if(client.creditCar.isValid && product.quantity >0 && product.quantity >= quantityToSell){
      if(client.creditCar.credit >= (this.product.price*quantity) ){
        this.product.quantity - quantityToSell;
        this.client.creditCar.credit -= this.product.price*quantityToSell;

        this.http.put(`api/client/${client.id}`, client);
        this.http.put(`api/product/${product.id}`, product);      
      }
    }else{
      console.log('Could not complete de sell');
    }
  }
}
```

```javascript
/* Good */
function sellProduct(client:Client, product:Product, quantityToSell) {
  if(this.stockHasEnough(product, quantityToSell) && this.isValidCreditCard(client.creditCard)){
    const priceToPay = this.priceAfterDiscount(this.product.price, client.id, product.id);
    if(this.clientHasEnoughCredit(client, priceToPay, quantityToSell)){
      this.updateProduct(product);
      this.updateClient(client);
    }else{
      console.log('Could not complete de sell');
    }
  }
}

function stockHasEnough(product, quantityToSell){
  return stockHas(product) && (product.quantity >= quantityToSell);
}
function stockHas(product){
  return product.quantity >0;
}
function priceAfterDiscount(price, clientId, productId){
  return price - this.productService.checkDiscunt(clientId, productId);
}
function isValidCreditCard(creditCard){
  return this.creditCardService.validate(creditCard);
}
function clientHasEnoughCredit(client, priceToPay, quantityToSell){
  return client.creditCar.credit >= (priceToPay*quantityToSell);
}

function updateProduct(product){
  this.productService.update(product);
}
function updateClient(client){
  this.clientService.update(client);
}
```

* Naming
- Naming conventions are also important to maintainability and readability. The recommended pattern is 'feature.type.ts':
client-details.component.ts, credit-card-validator.service.ts, highlightcolor.pipe.ts

- Is important do use consistent files names:
```
/* Bad */
details.component.ts (what details you want to show);
/* Good */
client-details.component.ts;
credit-card-details.component.ts;
product-details.component.ts;
```

- For Services, a good way to indicate them is using sufix like '-er', '-or':
```
/* Bad */
credit-card-validation.service.ts (No so bad, but not so clear);
/* Good */
credit-card-validator.service.ts;
client-logger.service.ts
```

- Give clear names to functions, variables and constants.
```
/* Bad */
savePromotions(numbers:[]){ // what is numbers?
  const count = numbers.length; // what are you counting?
  this.promotionService.save(numbers, count); // save is very abstract
}

/* Better */
savePromotions(productsIds:[]){
  const qunatityOfProductSend = productsIds.length;
  this.promotionService.createPromotions(productsIds, qunatityOfProductSend);
}
```

* Coding conventions
- use upper camel case when naming classes.
```
/* Bad */
export class exceptionComponent {
  constructor() { }
}
/* Good */
export class ExceptionComponent {
  constructor() { }
}
```




* Import line spacing
- Leave one empty line between third party imports and application imports.
- To avoid conflicts and confusion during merges, put last imports at last positions;

```
/* Bad */
import { ExceptionService, SpinnerService, ToastService } from '../../core';
import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
import { Hero } from './hero.model';

/* Good */
import { Injectable } from '@angular/core';
import { Http }       from '@angular/http';

import { Modal } from 'ngx-bootstrap'; // a new third party import

import { Hero } from './hero.model';
import { ExceptionService, SpinnerService, ToastService } from '../../core';
import { CreditDetailsComponent } from './credit-details.ts' // a new application import
```

- The same principle is valid in Constructor or Modules imports, declarations and provides;
```
/* Bad */
/* merge 1 */
constructor(
  private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent
){ }

/* merge 2 */
constructor(
  private clientService:CreditCardComponent, // new DI
  private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent,
  private productService:CreditCardComponent // new DI
){ }


/* Better */
/* merge 1 */
constructor(
  private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent, // Always put a colon in the last, to avoid breaks after merges
){ }

/* merge 2 */
constructor(
  private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent,
  private clientService:CreditCardComponent, // new DI
  private productService:CreditCardComponent, // new DI, end with colon
){ }
```

- Constructor DI organization
```
/* Bad */
constructor(private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent,
  private clientService:CreditCardComponent,
  private productService:CreditCardComponent,){ }

/* Better */
constructor(
  private creditCardService:CreditCardComponent,
  private loggerComponent:CreditCardComponent,
  private clientService:CreditCardComponent,
  private productService:CreditCardComponent,
){ }
```

- Don't call several code on the constructor, because part of your component could not be ready. Consider use a Lifecycle hooke.
```
/* Bad */
constructor(
  private creditCardService:CreditCardComponent,
){
  this.creditCardService.validate(this.creditCard)
    .subscribe(response => this.isValid = response.json);
}

/* Better */
constructor(
  private creditCardService:CreditCardComponent,
){ }

ngOnInit(){
  this.creditCardService.validate(this.creditCard)
    .subscribe(response => this.isValid = response.json);
}
```
- remember to Implement lifecycle hook interfaces when used
```
export class CreditCardComponent implements OnInit {
  ...
}
```

* i18n files;
  -Is more easy to identify values if the keys are alphabetically organized
  ```javascript
  {
     "AddNewClient": "Add new Client",
     "CancelCreation": "Cancel Creation",
     "CreditCard": {
       "OwnerName": "Owner Name",
       "ValidUntil": "Valid Until",
     },
     "Product": {
       "CreateProduct": "Create Product",
       "Code": "Code",
       "CodeRequired": "Code is required",
       "Name": "Product Name",
       "NameRequired": "Name is required",
       "Type":"Type of Product"
     }
  }
  ```
