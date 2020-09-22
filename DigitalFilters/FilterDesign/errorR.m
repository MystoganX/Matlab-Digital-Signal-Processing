function out = errorR(b,w,r,thresh)
%  ERRORR Compares the magnitude of H(z) at the cut frequency w_c = w_0 + thresh with 
% the ideal value of 1/sqrt(2)*H(w) at w = w_0
% 
% The function $H\left(z\right)$is assumed to be of the form
% 
% $H(z) = K\frac{b_0 + b_1z^{-1} + b_2z^{-2}}{(z-p_1)(z-p_2)}$,     where $p_i 
% ={\textrm{re}}^{j\omega {\;}_i }$ 
% 
% Then, the difference is obtained by calculating:
% 
% $$\textrm{error}=\left|\left(\frac{1}{\sqrt{\;2}}H\left(w_0 \right)-H\left(w_{\textrm{c1}} 
% \right)\right)\right|+\left|\left(\frac{1}{\sqrt{\;2}}H\left(w_0 \right)-H\left(w_{\textrm{c2}} 
% \right)\right)\right|$$
w_c1 = w + thresh;
w_c2 = w - thresh;
p_1 = r*exp(1i*w);
p_2 = r*exp(1i*(-w));
num_0 = abs(polyval(b,exp(1i*w)));
dem_0 = abs( (exp(1i*w)-p_1) * (exp(1i*w)-p_2) );
num_1 = abs(polyval(b,exp(1i*w_c1)));
dem_1 = abs( (exp(1i*w_c1)-p_1) * (exp(1i*w_c1)-p_2) );
num_2 = abs(polyval(b,exp(1i*w_c2)));
dem_2 = abs( (exp(1i*w_c2)-p_1) * (exp(1i*w_c2)-p_2) );
out = abs(1/sqrt(2)*num_0/dem_0 - num_1/dem_1) + abs(1/sqrt(2)*num_2/dem_2 - num_1/dem_1);
end