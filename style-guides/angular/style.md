# STYLES

### CSS Syntax

Usar 'soft tab' com dois espaços. 

```css
/* Good */
.nav-item {
  display: inline-block;
  margin: 0 5px;
}

/* Bad */
.nav-item {
    display: inline-block;
    margin: 0 5px;
}
```

Sempre usar 'double quotes'.

```css
/* Good */
[type="text"]
[class^="..."]

.nav-item:after {
  content: "";
}

/* Bad */
[type='text']
[class^='...']

.nav-item:after {
  content: '';
}
```

Incluir ponto e vígula no fim de cada delcaração

```css
/* Good */
.header {
  margin-bottom: 20px;
}

/* Bad */
.header{
  margin-bottom:20px
}
```

Manter uma declaração por linha

```css
/* Good */
.selector-1,
.selector-2,
.selector-3 {
  ...
}

/* Bad */
.selector-1, .selector-2, .selector-3 {
  ...
}
```

Separar cada seção com uma linha em branco.

```css
/* Good */
.selector-1 {
  ...
}

.selector-2 {
  ...
}

/* Bad */
.selector-1 {
  ...
}
.selector-2 {
  ...
}
```

### As declarações devem vir em ordem alfavética

```css
/* Good */
.selector-1 {
  background: #fff;
  border: #333 solid 1px;
  color: #333;
  display: block;
  height: 200px;
  margin: 5px;
  padding: 5px;
  width: 200px;
}

/* Bad */
.selector-1 {
  padding: 5px;
  height: 200px;
  background: #fff;
  margin: 5px;
  width: 200px;
  color: #333;
  border: #333 solid 1px;
  display: block;
}
```

### Manter as classes em lowercase e usar  dashes para separar classnames.

```css
/* Good */
.page-header { ... }

/* Bad */
.pageHeader { ... }
.page_header { ... }
```

Usar 'single dash' para o nome do elemento, underline duplo para o bloco de elementos e o 'double dash' modificação de estilo.

```css
/* Good */
.page-header{ ... }
.page-header__action { ... }
.page-header__action__title { ... }
.page-header--active { ... }

.btn { ... }
.btn--primary { ... }

/* Bad */
.page-header-action { ... }
.page-header-action-title { ... }
.page-header-active { ... }

.btn { ... }
.btn-primary { ... }
```

```css
/* Good */ 
.nav { ... }
.nav__item { ... }
.nav__link { ... }

/* Bad */
.item-nav { ... }
.link-nav { ... }
```

- Evitar nomes curtos que não representam o significado da classe.

```css
/* Good */
.btn { ... }
.page-header { ... }
.progress-bar { ... }

/* Bad */
.s { ... }
.ph { ... }
.block { ... }
```

### CSS Performance

Nunca usar os IDs.

```css
/* Good */
.header { ... }
.section { ... }

/* Bad */
#header { ... }
#section { ... }
```

Não usar os seletores genéricos, sempre preferir trbalhar com classes.

```css
/* Good */
.form-control { ... }
.header { ... }
.section { ... }

/* Bad */
input[type="text"] { ... }
header
section
```

Evitar aninhar demais a estilização dos elementos, procurar utilizar classes.

```css
/* Good */
.navbar { ... }
.nav { ... }
.nav__item { ... }
.nav__link { ... }

/* Bad */
.navbar ul { ... }
.navbar ul li { ... }
.navbar ul li a { ... }
```

Aninhe somente quando precisar alterar o comportamento da classe com interferência para outra classe. Mantenha o aninhamento em no máximo três elementos.

```css
/* Good */
.modal-footer .btn { ... }
.progress.active .progress-bar { ... }

/* Bad */
.modal-btn { ... }
.progress.active .progress-bar .progress-item span { ... }
```


### 4.5 CSS Media Queries

inicie o código de forma genérica à menor tela e no mesmo arquivo siga as especificações da media queries.

```css
/* Good */
.navbar {
  margin-bottom: 20px;
}

@media (min-width: 480px) {
  .navbar {
    padding: 10px;
  }
}

@media (min-width: 768px) {
  .navbar {
    position: absolute;
    top: 0;
    left: 0;
  }
}

@media (min-width: 992px) {
  .navbar {
    position: fixed;
  }
}

/* Bad */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
}

@media (max-width: 767px) {
  .navbar {
    position: static;
    padding: 10px;
  }
}

```

### Sass
- repetir todas as regras anteriores seguindo a sintaxe do sass 
- Utilizar cores vindas de variáveis. Melhora a legibilidade e manutenção

```css
// Good
$gray-darker  = #111
$gray-dark    = #393C45
$gray         = #555
$gray-light   = #aaa
$gray-lighter = #ECF1F5
$gray-white   = #fbfbfb
```

 
### 5.3. CSS Preprocessors Media Queries

Fornecer as media queries dentro do elemento

```scss 
.navbar {
  position absolute
  top 5px
  z-index 5
   
  @media (min-width $screen-sm){ 
    position fixed;
    margin-right $space-sm;
  }

  @media (min-width $screen-md) { 
    right 0; 
    top 10px;
  }
} 
```
 