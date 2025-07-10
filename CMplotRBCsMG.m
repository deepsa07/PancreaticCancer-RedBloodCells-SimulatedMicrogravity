%%%% RBCs from Pancreatic Cancer Patient - Microgravity Project at 0.01 S/m %%%%

%%%%%%%%%%%%%%%%%%%%%%%% Sai Deepika Reddy Yaram [SDRY] %%%%%%%%%%%%%%%%%%%%%%%%

%RADII%
%healthy cell parameters%
d2=8e-6;   %outer cell diameter
r2=d2/2;     %outer cell radius
d=7.5e-9;      %thickness
r1=r2-d;     %inner cell radius
a=(r2/r1)^3;
a5i=a;
a7i=a;

%FIXED VARIABLES%
e0=8.854e-12; %Permittivity of free space
j=sqrt(-1);  
f1=[1 1.2 1.44 1.2^3 1.2^4 1.2^5 1.2^6 1.2^7 1.2^8 1.2^9 1.2^10 1.2^11 1.2^12];
w=2*pi*[1e3*f1 1e4*f1 1e5*f1 1e6*f1 1e7*f1 1e8*f1 1e9*f1];
f0=w ./(2*pi);

q31=0.01;   %100 healthy cells medium conductivity
q32=0.01;   %200 healthy cells medium conductivity
q33=0.01;   %300 healthy cells medium conductivity
q34=0.01;   %400 healthy cells medium conductivity
q35=0.01;   %500 healthy cells medium conductivity

e3=78*e0;   %medium permittivity
e1=60*e0;   %cytoplasm permittivity

% Experimental Data %
q11=0.1302635714;     %0 hr NG cytoplasm conductivity
q12=0.03498780222;    %3 hr NG cytoplasm conductivity
q13=0.02943629616;    %6 hr NG cytoplasm conductivity

q125i=0.02527582724;    %3 hr SMG cytoplasm conductivity
q135i=0.01571785581;    %6 hr SMG cytoplasm conductivity

% q1275i=0.01661794216;    %3 hr post SMG cytoplasm conductivity
% q1375i=0.01201638255;    %6 hr post SMG cytoplasm conductivity

G21=1564.63299;   %0 hr NG membrane conductance
G22=3823.108841;  %3 hr NG membrane conductance
G23=7494.856342;  %6 hr NG membrane conductance
q21=G21*d;        %0 hr NG membrane conductivity
q22=G22*d;        %3 hr NG membrane conductivity
q23=G23*d;        %6 hr NG membrane conductivity

G225i=4168.722139;     %3 hr SMG membrane conductance
G235i=7802.546774;     %6 hr SMG membrane conductance
q225i=G225i*d;         %3 hr SMG membrane conductivity
q235i=G235i*d;         %6 hr SMG membrane conductivity

% G2275i=4990.950699;      %3 hr post SMG membrane conductance
% G2375i=2401.250172;      %6 hr post SMG membrane conductance
% q2275i=G225i*d;          %3 hr post SMG membrane conductivity
% q2375i=G235i*d;          %6 hr post SMG membrane conductivity

C21=0.003203265162;  %0 hr NG membrane capacitance
C22=0.007554117873;  %3 hr NG membrane capacitance
C23=0.01271398257;    %6 hr NG membrane capacitance
e21=C21*d;           %0 hr NG membrane permittivity
e22=C22*d;           %3 hr NG membrane permittivity
e23=C23*d;           %6 hr NG membrane permittivity

C225i=0.01208143056;    %3 hr SMG membrane capacitance
C235i=0.0268316233;    %6 hr SMG membrane capacitance
e225i=C225i*d;          %3 hr SMG infected cells membrane permittivity
e235i=C235i*d;          %6 hr SMG infected cells membrane permittivity

% C2275i=0.01130290765;        %3 hr post SMG membrane capacitance
% C2375i=0.03411512907;        %6 hr post SMG membrane capacitance
% e2275i=C2275i*d;             %3 hr post SMG membrane permittivity
% e2375i=C2375i*d;             %6 hr post SMG membrane permittivity

tau = 0;      %time constant of low frequency dispersion
scale=0 ;     %magnitude of low frequency dispersion
factor=1 ;    %scaling factor for DEP spectrum

%SET UP COMPLEX PERMITTIVITIES
ec11=e1-j*q11 ./w;
ec21=e21-j*q21 ./w;
ec31=e3-j*q31 ./w;
ec12 = e1-j*q12./w;
ec22 = e22-j*q22./w;
ec32 = e3-j*q31./w;
ec13 = e1-j*q13./w;
ec23 = e23-j*q23./w;
ec33 = e3-j*q33./w;

ec125i = e1-j*q125i./w;
ec225i = e225i-j*q225i./w;
ec325i = e3-j*q32./w;
ec135i = e1-j*q135i./w;
ec235i = e235i-j*q235i./w;
ec335i = e3-j*q33./w;

% ec1275i = e1-j*q1275i./w;
% ec2275i = e2275i-j*q2275i./w;
% ec3275i = e3-j*q32./w;
% ec1375i = e1-j*q1375i./w;
% ec2375i = e2375i-j*q2375i./w;
% ec3375i = e3-j*q33./w;

%LOW FREQUENCY DISPERSION
dispersion=scale*(1./(1+j.*tau.*w));

%SINGLE SHELL CLAUSIUS MOSSOTTI FACTOR WITH DISPERSION
% Normal gravity %
ec121=(ec11-ec21) ./(ec11+2*ec21);
ef21=ec21 .*(a+2*ec121) ./(a-ec121);
cmf1= (dispersion+ ((ef21-ec31) ./(ef21+2*ec31)));
re1= real(cmf1);
Geff1=q21/d;
Ceff1=e21/d;
ec122=(ec12-ec22)./(ec12+ (2*ec22));
ef22=ec22 .*(a+2*ec122)./(a-ec122);
cmf2= (dispersion + ((ef22-ec32)./(ef22 +(2*ec32))));
re2= real(cmf2);
Geff2 = q22/d;
Ceff2 = e22/d;
ec123=(ec13-ec23)./(ec13+ (2*ec23));
ef23=ec23 .*(a+2*ec123)./(a-ec123);
cmf3= (dispersion + ((ef23-ec33)./(ef23 +(2*ec33))));
re3= real(cmf3);
Geff3 = q23/d;
Ceff3 = e23/d;

% Simulated Microgravity %
ec1225i=(ec125i-ec225i)./(ec125i+ (2*ec225i));
ef225i=ec225i .*(a5i+2*ec1225i)./(a5i-ec1225i);
cmf25i= (dispersion + ((ef225i-ec325i)./(ef225i +(2*ec325i))));
re25i= real(cmf25i);
% Geff2i = q22i/di;
% Ceff2i = e22i/di;
ec1235i=(ec135i-ec235i)./(ec135i+ (2*ec235i));
ef235i=ec235i .*(a5i+2*ec1235i)./(a5i-ec1235i);
cmf35i= (dispersion + ((ef235i-ec335i)./(ef235i +(2*ec335i))));
re35i= real(cmf35i);
% Geff3i = q23i/di;
% Ceff3i = e23i/di;

% % Post Simulated Microgravity %
% ec12275i=(ec1275i-ec2275i)./(ec1275i+ (2*ec2275i));
% ef2275i=ec2275i .*(a7i+2*ec12275i)./(a7i-ec12275i);
% cmf275i= (dispersion + ((ef2275i-ec3275i)./(ef2275i +(2*ec3275i))));
% re275i= real(cmf275i);
% % Geff2i = q22i/di;
% % Ceff2i = e22i/di;
% ec12375i=(ec1375i-ec2375i)./(ec1375i+ (2*ec2375i));
% ef2375i=ec2375i .*(a7i+2*ec12375i)./(a7i-ec12375i);
% cmf375i= (dispersion + ((ef2375i-ec3375i)./(ef2375i +(2*ec3375i))));
% re375i= real(cmf375i);
% % Geff3i = q23i/di;
% % Ceff3i = e23i/di;

figure(1) %CM factor plot for healthy and infected cells
semilogx(f0,re1,'r', f0,re2,'b', f0,re3,'g', f0,re25i,'--b', f0,re35i,'--g','LineWidth',1.5);
%semilogx(f0,re1,'r', f0,re3,'g', f0,re15i,'--r', f0,re35i,'--g', f0,re175i,':r', f0,re375i,':g','LineWidth',1.5);
xlim([10000 100000000]);
xlabel('Frequency (Hz)','FontName', 'Arial','FontSize', 16);
ylabel('Re [K(w)]','FontName', 'Arial','FontSize', 16);
legend ({'0 hr NG' '3 hr NG'  '6 hr NG' '3 hr SMG' '6 hr SMG'},'FontName', 'Arial','FontSize', 20,'LineWidth',2);
% legend ({'Uninfected-0.01 S/m' 'Uninfected-0.03 S/m' '50% Ap-Infected-0.01 S/m' '50% Ap-Infected-0.03 S/m' '75% Ap-Infected-0.01 S/m' '75% Ap-Infected-0.03 S/m'},'FontName', 'Arial','FontSize', 18,'LineWidth',1.5)
grid on