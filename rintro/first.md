

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


