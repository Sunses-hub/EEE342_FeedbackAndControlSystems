 
%Lab 2 Preliminary Work 
%Author: Mehmet Berk Şahin
%ID: 21703190
%---------------------------Question 1-----------------------------
% w = logspace(-1,2,100); 
% for k = 1:100
%     s = 1i * w(k);
%     G(k) = 15 / (0.12*s+1); 
% end
% subplot(2,1,1)
% semilogx(w,20*log10(abs(G))); 
% title("Magntude vs. Frequency");
% ylabel("Magnitude");
% xlabel("Frequency");
% grid on
% subplot(2,1,2)
% semilogx(w,angle(G)*180/pi) 
% title("Phase vs. Frequency");
% ylabel("Phase");
% xlabel("Frequency");
% grid on
%-------------------------Question 2-------------------------------
t = 0:0.001:10;
Gp = zeros(1,10); %Transfer function
Am = zeros(1,10); %Amplitude
Phi = zeros(1,10); %Phase
w = logspace(-1, 2, 10); %frequencies

for k = 1:10
    s = 1i * w(k);
    Gp(k) = 15 / ( 0.12 * s + 1 );
    input = cos( w(k) * t ); % sinusoidal signal
    output = input * Gp(k); % sin signal is applied in time domain
    
    INPUT = fft(input); % input's frequency response
    OUTPUT = fft(output); % output's frequency response
    
    [MaxInp, LocInp] = max(abs(INPUT));
    MaxOut = max(abs(OUTPUT(LocInp)));
    
    Am(k) = MaxOut / MaxInp; % magnitude of transfer function
    Phi(k) = angle( OUTPUT(LocInp) ) - angle( INPUT(LocInp) ); %phase of the transfer function 
    
end

figure('Name', 'Bode Plot Of Transfer Function');
subplot(2,1,1);
semilogx(w, 20*log10(abs(Gp))); %Magnitude (First Plot)
grid ON;
hold ON;
%semilogx(w, 20*log10(Am), 'x' );
semilogx(w, 20*log10(Am), 'x-' ); %for interpolation of sample points
title( 'Bode Plot for Magnitude' );
xlabel( 'Angulare Frequency (rad/s)' );
ylabel( 'Magnitude (dB)' );
subplot(2,1,2);
semilogx(w, angle(Gp) * 180/pi ); 
grid ON;
hold ON;
%semilogx(w, Phi * 180/pi, 'x' );
semilogx(w, Phi * 180/pi, 'x-' ); % for interpolation of sample points
ylim([-90 0]);
title( 'Bode Plot for Phase' );
xlabel( 'Angular Frequency (rad/s)' );
ylabel( 'Phase (degree)' );

