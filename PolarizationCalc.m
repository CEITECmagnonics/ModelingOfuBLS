% This function calculates the induced polarization during the BLS process.
% The inputs are from numerical simulations. The first step is to
% interpolate these results to same cartesian coordinates. The 2D
% convolution follows and the last step is the matrix multiplication.
% Author: Ondrej Wojewoda
function [Px,Py, Pz, kxP]=PolarizationCalc()
global FFTtruncZ FFTtruncY FFTtruncX fftE kS
FFTtruncZI = FFTtruncZ(:,:,40);
FFTtruncYI = FFTtruncY(:,:,40);
FFTtruncXI = FFTtruncX(:,:,40);
[KXorig, KYorig] = meshgrid(kS, kS);
[KX, KY] = meshgrid(kx, ky);

FFTtruncInterpY = interp2(KXorig*1e6, KYorig*1e6, FFTtruncYI, KX, KY, 'linear', 0);
FFTtruncInterpZ = interp2(KXorig*1e6, KYorig*1e6, FFTtruncZI, KX, KY, 'linear', 0);
FFTtruncInterpX = interp2(KXorig*1e6, KYorig*1e6, FFTtruncXI, KX, KY, 'linear', 0);

Px = conv2(fftE(:,:,3),1j*FFTtruncInterpY) + conv2(fftE(:,:,3),-1j*FFTtruncInterpZ);
Py = conv2(fftE(:,:,1),1j*FFTtruncInterpZ);
Pz = conv2(fftE(:,:,1),1j*FFTtruncInterpY);
kxP = linspace(2*min(kx), 2*max(kx), 1001);
[KXP, KYP] = meshgrid(kxP*1e-6, kxP*1e-6);

surf(KXP, KYP, Px.*conj(Px), 'EdgeColor','none')
view(2)
xlim([-20 20])
ylim([-20 20])



surf(KXP, KYP, Py.*conj(Py), 'EdgeColor','none')
view(2)
xlim([-20 20])
ylim([-20 20])


surf(KXP, KYP, Pz.*conj(Pz), 'EdgeColor','none')
view(2)
xlim([-20 20])
ylim([-20 20])