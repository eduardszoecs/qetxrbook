

S
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

Here the column names look very ugly, so we specify them:


```r
df <- data.frame(num = 1:5, char = c('A', 'A', 'A', 'B', 'B'))
df
```

```
##   num char
## 1   1    A
## 2   2    A
## 3   3    A
## 4   4    B
## 5   5    B
```

You can extract the column names using the `colnames()` function (and respectively `rownames()`):


```r
colnames(df)
```

```
## [1] "num"  "char"
```

```r
rownames(df)
```

```
## [1] "1" "2" "3" "4" "5"
```


We looking at the output we don't know directly what type each column is. 
`str()` is the swiss knife when we want to investigate the structure of an R Object:


```r
str(df)
```

```
## 'data.frame':	5 obs. of  2 variables:
##  $ num : int  1 2 3 4 5
##  $ char: Factor w/ 2 levels "A","B": 1 1 1 2 2
```

Here we see that the data.frame has 5 rows (*obs.*) and 2 columns (*variables*). 
the first variable is named *num* and is of type *integer*.
The second variables is named *char* and is of type *factor*.

But wait: We did specify a character vector, why is char a factor? 
This is because `data.frame()` has an argument `stringsAsFactors` that is by default set to `TRUE` (checkout the help). 

This behaviour is anoying and you can turn if off savely (and coerce to a factor only when you need it):


```r
df <- data.frame(num = 1:5, char = c('A', 'A', 'A', 'B', 'B'), stringsAsFactors = FALSE)
str(df)
```

```
## 'data.frame':	5 obs. of  2 variables:
##  $ num : int  1 2 3 4 5
##  $ char: chr  "A" "A" "A" "B" ...
```

Most data (csv-files, excel sheets) is organized in 2 dimensional fashion and can be read directly into data.frames. See the next chapter [---!!!link here!!!---] how to read external data into R.



### Lists

List are the most flexibel datatype in R.
Elements of  lists can be of any type (unlike vectors and matrices) and of different length (unlike data.frames).

List ca be create using the `list()` function.


```r
l <- list('A', c(1, 3, 4), df)
l
```

```
## [[1]]
## [1] "A"
## 
## [[2]]
## [1] 1 3 4
## 
## [[3]]
##   num char
## 1   1    A
## 2   2    A
## 3   3    A
## 4   4    B
## 5   5    B
```

Here I stored as the first element a character vector of lenght one, as second element a numeric vector and as third element a whole data.frame.

Again `str()` is useful to understand the structure

```r
str(l)
```

```
## List of 3
##  $ : chr "A"
##  $ : num [1:3] 1 3 4
##  $ :'data.frame':	5 obs. of  2 variables:
##   ..$ num : int [1:5] 1 2 3 4 5
##   ..$ char: chr [1:5] "A" "A" "A" "B" ...
```

It tells us, the object is a list with 4 entries and then gives details of the elements. Note the entry for the last element is identical to the one from above.

