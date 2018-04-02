
# COMPONENTS (Serviços, diretivas...)

### Coding Conventions
- Nomear os componentes de forma clara, recomendando-se o padrão 'feature.type.ts'.

```
/* Bad */

details.component.ts (detalhes de quê?);

/* Good */
client-details.component.ts;
credit-card-details.component.ts;
product-details.component.ts;
```

- Para 'services', o sufixos '-er', '-or' podem ajudar na legibilidade:
```
/* Bad */
credit-card-validation.service.ts (Não tão ruim, mas pouco claro);
/* Good */
credit-card-validator.service.ts;
client-logger.service.ts
client-form-creator.service.ts
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

- Criação de serviços 'models' para componentes não puros(componentes puros)
  * Estas serviços conterão todas as regras de negócios de um componente.

  ```javascript
   ./book.component
  
  @Component({
    selector: 'app-book',
    templateUrl: 'book.component.html',
  })
  class BooksComponent implements OnInit{
    
    books:Book[] = [];

    constructor(
      private _model:BooksModel
    ){}

    ngOnInit(){
      this.books = this._model.getAvailableBooks();
    }
  }

   ./book-model.service.ts;
  
  @Injectable()
  class BooksModel{
    
    constructor(
      private _booksApi:BookApiService
    ){}

    getAvailableBooks(){
      return this.getAvailableBooks.getBooks().filter(book=>book.avaliable);
    }
  }

  ```
    * Toda a lógica do filter foi para o serviço que representa o model do component principal, assim, o component não fica encarregado de realizar lógicas  e sim receber e enviar chamadas 

- prefixar com 'on' métodos disparados nos templetes, onNomeDoMetodo():
  * Dá a ideia de 'mediante determinada ação';
  * Ajuda na leitura pois ao ver tal método o dev saberá que este método é chamado no template.

  ```
    ./book.component.ts
    class Book{
      onDeleteBook(){
        // delete method
      }
    }

  ./book.component.html
  
  <div>
    <button (click)="onDeleteBook()">Delete Book</button>
  </div>

  ```


- Componentes filhos puros.

    A idéia de um componente "puro" é que todo o seu estado é representado por suas entradas, onde todos as entradas são imutáveis. Este é efetivamente um componente sem estado, mas, adicionalmente, todas as entradas são imutáveis.
        
    Ex: O component BooksComponent descrito acima, tem um header, uma lista de livros e uma área de detalhe de livro. 
    ``` 
    /books
      /books-header
      /books-list
        /book
      /books-detail
      
    ```

    
    ```javascript 
    ./books-cpmponent.ts
    @Component({
    selector: 'app-book',
    templateUrl: 'book.component.html',
    })
    class BooksComponent implements OnInit{
      
      books:Book[] = [];
      selectedBook:Book;
      headerTitle = 'Avalables';

      constructor(
        private _model:BooksModel
      ){}

      ngOnInit(){
        this.books = this._model.getAvailableBooks();
      }

      onBookSelected(newSelectedBook){
        this.selectedBook = newSelectedBook;
      }
    }
    ```

    ```
      ./books-component.html
      <div>
        <app-book-header [message]="headerTitle"></app-book-header>
        <app-book-list [books]="books" (bookSelected)="onBookSelected($event)"></app-book-list>
        <app-book-details [book]="selectedBook"></app-book-details>
      </div>
    ```

    ```javascript
   
      /* imports omitidos */
      class BooksHeaderComponent implements OnInit{
        @Input() message;    
      }

      /* imports omitidos */
      class BooksListComponent implements OnInit{
        @Input() books:Book[];    
      }

      /* imports omitidos */
      class BookComponent implements OnInit{
        @Input() book:Book;    
      }


      /* imports omitidos */
      class BooksDetailsComponent implements OnInit{
        @Input() book:Book;
        @Output() bookSelected:EventEmmiter<Book> = new EventEmmiter<Book>();
        
        onBookSelected(newBookSelected:Book){
          this.bookSelected.emit(newBookSelected);
        }     
      }

    ```
    * nenhum component filho faz requisição ao back ou alteração no pai, eles apenas recebem e mandam dados sem saber da finalidade dos mesmos.
    * ganho na manuteção pois as lógicas não ficarão espalhadas

- ChangeDetectionStrategy OnPush para components puros
  
  A estratégia de OnPush força o angular a detectar mudanças apenas quando alterados os inputs do component. Assim ganharemos em performance.
  
  ```javascript
      import {Component, Input, ngOnInit, ChangeDetectionStrategy}
      
      @Component({
        selector: 'app-book-header',
        changeDetection: ChangeDetectionStrategy.OnPush
      })
      class BooksHeaderComponent implements OnInit{
        @Input() message;    
      }
  ```

- ChangeDetectionStrategy.OnPush pode ser aplicado em qualquer component, neste caso devemos manualmente informar os pontos de detectChanges()/tick()/marckForCheck(). Novamente, ganhamos em performance.

- TrackBy em listas. 

  Sempre que exportmos uma lista no template, devemos definir uma função de trackBy, com isso, caso alteremos um componente da lista, apenas este elemento será re-renderizado no DOM, do contrário, todos os elementos o serão.  

```javascript  
  /* imports omitidos */
  class BooksListComponent implements OnInit{
    @Input() books:Book[];

    trackByBookId(index, item){
      return item.id;
    }    
  }
```

```
  <ul>
    <li *ngFor="let book of books; trackBy:trackByBookId">{{ book?.title }}<li>
  </ul>
```

- Chamar métodos no template para computar valores.

  ```javascript
  /* imports omitidos */
  class BookComponent implements OnInit{
    @Input() book:Book;

    getTotalStudentReaders(){
      return this.book.readers.filter(reader=>reader.type==='student');
    }

  }
  ```

  ```
  BAD
  <h2>{{ book?.title }}<h2>
  <p>{{ getTotalStudentReaders() }}</p>
  ```

      Funções que expôem valores serão chamadas a cada detecção de mudança do componente. Caso o método getTotalStudentReaders tenha que interar por uma lista muito grande ou tenha uma maior complexidade, teriamos problemas de performace. 
  * Uma solução pe criar um PIPE, pois este so são chamados em mudanças puras
  
  ```
  BAD
  <h2>{{ book?.title }}<h2>
  <p>{{ book?.title | calcStudentReaders }}</p>
  ```

  
  ```javascript
  /* imports omitidos */
  @Pipe({
    selector:'[calcStudentReaders]'
  })
  class CalcStudentReadersPipe implements OnInit{

    transform(value){
      return value.readers.filter(reader=>reader.type==='student');
    }

  }
  ```