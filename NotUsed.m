%%


FocalLength=5e-3;
BeamWaist=440e-9;

PSFFilter=exp(-(Xi.^2+Yi.^2)/BeamWaist^2);
IntFactor=4*pi^2*1/S*dxi*dyi*IntFactor;




dkx=qx(2)-qx(1);
dky=qy(2)-qy(1);
Nxi=length(kxiSub);
Nyi=length(kyiSub);

DXi=2*pi/dkx;
DYi=2*pi/dky;
dxi=DXi/Nxi;
dyi=DYi/Nyi;
xi=linspace(-(Nxi-1)/2,(Nxi-1)/2,Nxi)*dxi;
yi=linspace(-(Nyi-1)/2,(Nyi-1)/2,Nyi)*dyi;

cosPhi=Qx./Q;
sinPhi=Qy./Q;
cosPhi(isnan(cosPhi))=1;
sinPhi(isnan(sinPhi))=0;

Factor=(-2i*pi*sqrt(Kz*k0))*exp(1i*k0*FocalLength)/FocalLength;
IntFactor=1/(4*pi^2)*dkx*dky;

fftE=fftE.*Factor;

Es=-sinPhi.*fftE(:,:,1)+cosPhi.*fftE(:,:,2);
Ep=cosPhi.*Kz/k0.*fftE(:,:,1)+sinPhi.*Kz/k0.*fftE(:,:,2)-Kr/k0.*fftE(:,:,3);

Ex=Ep.*cosPhi-Es.*sinPhi;
Ey=Ep.*sinPhi+Es.*cosPhi;



Ex=(FocalLength/k0)^2*numel(Ex)*1/(4*pi^2)*dkx*dky*fftshift(fftshift(ifft2(ifftshift(ifftshift(Ex.*double(Kr<=k0*NA),1),2)),1),2);
Ey=(FocalLength/k0)^2*numel(Ey)*1/(4*pi^2)*dkx*dky*fftshift(fftshift(ifft2(ifftshift(ifftshift(Ey.*double(Kr<=k0*NA),1),2)),1),2);

Ex=Ex.*PSFFilter;
Ey=Ey.*PSFFilter;


hbar=6.626e-34/(2*pi); %kg m s^-1
ee=1.602e-19; %C
me=9.109e-31; %kg
KB=1.38e-23;
Eps0=8.85e-12;
mu0=4*pi*1e-7;
Color=[18/255,103/255,221/255;247/255,66/255,66/255;117/255,117/255,117/255];