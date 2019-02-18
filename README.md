Violets are BLUE. OLS is too.
================

`violets` is a package for `R` which re-estimates fancy statistical
models using simple OLS.

``` r
library(violets)
```

Your Poisson model of horse kicks to the head could be
BLUE:

``` r
url <- 'https://vincentarelbundock.github.io/Rdatasets/csv/pscl/prussian.csv'
dat <- read.csv(url, stringsAsFactors = FALSE)

mod <- glm(y ~ corp + year, data = dat, family = 'poisson')
violets(mod)
```

    ## Violets are BLUE. OLS is too.

    ## 
    ## Call:
    ## stats::lm(formula = f, data = mf)
    ## 
    ## Coefficients:
    ## (Intercept)        corpI       corpII      corpIII       corpIV  
    ##  -3.073e-01   -2.808e-15   -2.000e-01   -2.000e-01   -4.000e-01  
    ##      corpIX        corpV       corpVI      corpVII     corpVIII  
    ##  -1.500e-01   -2.500e-01    5.000e-02   -2.000e-01   -4.500e-01  
    ##       corpX       corpXI      corpXIV       corpXV         year  
    ##  -5.000e-02    4.500e-01    4.000e-01   -4.000e-01    1.310e-02

Your probit model of deaths aboard the titanic could be
BLUE:

``` r
url <- 'http://vincentarelbundock.github.io/Rdatasets/csv/Stat2Data/Titanic.csv'
dat <- read.csv(url, stringsAsFactors = FALSE)

mod <- glm(Survived ~ Sex + Age + PClass, data = dat, family = binomial(link = 'probit'))
violets(mod)
```

    ## Violets are BLUE. OLS is too.

    ## 
    ## Call:
    ## stats::lm(formula = f, data = mf)
    ## 
    ## Coefficients:
    ## (Intercept)      Sexmale          Age    PClass2nd    PClass3rd  
    ##    1.130523    -0.501326    -0.006005    -0.207434    -0.393344

Your ordered logit model could be BLUE:

``` r
library(MASS)
url <- 'https://vincentarelbundock.github.io/Rdatasets/csv/geepack/koch.csv'
dat <- read.csv(url, stringsAsFactors = FALSE)

dat$y <- as.factor(dat$y)
mod <- polr(y ~ day + trt, data = dat)

violets(mod)
```

    ## Violets are BLUE. OLS is too.

    ## 
    ## Call:
    ## stats::lm(formula = f, data = mf)
    ## 
    ## Coefficients:
    ## (Intercept)          day          trt  
    ##     2.70219     -0.06464     -0.36806
