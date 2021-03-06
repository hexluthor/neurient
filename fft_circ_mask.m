% 
% Copyright (C) 2011 Brown University and Ian Martin
% 
% Authors: Jennifer Mitchel <jenmitch@brown.edu>
%          Ian Martin <martini@alum.mit.edu>
% 
% This file is part of Neurient.
% 
% Neurient is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 2 of the License, or
% (at your option) any later version.
% 
% Neurient is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with Neurient.  If not, see <http://www.gnu.org/licenses/>.
% 

function out = fft_circ_mask(im)
assert(length(size(im)) == 2); % Make sure image is flat.
[height, width] = size(im);
d = max(size(im));
x = (1:d) - d/2 - 0.5;
[xx, yy] = meshgrid(x, x);
out = real(ifft2(fft2(im, d, d) .* fftshift((xx .^ 2 + yy .^2) < (d/2)^2)));
out = out(1:height, 1:width); % crop to original size.
