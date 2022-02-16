

%Lab Work 3 
%Author: Mehmet Berk Şahin 
%ID: 21703190
%Section 2

%Important Note: Please run the parts one by one by uncommenting.


%Part-1: Margin Estimation  

%Gc
% K = 14.78;
% tau = 0.191;
% Kc = 2/K;
% tauLPF = 3/tau;
% 
% q1 = [1];
% q2 = [1 tauLPF];
% q3 = [Kc 80*Kc];
% q4 = [1 0];
% sys1 = tf(q1,q2);
% sys2 = tf(q3,q4);
% Gc = series(sys1,sys2);
% Gp = tf(K,[tau 1]);
% L = series(Gc,Gp);
% bode(L)
% grid on;
% hold on;
% 
% margins = allmargin(L)

%This side is values, do not uncomment it

%Values:
% GainMargin: 8.8962 (dB)
%     GMFrequency: 10.5544
%     PhaseMargin: 23.3762
%     PMFrequency: 6.1564
%     DelayMargin: 0.0663
%     DMFrequency: 6.1564
%          Stable: 1

%Part-2: Margin Verification

%Check-2
% dc_gain = 3.26;
% model = 'lab3_step_GM';
% load_system(model);
% simOutput = sim(model);
% output = simOutput.simout;
% plot(output,'LineWidth',1.5);
% title('Output Signal for Gain = 10.2644');
% ylim([min(output) max(output)])

%Check-3
% h = 0.0765;
% model2 = 'lab3_step_DM';
% load_system(model2);
% simOutput2 = sim(model2);
% output2 = simOutput2.simout;
% plot(output2,'LineWidth',1.5);
% title('Output Signal for Delay = 0.0765');
% ylim([min(output2) max(output2)])


