function OHC = FractionalOrderIntegralHeatContent(Alpha, Temperature, Depth, UpperLimit, LowerLimit, Cp, Rho0)


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % 
% % %  Calculate the Ocean Heat Content through the method of trapezoids
% % %  using an integral of fractional order
% % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % 
% % % 
% Alpha is the order of the fractional integral (Alpha -> 1)
% % % 
% UpperLimit is the upper limit of the integral in meters (depth of the surface layer
% of the ocean), UpperLimit > 0
% % % 
% LowerLimit is the lower limit of the integral in meters (depth of the layer for
% which the OHC is to be computed), LowerLimit > 0
% % % 
% Cp is the specific heat in J / (Kg °C) or J / (Kg K)
% J / (Kg °C) and J / (Kg K) are the same units but with different origins 
% in temperature
% % % 
% Rho0 is the density of the sea surface in kg / m^3
% % % 
% Temperature is the potential temperature in °C or K
% % % 
% Depth is the depth in m (Depth > 0)
% % % 
% OHC is the Oceanic Heat Content in J m^2
% % % 
% % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

    if exist('UpperLimit', 'var') == 0
        UpperLimit = Depth(1);
    end
    if exist('LowerLimit', 'var') == 0
        LowerLimit = Depth(end);
    end
    if exist('Rho0', 'var') == 0
        % % %         Levitus et al. (2005)
        Rho0 = 1025;
    end
    if exist('Cp', 'var') == 0
        % % %         Levitus et al. (2005)
        Cp = 4000; 
    end

    ul = find(Depth < UpperLimit);
    if ~isempty(ul)
        Depth(ul) = [];
        Temperature(ul) = [];
    end
    ll = find(Depth > LowerLimit);
    if ~isempty(ll)
        Depth(ll) = [];
        Temperature(ll) = [];
    end
    indZero = find(Depth == UpperLimit);
    if ~isempty(indZero)
        Depth(indZero) = Depth(indZero) + 1e-3;
    end
    NewTemperature = abs(UpperLimit - Depth).^(Alpha-1) .* Temperature;
    OHC = Cp * Rho0 / gamma(Alpha) * trapz(Depth, NewTemperature);
    
return

