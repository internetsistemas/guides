# Modules 


### Application Modules Structure
- Um pequeno exemplo de estrutura
```
Ex: Books Module
/books-module
	/components
		/books-header
		/books-list
			/book-item
		/books-detail
	/shared
		book-pages.component
	/tests
	books.container.component.ts 
	books.module.ts
	books.routing.ts
/user-module
	/components
		/user-header
		/user-books
			/user-book
	/tests
	user.container.component.ts 
	user.module.ts
	user.routing.ts
/core
	/components
		/header
		/nav
		/footer
	/services
		auth.service.ts
		validations.services.ts
/shared
	/components
	/services
	/pipes
	/directives
app.component.ts
app.module.ts
app.routing.ts
```	

- Devemos subdividir a aplicação em módulos específicos

```
Ex: Books Module
/books-module
	/components
		/books-header
		/books-list
			/book-item
		/books-detail
	/shared
		book-pages.component
	/tests
	books.container.component.ts 
	books.routing.ts
	books.module.ts
	index.ts
```

*	books.module.ts importa o SharedModule e declara/exporta os componentesdo módulo, além de prover serviços internos
*	books.routing.ts define as rotas do módulo 
* books.container.component.ts é o primeiro componente da rota '/' para books.routing.ts;
* books.container.component.ts envelopa o resto dos componentes nem que seja via ```<route-outlet></route-outlet>```
* index.ts, deve ser criado como um módulo para expor os components/serviços da aplicação, ganhando em flexibilidade, legibilidade e escalabilidade

	* BookModule SEM index.ts
	```javascript
	/* book.module.ts */
	import from './books-module/components/books-header/books-header.component.ts';
	import from './books-module/components/books-list/books-list.component.ts';
	import from './books-module/components/books-list/book-item/book-item.component.ts';
	import from './books-module/components/books-header/books-detail/books-detail.component.ts';
	```

	* BookModule COM index.ts
	```javascript

	/* index.ts */
	export * from './books-module/components/books-header/books-header.component.ts';
	export * from './books-module/components/books-list/books-list.component.ts';
	export * from './books-module/components/books-list/book-item/book-item.component.ts';
	export * from './books-module/components/books-header/books-detail/books-detail.component.ts';

	/* book.module.ts */
	import { BooksHeaderComponent, BooksListComponent, BookItemComponent, BookDetailsComponent} from './';

	```
	
	* Além da legibilidade, caso hajam mudanças na estutura da app, apenas o arquivo index sofrerá mudanças.	


### AppModule
	
-	organizar os imports de acordo com a origem dos módulos, assim como discutidos nos components

```javascript
/* angular modules */
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';

/* 3rd party modules - caso existam*/ 

/* application modules */
import { AppComponent } from '@app/app.component';
import { CoreModule } from '@app/core/core.module';
import { AuthModule } from '@app/auth';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    /* angular modules */
    BrowserModule,
    HttpModule,

    /* 3rd party modules */

    /* application modules */
    AuthModule.forRoot(),
    CoreModule.forRoot(),
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

```

### Aliases para @app e @environments
- 'Aliasar' nossos imports e ambientes nos permitirão implementar importações limpas que serão consistentes ao longo de nossa aplicação.
	
	```javascript
		import { SomeService } from '../../../core/subpackage1/subpackage2/some.service'.
		OU
		import { SomeService } from '@app/core'.
		
	```

### SharedModule
- Neste módulo estarão todos os  componentes/serviços/pipes/diretivas que são reutilizaveis na aplicação.
		
		Ex: Um componente de modal que pode ser reaproveitado por muitos componenetes
- Este componente será importado em praticamente todos os modulos da aplicação, sendo assim, módulos do angular e de terceiros (CommomModule, FormsModule etc), devem ser exportado via SharedModule
- Uma estrutura eficas ao SharedModule
	
	
	```javascript
	import { NgModule } from '@angular/core';
	import { HttpModule } from '@angular/http';
	import { FormsModule, ReactiveFormsModule } from '@angular/forms';
	import { CommonModule } from '@angular/common';

	/* third party */
	import { ModalModule } from 'ngx-bootstrap/modal';

	/* application */
	import { DropdownDirective } from './dropdown.directive';

	@NgModule({
	imports: [
		CommonModule,
		/* third party */
	],
	declarations: [
		DropdownDirective,
	],
	exports: [
		CommonModule,
		FormsModule,
		ReactiveFormsModule,
		HttpModule,
	
		/* third party */
		ModalModule.forRoot(),
	
		/* application */
		DropdownDirective,
	]
	})
	export class SharedModule {

	}

	```
	- O SharedModule pode e deve conter Services, mas estes NÃO devem ser providos pelo shared e sim pelo CoreModule, pois o SharedModule é importado por muitos pontos da app, assim Singletons servies não seriam Singletons.

### CoreModule
- O core module deve conter componentes/serviços/modulos vitais e comuns à app, como autentucação, validação, Headers, Footers (etc...) e TODOS os demais singletons.
- O core module deve ser importado única e exclusivamente pelo AppModule, pois conterá todos os Singletons da app.
	```
		por isso utilizau-se do artifício abaixo no contrutor do módulo
		
		constructor(
			@Optional() @SkipSelf() parentModule: CoreModule
		) {
			if (parentModule) {
				throw new Error('CoreModule is already loaded. Import only in AppModule');
			}
		}
	```
- Neste módulo, TODOS o servços do moudlo Shared serão providos garantido o careter de unicidade dos mesmos, reforçaremos utilizar o forRoot, para garantir que os módulos só serão providos via um root module

```javascript
	import { NgModule, ModuleWithProviders, Optional, SkipSelf } from '@angular/core';

	import { RecipeService } from '@app/recipes';
	import { SharedModule, DataStorageService } from '@app/shared';

	import { HomeComponent, HeaderComponent } from './';
	import { ShoppingListService } from '@app/shopping-list';
	import { AppRoutingModule } from '@app/app-routing.module';


	@NgModule({
		imports: [
			SharedModule,
			AppRoutingModule,
		],
		declarations: [
			HomeComponent,
			HeaderComponent
		],
		exports: [
			HeaderComponent,
			AppRoutingModule,
		],

	})
	export class CoreModule {

		constructor(
			@Optional() @SkipSelf() parentModule: CoreModule
		) {
			if (parentModule) {
				throw new Error('CoreModule is already loaded. Import only in AppModule');
			}
		}

		static forRoot(): ModuleWithProviders {
			return {
				ngModule: CoreModule,
				providers: [
					ShoppingListService,
					RecipeService,
					DataStorageService,
				],
			}
		}
	}
```
	
- Usar  AoT (ahead of time) compilations!

	* O uso da compilação AoT é excelente para ganhos de desempenho em tempo de execução. 
	* Também reduz seu pacote em cerca de 30kb (gzip). 
	* Angular 4.0+ traz cerca de 30% de melhoria nos pacotes de aplicativos devido à forma como ele gera o código AoT.

- Lazy Loading 
	* Diminui a quantidade de componentes inicializados de forma ociosa;
	* Diminui o bundle gerado na compilação do webpack;

- preloadingStrategy: PreloadAllModules
	
	Um pequeno problema com o Lazy Loading é que, quando o usuário navegar para uma seção, o Router terá que buscar os módulos necessários do servidor, o que pode demorar. Assim, combinando o lazy loading com uma preloadingStrategy o Roter pode pré-carregar módulos em lazy-loading em segundo plano enquanto o usuário está interagindo com nossa aplicação. [Ótima explicação visual](https://vsavkin.com/angular-router-preloading-modules-ba3c75e424cb)


```javascript
/* ./app.routes.ts */

import { NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules } from '@angular/router';

const appRoutes: Routes = [
  { path: 'recipes', loadChildren: './recipes/recipes.module#RecipesModule' },
  { path: 'shopping-list', loadChildren: './shopping-list/shopping-list.module#ShoppingListModule' },
];

@NgModule({
  imports: [
    RouterModule.forRoot(appRoutes, {
      preloadingStrategy: PreloadAllModules
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {

}
```
