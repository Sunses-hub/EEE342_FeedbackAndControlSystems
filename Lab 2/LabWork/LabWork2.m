%Lab Work 2
%Author: Mehmet Berk Şahin
%ID: 21703190
%Section 2
%
%Hello, you can run the code in one shot or you can run part by part by
%commenting and uncommenting the sections indicated.
%Values for DC motor simulation are Name: Mehmet Berk Şahin ID: 21703190
%K: 14.78 Tau: 0.191
%Workspace is downloaded to the folder as 'workspace.mat'
%Thanks. 
%
%-------------------Question 1-----------------------
% w = logspace(-1,2,100);
% K = 14.78;
% tau = 0.191;
% for k = 1:100
% s = 1i * w(k);
% G(k) = K / (tau*s+1);
% end
% figure('Name', 'Bode Plot for First Order Approximation');
% subplot(2,1,1)
% semilogx(w,20*log10(abs(G)));
% title('Bode Plot for Magnitude');
% xlabel('Angular Frequency (rad/s)');
% ylabel('Magnitude (dB)');
% grid on
% subplot(2,1,2)
% semilogx(w,angle(G)*180/pi)
% title('Bode Plot for Phase');
% xlabel('Angular Frequency (rad/s)');
% ylabel('Phase (degree)');
% grid on
%------------------Question 2-----------------------
%Check-3.1 & 3.2:
chosen_frequencies = [0.1 3 100];
chosen_durations = [180 60 5];

for j = 1:length(chosen_frequencies)
    
    figure;
    angular_frequency = chosen_frequencies(j);
    duration = chosen_durations(j);
    model = 'lab2_sinusoidal_input';
    load_system(model);
    modelOut = sim(model);
    input = modelOut.simout1;
    output = modelOut.simout;
    input2 = modelOut.simout1.Data';
    output2 = modelOut.simout.Data';

    plot(input, 'b', 'Linewidth', 1.5) 
    grid on
    hold on
    plot(output, 'r', 'Linewidth', 1.5)
    xlabel('Time(seconds)');
    ylabel('Signal');
    grid on
    title(['Angular Frequency =',num2str(angular_frequency),'rad/sec'])
    legend('Input Signal', 'Output Signal');

    Fourier_in = fft(input2);
    Fourier_out = fft(output2);

    Ts = 0.01;  
    fs = 1/Ts;
    f = 0:fs/length(Fourier_in):(length(Fourier_in)-1)*fs/length(Fourier_in);
    figure;
    plot(f,abs(Fourier_in),'r','Linewidth',1.5);
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title(['Magnitude of w=',num2str(angular_frequency),'rad/sec'])
    grid on;
    hold on;
    plot(f,abs(Fourier_out),'b','Linewidth',1.5);
    legend('Input Signal', 'Output Signal');
    
end


% Check-3.3:
frequencies = [0.1 0.3 0.7 1 3 7 10 30 70 100];
simDuration = [180 120 120 60 60 30 10 10 5 5];
Am = zeros(1,10);
Phi = zeros(1,10);



for i = 1:length(frequencies)
    
    angular_frequency = frequencies(i);
    duration = simDuration(i);
    
    model = 'lab2_sinusoidal_input';
    load_system(model);
    modelOut2 = sim(model);
    tableInput = modelOut2.simout1.Data';
    tableOutput= modelOut2.simout.Data';
    
    inputFFT = fft(tableInput);
    outputFFT = fft(tableOutput);
    
    [MaxInp, LocInp] = max(abs(inputFFT));
    MaxOut = max(abs(outputFFT(LocInp)));
    Am(i) = MaxOut / MaxInp;
    Phi(i) = angle( outputFFT(LocInp) ) - angle( inputFFT(LocInp) );

end

w = logspace(-1,2,100);
K = 14.78;
tau = 0.191;
for l = 1:100
 s = 1i * w(l);
 G(l) = K / (tau*s+1);
end
figure('Name', 'Bode Plot for First Order Approximation');
subplot(2,1,1)
semilogx(w,20*log10(abs(G)));
grid on;
hold on;
semilogx(frequencies, 20*log10(Am), 'xk');
title('Bode Plot for Magnitude');
xlabel('Angular Frequency (rad/s)');
ylabel('Magnitude (dB)');
legend({'First Order Approximation Bode Plot', 'Experimental Sample Points'}, 'Location', 'southwest');
subplot(2,1,2)
semilogx(w,angle(G)*180/pi)
grid on;
hold on;
semilogx(frequencies,unwrap(Phi)*180/pi, 'xk');

title('Bode Plot for Phase');
xlabel('Angular Frequency (rad/s)');
ylabel('Phase (degree)');
legend({'First Order Approximation Bode Plot', 'Experimental Sample Points'}, 'Location', 'southwest');

%Question 4
%
%
%Step1: 
%First Order Pade Approximation:
w = logspace(-1,2,100);
K = 14.78;
tau = 0.191;
for l = 1:100
    s = 1i * w(l);
    Gdelayed(l) = (K / (tau * s + 1))*(1-0.005*s)/(1+0.005*s);
end
% 
% %Step2/Check-4:
%Draw three Bode Plot!
figure('Name', 'Three Bode Plots');
subplot(2,1,1)
semilogx(w,20*log10(abs(Gdelayed)),'r');
title('Bode Plot for Magnitude');
xlabel('Angular Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on; hold on;
semilogx(w, 20*log10(abs(G)),'b');
grid on; hold on;
semilogx(frequencies, 20*log10(Am), 'xk');
semilogx(w, 20*log10(abs(G)));
legend({'Estimated Transfer Function in Q4','Estimated Transfer Function in Q1','Experimental Bode Plot in Q3'},'Location','southwest');


subplot(2,1,2)
semilogx(w,angle(Gdelayed)*180/pi, 'r')
title('Bode Plot for Phase');
xlabel('Angular Frequency (rad/s)');
ylabel('Phase (degree)');
grid on; hold on;
semilogx(w, angle(G)*180/pi, 'b');
grid on; hold on;
semilogx(frequencies, unwrap(Phi)*180/pi,'xk');
legend({'Estimated Transfer Function in Q4','Estimated Transfer Function in Q1','Experimental Bode Plot in Q3'},'Location','southwest');






% 
