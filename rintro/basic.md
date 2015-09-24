# ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
#! status : in works
```

## First steps in R

R is a powerful calculator with standard arithmetic operators:


```r
# Addition
1 + 6
```

```
## [1] 7
```


```r
# Multiplication
2 * 6
```

```
## [1] 12
```


```r
# multiplication and division first, then addition and subtraction
2 * 6 + 1
```

```
## [1] 13
```


```r
# use of brackets
2 * (6 + 1)
```

```
## [1] 14
```


```r
# square root
sqrt(16)
```

```
## [1] 4
```


```r
# powers
16^0.5
```

```
## [1] 4
```

```r
2^2
```

```
## [1] 4
```


```r
# natural log
log(10)
```

```
## [1] 2.302585
```


```r
# decadic log
log10(10)
```

```
## [1] 1
```


```r
# log to base of 4
log(10, 4)
```

```
## [1] 1.660964
```


```r
# exponential
exp(2)
```

```
## [1] 7.389056
```


```r
# pi is a built-in constant
pi
```

```
## [1] 3.141593
```

```r
# but not e
e^2
```

```
## Error in eval(expr, envir, enclos): object 'e' not found
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

With `numeric` and `integers` we can do arithmetics,

```r
2 + 1
2L + 1
```

```
## [1] 3
## [1] 3
```

, but not with `charactars` this is meaningless and gives this error


```r
'Hello world' + 1
```

```
## Error in "Hello world" + 1: non-numeric argument to binary operator
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


Logicals can be coerced to *integers* or *numerics*, with `TRUE` beeing mapped to 1 and `FALSE` to 0.


```r
as.numeric(TRUE)
```

```
## [1] 1
```

This is handy because we can also calculated the sum:


```r
TRUE + TRUE
```

```
## [1] 2
```


```r
3*TRUE + FALSE + TRUE
```

```
## [1] 4
```


### Factors
Factors are a fourth, more special, data type in R. 
You can think of factors as special character vectors with some nice additional functions.

You can create factors using the `factor` function:

```r
fac <- factor(c('A', 'A', 'B', 'B'))
class(fac)
```

```
## [1] "factor"
```

```r
fac
```

```
## [1] A A B B
## Levels: A B
```

From the output you see that factors store another information: the `levels` of the data. 

In fact R stores them internally as integers and only labels these integers according to it's levels.
Therefore, `as.numeric() return a vector of these internal integers:


```r
as.numeric(fac)
```

```
## [1] 1 1 2 2
```

and not an error like above with character vectors.

Be careful with numeric factors!
While for character vectors that can be coerced to numeric, ´as.numeric` returns the desired result



```r
char <- c('2', '2', '3', '3')
as.numeric(char)
```

```
## [1] 2 2 3 3
```

this is not the case for factors:


```r
as.numeric(factor(char))
```

```
## [1] 1 1 2 2
```

Here it returns the internal integer value (these are ordered by alphabet).

To return the desired result, first coerce to character (making R to forget about the levels) and then to numeric.


```r
as.numeric(as.character(factor(char)))
```

```
## [1] 2 2 3 3
```


You can access the levels of a factor using the `levels()` fucntion:


```r
levels(fac)
```

```
## [1] "A" "B"
```


Factors are useful for categorical data and we will encounter them later on when dealing with linear models. For now just keep in mind that factors are special characters, with special properties.




## Data structures in R
### Vectors

Vectors are the basic data structure in R. 
Vectors are one-dimensional structures (remember linear algebra from school?) and all numbers that we typed above were vectors with the lenght of one.
We can query the length of a vector using `length()`


```r
# this is a vector of lenght 1
25
```

```
## [1] 25
```

```r
length(25)
```

```
## [1] 1
```

We can create vectors using the `c()` function (short for *combine*):


```r
num_vec <- c(25, 1, 3, 6)
num_vec
```

```
## [1] 25  1  3  6
```

```r
length(num_vec)
```

```
## [1] 4
```

Or logical vectors:


```r
log_vec <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
log_vec
```

```
## [1]  TRUE FALSE FALSE  TRUE  TRUE
```

```r
length(log_vec)
```

```
## [1] 5
```

```r
class(log_vec)
```

```
## [1] "logical"
```

Note that all elements must be of the same type. 
If we combine elements from different type the whole vector will be coerced to the lowest type (`logical` > `integer` > `numeric` > `character`):


```r
a <- c(TRUE, 2L, 2.5, 'hello')
a
```

```
## [1] "TRUE"  "2"     "2.5"   "hello"
```

```r
class(a)
```

```
## [1] "character"
```

```r
b <- c(TRUE, 2L, 2.5)
b
```

```
## [1] 1.0 2.0 2.5
```

```r
class(b)
```

```
## [1] "numeric"
```

```r
c <- c(FALSE, 'hello')
class(c)
```

```
## [1] "character"
```

We can also do math with vectors:


```r
num_vec <- c(1, 2, 3)
num_vec
```

```
## [1] 1 2 3
```


```r
# elementwise addition
num_vec + 2
```

```
## [1] 3 4 5
```


```r
# elementwise power
num_vec^2
```

```
## [1] 1 4 9
```


```r
# sum of vector elements
sum(num_vec)
```

```
## [1] 6
```


```r
# mean of vector
sum(num_vec) / length(num_vec)
```

```
## [1] 2
```

```r
# or directly suing the mean() function
mean(num_vec)
```

```
## [1] 2
```


Often, we need to create sequences of numbers.
Here the `seq()` function is handy, it take at least two arguments `from` and `to`


```r
# sequence from 2 to 10
seq(from = 2, to = 10)
```

```
## [1]  2  3  4  5  6  7  8  9 10
```

```r
# sequence from 10 to 3
seq(from = 10, to = 3)
```

```
## [1] 10  9  8  7  6  5  4  3
```

A shortcut for such sequences with steps of 1 or -1 is the colon operator `:`


```r
# sequence from 2 to 10
2:10
```

```
## [1]  2  3  4  5  6  7  8  9 10
```

```r
# sequence from 10 to 3
10:3
```

```
## [1] 10  9  8  7  6  5  4  3
```

The colon operator will be very handy later on. 
However, `seq` is much more flexibel as we can change the stepsize


```r
# sequence from 2 to 5 in steps of 0.5
seq(from = 2, to = 5, by = 0.5)
```

```
## [1] 2.0 2.5 3.0 3.5 4.0 4.5 5.0
```

Or specify the length of the sequence


```r
# sequence from 2 in steps of 0.5 with length of 5
seq(from = 2, by = 0.5, length.out = 5)
```

```
## [1] 2.0 2.5 3.0 3.5 4.0
```

Note, that we can omit the argument names, but the R assumes that the arguments passed are in the correct order:


```r
# sequence from 2 to 5 in steps of 0.5
seq(2, 5, 0.5)
```

```
## [1] 2.0 2.5 3.0 3.5 4.0 4.5 5.0
```

Howevr this does not give the inteded results, because 5 is interpreted as `by` argument (third position).

```r
# intended result: sequence from 2 in steps of 0.5 with length of 5
seq(2, 0.5, 5)
```

```
## Error in seq.default(2, 0.5, 5): wrong sign in 'by' argument
```



Another useful fucntion is the replicate function `rep()`:



```r
# repeats the vector hello 3 times
rep('hello', times = 3)
```

```
## [1] "hello" "hello" "hello"
```


```r
# repeats the vector c('hello', 'world') 3 times
rep(c('hello', 'world'), times = 3)
```

```
## [1] "hello" "world" "hello" "world" "hello" "world"
```

If we want to repeat each vector element we need to use the `each` argument:



```r
# repeats each element of the vector c('hello', 'world') 3 times
rep(c('hello', 'world'), each = 3)
```

```
## [1] "hello" "hello" "hello" "world" "world" "world"
```




### Matrices

Matrices are the 2-dimensional extension of vectors. 

We can combine two vectors to a matrix using `cbind` (combine by columns) or `rbind` combine by rows:


```r
vec1 <- 1:5
vec2 <- rep(9, 5)
# combine by columns
mat1 <- cbind(vec1, vec2)
mat1
```

```
##      vec1 vec2
## [1,]    1    9
## [2,]    2    9
## [3,]    3    9
## [4,]    4    9
## [5,]    5    9
```

```r
# combine by rows
mat2 <- rbind(vec1, vec2)
mat2
```

```
##      [,1] [,2] [,3] [,4] [,5]
## vec1    1    2    3    4    5
## vec2    9    9    9    9    9
```

```r
class(mat2)
```

```
## [1] "matrix"
```

Similar, to the `length` function for vectors, there is a dimension function for matrices


```r
dim(mat1) # 5 rows, 2 columns
```

```
## [1] 5 2
```

```r
dim(mat2) # 2 rows, 5 columns
```

```
## [1] 2 5
```

As with vectors, all elements in a matrix must be of same type. If not the are coerced downwards.


```r
cbind(c(1, 3), 
  c('hello', 'world'))
```

```
##      [,1] [,2]   
## [1,] "1"  "hello"
## [2,] "3"  "world"
```

An we can do elementwise arithmetic


```r
mat1 + 10
```

```
##      vec1 vec2
## [1,]   11   19
## [2,]   12   19
## [3,]   13   19
## [4,]   14   19
## [5,]   15   19
```

```r
sqrt(mat1)
```

```
##          vec1 vec2
## [1,] 1.000000    3
## [2,] 1.414214    3
## [3,] 1.732051    3
## [4,] 2.000000    3
## [5,] 2.236068    3
```

Matrices can be also created with the `matrix()` function:



```r
rot <- matrix(c(0, 1, 
                1, 0), ncol = 2, byrow = TRUE)
```



### Data.frames
The constrained of matrices having all data of same type is not very appealing for data analysis, where we might have different variable types in one data sheet (e.g numeric descriptors and categorical descriptors). 
Nevertheless, matrices and matrix algebra playa a central role in R's computations.

A `data.frame` in another, more flexibel, 2-dimensional data structure. 
In fact, it will be your mostly used structure. 
`data.frames` allow different types of variables, but all must be of the same lenght.

You can create data.frames using the `data.frame()` function:


```r
df <- data.frame(1:5, c('A', 'A', 'A', 'B', 'B'))
df
```

```
##   X1.5 c..A....A....A....B....B..
## 1    1                          A
## 2    2                          A
## 3    3                          A
## 4    4                          B
## 5    5                          B
```




### Lists
