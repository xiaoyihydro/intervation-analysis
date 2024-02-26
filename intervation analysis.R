library(TSA)
library(astsa)
library(ggplot2)
library(forecast)
library(urca)
library(MASS)

tax.in<-read.csv("C:/Users/Elaine/Desktop/int.csv")
tax<-ts(tax.in,start=1870)
tax

#pulse funtion at 1909
p<-rep(0,length(tax))
p[time(tax)==1909]<-1
p

#noise series identification using before intervention(1909)
tax1<-tax[time(tax)<1909]
x11()
acf2(tax1,15)

#estimation of parameters in intervention model
tax.mdl<-arimax(tax,order=c(1,0,0), include.mean = F,xtransf=p,transfer=list(c(0,1)))
summary(tax.mdl)
x11()
tsdiag(tax.mdl)
