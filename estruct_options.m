%% Tonic spiking
optiontype(1).nombres='tonic spiking';
optiontype(1).a=0.02;
optiontype(1).b=0.2;
optiontype(1).c=-65;
optiontype(1).d=6;
optiontype(1).Voltaje=-70;
optiontype(1).u=optiontype(1).b*optiontype(1).Voltaje;
optiontype(1).Tau=0.25;
optiontype(1).Imp_max=5;
optiontype(1).t_ms=190;
%% Phasic spiking
optiontype(2).nombres='phasic spiking';
optiontype(2).a=0.02;
optiontype(2).b=0.25;
optiontype(2).c=-65;
optiontype(2).d=6;
optiontype(2).Voltaje=-64;
optiontype(2).u=optiontype(2).b*optiontype(2).Voltaje;
optiontype(2).Tau=0.25;
optiontype(2).Imp_max=1;
optiontype(2).t_ms=180;
%% Tonic bursting
optiontype(3).nombres='tonic bursting';
optiontype(3).a=0.02;
optiontype(3).b=0.2;
optiontype(3).c=-50;
optiontype(3).d=2;
optiontype(3).Voltaje=-70;
optiontype(3).u=optiontype(3).b*optiontype(3).Voltaje;
optiontype(3).Tau=0.1;
optiontype(3).Imp_max=29;
optiontype(3).t_ms=198;
%% Phasic bursting
optiontype(4).nombres='phasic bursting';
optiontype(4).a=0.02;
optiontype(4).b=0.25;
optiontype(4).c=-55;
optiontype(4).d=0.05;
optiontype(4).Voltaje=-64;
optiontype(4).u=optiontype(4).b*optiontype(4).Voltaje;
optiontype(4).Tau=0.2;
optiontype(4).Imp_max=6;
optiontype(4).t_ms=180;
%% Mixed mode
optiontype(5).nombres='mixed mode';
optiontype(5).a=0.02;
optiontype(5).b=0.2;
optiontype(5).c=-55;
optiontype(5).d=4;
optiontype(5).Voltaje=-70;
optiontype(5).u=optiontype(5).b*optiontype(5).Voltaje;
optiontype(5).Tau=0.25;
optiontype(5).Imp_max=6;
optiontype(5).t_ms=144;
%% Spike freq.adapt
optiontype(6).nombres='spike freq.adapt';
optiontype(6).a=0.01;
optiontype(6).b=0.2;
optiontype(6).c=-65;
optiontype(6).d=8;
optiontype(6).Voltaje=-70;
optiontype(6).u=optiontype(6).b*optiontype(6).Voltaje;
optiontype(6).Tau=0.25;
optiontype(6).Imp_max=6;
optiontype(6).t_ms=76.5;
%% Spike latency
optiontype(7).nombres='spike latency';
optiontype(7).a=0.02;
optiontype(7).b=0.2;
optiontype(7).c=-65;
optiontype(7).d=6;
optiontype(7).Voltaje=-70;
optiontype(7).u=optiontype(7).b*optiontype(7).Voltaje;
optiontype(7).Tau=0.2;
optiontype(7).Imp_max=1;
optiontype(7).t_ms=90;
%% Class 2 excitable
optiontype(8).nombres='class 2 excitable';
optiontype(8).a=0.2;
optiontype(8).b=0.26;
optiontype(8).c=-65;
optiontype(8).d=0;
optiontype(8).Voltaje=-64;
optiontype(8).u=optiontype(8).b*optiontype(8).Voltaje;
optiontype(8).Tau=0.25;
optiontype(8).Imp_max=14;
optiontype(8).t_ms=170;
%% Class 1 excitable
optiontype(9).nombres='class 1 excitable';
optiontype(9).a=0.02;
optiontype(9).b=-0.1;
optiontype(9).c=-55;
optiontype(9).d=6;
optiontype(9).Voltaje=-60;
optiontype(9).u=optiontype(9).b*optiontype(9).Voltaje;
optiontype(9).Tau=0.25;
optiontype(9).Imp_max=10;
optiontype(9).t_ms=170;
%% Subthreshold
optiontype(10).nombres='subthreshold';
optiontype(10).a=0.05;
optiontype(10).b=0.26;
optiontype(10).c=-60;
optiontype(10).d=0;
optiontype(10).Voltaje=-62;
optiontype(10).u=optiontype(10).b*optiontype(10).Voltaje;
optiontype(10).Tau=0.25;
optiontype(10).Imp_max=1;
optiontype(10).t_ms=180;
%% Resonator
optiontype(11).nombres='resonator';
optiontype(11).a=0.1;
optiontype(11).b=0.26;
optiontype(11).c=-60;
optiontype(11).d=-1;
optiontype(11).Voltaje=-62;
optiontype(11).u=optiontype(11).b*optiontype(11).Voltaje;
optiontype(11).Tau=0.25;
optiontype(11).Imp_max=1;
optiontype(11).t_ms=360;
%% Integrator
optiontype(12).nombres='integrator';
optiontype(12).a=0.02;
optiontype(12).b=-0.1;
optiontype(12).c=-55;
optiontype(12).d=6;
optiontype(12).Voltaje=-60;
optiontype(12).u=optiontype(12).b*optiontype(12).Voltaje;
optiontype(12).Tau=0.25;
optiontype(12).Imp_max=1;
optiontype(12).t_ms=100-9.09091;
%% Rebound spike
optiontype(13).nombres='rebound spike';
optiontype(13).a=0.03;
optiontype(13).b=0.25;
optiontype(13).c=-60;
optiontype(13).d=4;
optiontype(13).Voltaje=-64;
optiontype(13).u=optiontype(13).b*optiontype(13).Voltaje;
optiontype(13).Tau=0.2;
optiontype(13).Imp_max=1;
optiontype(13).t_ms=180;
%% Rebound burst
optiontype(14).nombres='rebound burst';
optiontype(14).a=0.03;
optiontype(14).b=0.25;
optiontype(14).c=-52;
optiontype(14).d=0;
optiontype(14).Voltaje=-64;
optiontype(14).u=optiontype(14).b*optiontype(14).Voltaje;
optiontype(14).Tau=0.2;
optiontype(14).Imp_max=7;
optiontype(14).t_ms=180;
%% Thresh. variability
optiontype(15).nombres='thresh. variability';
optiontype(15).a=0.03;
optiontype(15).b=0.25;
optiontype(15).c=-60;
optiontype(15).d=4;
optiontype(15).Voltaje=-64;
optiontype(15).u=optiontype(15).b*optiontype(15).Voltaje;
optiontype(15).Tau=0.25;
optiontype(15).Imp_max=1;
optiontype(15).t_ms=90;
%% Bistability
optiontype(16).nombres='bistability';
optiontype(16).a=0.1;
optiontype(16).b=0.26;
optiontype(16).c=-60;
optiontype(16).d=0;
optiontype(16).Voltaje=-61;
optiontype(16).u=optiontype(16).b*optiontype(16).Voltaje;
optiontype(16).Tau=0.25;
optiontype(16).Imp_max=5;
optiontype(16).t_ms=262.5;
%% DAP
optiontype(17).nombres='DAP';
optiontype(17).a=1;
optiontype(17).b=0.2;
optiontype(17).c=-60;
optiontype(17).d=-21;
optiontype(17).Voltaje=-70;
optiontype(17).u=optiontype(17).b*optiontype(17).Voltaje;
optiontype(17).Tau=0.1;
optiontype(17).Imp_max=1;
optiontype(17).t_ms=41;
%% Accomodation
optiontype(18).nombres='accomodation';
optiontype(18).a=0.02;
optiontype(18).b=1;
optiontype(18).c=-55;
optiontype(18).d=4;
optiontype(18).Voltaje=-65;
optiontype(18).u=-16;
optiontype(18).Tau=0.5;
optiontype(18).Imp_max=1;
optiontype(18).t_ms=200;
%% Inhibition induced spiking
optiontype(19).nombres='inhibition induced spiking';
optiontype(19).a=-0.02;
optiontype(19).b=-1;
optiontype(19).c=-60;
optiontype(19).d=8;
optiontype(19).Voltaje=-63.8;
optiontype(19).u=optiontype(19).b*optiontype(19).Voltaje;
optiontype(19).Tau=0.5;
optiontype(19).Imp_max=3;
optiontype(19).t_ms=300;
%% Inhibition induced bursting
optiontype(20).nombres='inhibition induced bursting';
optiontype(20).a=-0.026;
optiontype(20).b=-1;
optiontype(20).c=-45;
optiontype(20).d=-2;
optiontype(20).Voltaje=-63.8;
optiontype(20).u=optiontype(20).b*optiontype(20).Voltaje;
optiontype(20).Tau=0.5;
optiontype(20).Imp_max=12;
optiontype(20).t_ms=300;


for i=1:20
    optiontype(i).Imax=10;
end
