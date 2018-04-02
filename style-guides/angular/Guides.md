# Angular

### Coding conventions
- usar 'camel case' para classes.
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

#### Funções pequenas
  * São fáceis de ler, entender e manter.

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


#### Single responsibility

  Aplicar o princípio da responsabilidade única (SRP) a todos os componentes, serviços, diretrizes e assim por diante. Isso torna o código mais reutilizável, mais fácil de ler, manter e evitar possíveis erros.

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
- Distribuir Modules, Components, Directives em arquivos dedicados.

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



#### Import line spacing
  - Para facilitar a leitura dos imports dos arquivos, devemos separar em três grupos separados por uma linha em branco:
      - angular core
      - third party 
      - application imports.
  - Para evitar confusões drante 'merges', cada novo import vai para a última linha de seu grupo;

```javascript
/* Bad */
import { ExceptionService, SpinnerService, ToastService } from '../../core';
import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
import { Hero } from './hero.model';

/* Good */

/* angular-core */
import { Injectable } from '@anguslar/core';
import { Http }       from '@angular/http';

/* third-party */
import { AngularTokenService } from '@ngx-token';
import { ModalService } from 'ngx-bootstrap'; 

/* application-imports */
import { Book } from './book.model';
import { ExceptionService, SpinnerService } from '../../core';
import { BooksApiService } from './credit-details.ts';


// Constructor DI organization

class CreditCardComponent{
  constructor(
    private http:Http,

    private angularTokenService: AngularTokenService,
    private modalService: ModalService,

    private exceptionService: ExceptionService, 
    private spinnerService: SpinnerService,
    private booksApiService: BooksApiService, 
  ){

  }
}
```


-   Para evitar confusões drante 'merges', cada novo import vai para a última linha de seu grupo;
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

- Não chame muito código no construtor, pois algumas partes componente podem não estarem prontas ainda. Considere usar um método do ciclo de vida. 
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