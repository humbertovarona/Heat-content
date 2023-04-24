# OHC-FOI: An algoritm for Computing the Ocean Heat Content.

Version

1.03

#DOI

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5899547.svg)](https://doi.org/10.5281/zenodo.5899547)

# Description

Two Matlab algorithms are presented to compute the Ocean Heat Content by the trapezoidal method, using the variable specific heat and density at the ocean surface. One of the algorithms allows computing the Ocean Heat Content through a fractional order integral.


# Algorithm 1: Computes Ocean Heat Content using a fractional order integral.


OHC = FractionalOrderIntegralHeatContent(Alpha, Temperature, Depth, UpperLimit, LowerLimit, Cp, Rho0)


Input parameters:


Alpha is the order of the fractional integral, Alpha must tend to one (Alpha -> 1)

UpperLimit is the upper limit of the integral in meters (depth of the surface layer
of the ocean), UpperLimit > 0

LowerLimit is the lower limit of the integral in meters (depth of the layer for
which the OHC is to be computed), LowerLimit > 0

Cp is the specific heat in J / (Kg °C) or J / (Kg K)
J / (Kg °C) and J / (Kg K) are the same units but with different origins
in temperature

Rho0 is the density of the sea surface in kg / m^3

Temperature is the potential temperature in °C or K

Depth is the depth in meters (Depth > 0)

Output parameters:


OHC is the Oceanic Heat Content in J m^2


# Algorithm 2: Computes Ocean Heat Content


OHC = CalculateHeatContent(Temperature, Depth, UpperLimit, LowerLimit, Cp, Rho0)


Input parameters:


UpperLimit is the upper limit of the integral in meters (depth of the surface layer
of the ocean), UpperLimit > 0

LowerLimit is the lower limit of the integral in meters (depth of the layer for
which the OHC is to be computed), LowerLimit > 0

Cp is the specific heat in J / (Kg °C) or J / (Kg K)
J / (Kg °C) and J / (Kg K) are the same units but with different origins
in temperature

Rho0 is the density of the sea surface in kg / m^3

Temperature is the potential temperature in °C or K

Depth is the depth in meters (Depth > 0)


Output parameters:


OHC is the Oceanic Heat Content in J m^2
