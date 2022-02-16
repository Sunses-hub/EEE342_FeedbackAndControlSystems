
%Author: Mehmet Berk Şahin
%ID: 21703190
%Section: 2
%--------------------Part I------------------------

% load('DCmotor.mat');
% figure(1);
% plot(DCmotor.out);
% title("Given response of the DC motor");
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% 

% simin = DCmotor.out ;
% figure(2);
% plot(out.simout,'green')
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% title("Filtered Signal and Approximated Signal");
% hold on
% % 
% data = out.simout.Data';
% data2 = out.simout.Data;
% y_2 = [data(20001:100001)]; % the values between 2<t<10
% %IMPORTANT NOTE: In the lab report gain is 133 so try DC motor until gain
% %is 133 ! 
% gain = round(mean(y_2))    %9K= gain        
% % 
% % 
% plot(out.simout1,'black');
% legend("Filtered Signal","First Order Approximated Transfer Function");
% hold off

%------------------End of Part I-------------------

%------------------Part II-------------------------
%Note: You can see the three cases for PI controller by
%changing the constants in closed loop model.
%Three cases for Ki and Kp are [0.05, 0.01], [0.5, 2.5] and [1, 0.05]
% figure();
% plot(out.y, 'green');
% hold on;
% upperbound = 120+120*0.02;
% t1 = (0.8:10);
% upperbound = ones(1,length(t1))*upperbound;
% 
% lowerbound = 120-120*0.02;
% lowerbound = ones(1,length(t1))*lowerbound;
% plot(t1,lowerbound,'b');
% hold on
% plot(t1,upperbound,'b');
% hold on
% t2 = (0:10);
% overshot = 132;
% overshot = ones(1,length(t2))*overshot;
% plot(t2,overshot,'r');
% legend("DC Motor Data","Settling Time Limit1","Settling Time Limit2","Overshoot Limit")
% xlabel('Time (seconds)');
% ylabel('Angular Speed (rpm)');
% title('Angular Speed vs Time')
%-------------------End of Part II----------------

%------------------Part III-----------------------

% figure();
% approximated = out.y; %while running this part comment this
% plot(approximated, 'black');
% hold on
% plot(out.y,'cyan');
% hold on
% legend("Linearly Approximated","Non-Linear Model");
% xlabel('Time (Seconds)');
% ylabel('data');
% title('Time Series Plot');
% hold off;

%-------------------End of Part III