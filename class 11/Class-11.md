Class 11.Rmd
================

``` r
setwd("~/Desktop")
pdb <- read.csv("pdb.csv", row.names=1)
```

``` r
summary(pdb)
```

    ##      X.ray               NMR                EM          Multiple.methods
    ##  Min.   :    11.0   Min.   :    6.0   Min.   :   0.00   Min.   :  0.00  
    ##  1st Qu.:   703.8   1st Qu.:   31.0   1st Qu.:  17.25   1st Qu.:  1.50  
    ##  Median :  4929.5   Median :  152.5   Median : 519.50   Median :  4.00  
    ##  Mean   : 26789.3   Mean   : 2253.0   Mean   :1504.50   Mean   : 32.33  
    ##  3rd Qu.:  8183.2   3rd Qu.: 1097.5   3rd Qu.:1734.25   3rd Qu.:  7.25  
    ##  Max.   :142303.0   Max.   :11804.0   Max.   :5999.00   Max.   :177.00  
    ##     Neutron         Other            Total       
    ##  Min.   : 0.0   Min.   : 0.000   Min.   :    22  
    ##  1st Qu.: 0.0   1st Qu.: 0.000   1st Qu.:  1090  
    ##  Median : 0.0   Median : 0.500   Median :  6620  
    ##  Mean   :12.0   Mean   : 6.167   Mean   : 30597  
    ##  3rd Qu.: 1.5   3rd Qu.: 3.250   3rd Qu.:  9673  
    ##  Max.   :70.0   Max.   :32.000   Max.   :160385

``` r
method.sums <- colSums(pdb)
round(method.sums/method.sums["Total"]*100,2)
```

    ##            X.ray              NMR               EM Multiple.methods 
    ##            87.55             7.36             4.92             0.11 
    ##          Neutron            Other            Total 
    ##             0.04             0.02           100.00

``` r
xray <- sum(pdb$X.ray)
EM <- sum(pdb$EM)
Q1 <- (EM + xray)
```

``` r
total <- sum(pdb$Total)
Q1/total
```

    ## [1] 0.9247157

``` r
(xray/total)*100
```

    ## [1] 87.55447

``` r
(EM/total)*100
```

    ## [1] 4.917095

> Q1: What percentage of structures in the PDB are solved by X-Ray and
> Electron Microscopy.

87.55% of the structures are solved by X ray and 4.92% are solved by
electron microscopy

> Q2: What proportion of structures in the PDB are protein?

most are proteins, making up 87.4%

``` r
type.sums <- rowSums(pdb)
type.sums
```

    ##          Protein (only) Protein/Oligosaccharide              Protein/NA 
    ##                  320770                   18858                   19508 
    ##     Nucleic acid (only)                   Other  Oligosaccharide (only) 
    ##                    7622                     366                      44

``` r
type.sums[1]/method.sums["Total"]
```

    ## Protein (only) 
    ##       1.747266

> Q3: Type HIV in the PDB website search box on the home page and
> determine how many HIV-1 protease structures are in the current PDB?

There are 1828 HIV-1 protease structures in the PDB database

**VMD**

> Q4: Water molecules normally have 3 atoms. Why do we see just one atom
> per water molecule in this structure?

The hydrogens are too small in comparison to the oxygen, which is why we
only see one atom per water molecule.

> Q5: There is a conserved water molecule in the binding site. Can you
> identify this water molecule? What residue number does this water
> molecule have (see note below)?

residue number: MK1902:04

![](bioinformatics/class07/bimm143_github/class%2011/vmdscene.png)
