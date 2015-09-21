

## First steps in R

R is a powerful calculator with standard arithmetic operators:


```r
1 + 6
```

```
## [1] 7
```


```r
2 * 6
```

```
## [1] 12
```


```r
2 * 6 + 1
```

```
## [1] 13
```


```r
2 * (6 + 1)
```

```
## [1] 14
```



If we want to refer to a result later on, we can give them a name.


```r
a <- 1 + 6
```

Here I *assign* (`<-`) the result of `1 + 6` to an *object* named `a`.
If you just type the name into the console R shows whats inside this object:


```r
a
```

```
## [1] 7
```

You can also do calculations with this object:


```r
2 * a
```

```
## [1] 14
```

Note, that R will overwrite objects:

```r
a
```

```
## [1] 7
```

```r
a <- 2*a
a
```

```
## [1] 14
```

If R doesn't know about an object you get the following error:

```r
b
```

```
## Error in eval(expr, envir, enclos): object 'b' not found
```

which says: *"I looked for the object 'b', but could not find it"*".

You can see objects that are available in the `Environment` pane of RStudio. Alternatively you can use the `ls()` function.




## Data types in R

Before starting with data analyses we need to know which types of data R can handle.
Here we discuss only the basic types `numeric`, `integer`, `character` and `logical`.


### Numerics
We already encountered the *numeric* data type in the previous section:


```r
a <- 2.5
```

We can check what type an object is with the class function


```r
class(a)
```

```
## [1] "numeric"
```

Note that integers are also stored as numeric:


```r
b <- 2
class(b)
```

```
## [1] "numeric"
```

We can also confirm the type of an object using the `is.*()` functions (where * is a placeholder for `numeric`, `integer`, `logical` or `character`).


```r
is.numeric(b)
```

```
## [1] TRUE
```

```r
is.integer(b)
```

```
## [1] FALSE
```


### Integers

There isn't a big practical difference between integers and numeric in R. However, it is useful to know about them.

To specify an integer object we need to add `L` to the integer:


```r
c <- 2L
class(c)
```

```
## [1] "integer"
```

We can also convert a numeric to integer using the `as.integer()` function.


```r
b
```

```
## [1] 2
```

```r
class(b)
```

```
## [1] "numeric"
```

```r
d <- as.integer(b)
d
```

```
## [1] 2
```

```r
class(d)
```

```
## [1] "integer"
```

There are also equivalent `as.*()` functions for `numeric`, `logical` or `character`.
However, be careful we converting numerics:

```r
as.integer(6.23)
as.integer(6.7)
```

```
## [1] 6
## [1] 6
```

Also converting strings make no sense

```r
as.integer('Hello World')
```

```
## Warning: NAs introduced by coercion
```

```
## [1] NA
```

and R returns `NA` accomnied with a warning that it cannot coerce to a integer.


### Characters

Character objects are used to represent string values in R:


```r
a <- 'Hello World'
class(a)
```

```
## [1] "character"
```

We can always coerce integers and numerics to characters:



```r
as.character(2L)
as.character(2.6)
```

```
## [1] "2"
## [1] "2.6"
```

and also sometimes (when possible) the way round:


```r
as.numeric(as.character(2.6))
```

```
## [1] 2.6
```

```r
as.numeric('Hello World')
```

```
## Warning: NAs introduced by coercion
```

```
## [1] NA
```


### Logicals

We already encoutered logicals when checking objects with the `is.*()` function. 
This function returned either `TRUE` or `FALSE`. 
Logicals are also returned when comparing two numerics


```r
2 < 3  # is 2 smaller then 3?
5 > 6  # is 5 bigger the 6
5 > 5 # is 5 greater then 5
5 >= 5 # is 5 greater or equal then 5
```

```
## [1] TRUE
## [1] FALSE
## [1] FALSE
## [1] TRUE
```

Logical operators in R are `&` (AND), `|` OR and `!` (negotiation):



```r
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE
```

```
## [1] TRUE
## [1] FALSE
## [1] FALSE
## [1] FALSE
```


```r
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE
```

```
## [1] TRUE
## [1] TRUE
## [1] TRUE
## [1] FALSE
```


```r
TRUE
!TRUE
```

```
## [1] TRUE
## [1] FALSE
```


## Data structures in R


### Vectors

### Matrices

### Data.frames

### Lists
