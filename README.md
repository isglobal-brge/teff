# teff (treatment effects classification)

This is an R Package for classifying individuals into
subpoulations associated with high and low treatment effects using feature data.

##What it does

<code>teff</code> is a package designed to extract the profiles of subpopulations
with associated high and low treatment effects. With the extracted profiles,
new individuals with feature data can be targeted and classified. If
treatment and effect data is available for these new individuals the package can test
whether the association between the treatment and the effect is indeed different
across subpopulations.

##How it does it

The classification is based on the application of random causal forest to identify the individuals with significant treatment effects. Individuals with significant treatment effects are considered for those whose confidence intervals for the treatment estimate do not overlap 0. Single consensus profiles of individuals with high, and low, treatment effects are obtained from majority votes of features adjusted for covariates.

##Additional functions

The result is two profiles associated with subpopulations with high and low treatment effects. The profiles are logical vectors across the features. The logical value of a given profile at feature indicates whether the adjusted feature of a new individual should be higher than the feature population mean if the individual is successfully targeted by the profile. 

The package include functions to extract feature and treatment data from 
transcriptomic and methylomic studies. 
