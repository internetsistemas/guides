## Ruby on Rails Enums (EnumerateIt)

###### Why use a gem?

* Multiple fields with same enum

* Multiples models can follow one enum (DRY)

* Magic powers

###### Inactive and Active

* Be carefuly when you are creating status. 'inactive' and similar status should be 0, others status, you can select other number.

###### Translations

* Gem find the correct translations at: enumerations.%{class_name}.%{value}

###### Select values on select_tag

* AccountStatus.to_a # => [['Inactive', 0], ['Active', 1]]

###### Others reactions

* Always you can found more infos at [cassiomarques/enumerate_it](https://github.com/cassiomarques/enumerate_it)
