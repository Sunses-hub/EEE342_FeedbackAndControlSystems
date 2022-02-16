

% load('DCmotor.mat');
% figure(1);
% plot(DCmotor.out);
% title("Given response of the DC motor");
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% 
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
% gain = round(mean(y_2));    %9K= gain        
% % 
% % 
% plot(out.simout1,'black');
% legend("Filtered Signal","First Order Approximated Transfer Function");
% hold off



% simb = out.y;
% 
plot(simu,'black')
hold on
plot(out.y,'cyan');
hold on
legend("Linearly Approximated","Non-Linear Model")
% t1 = (0.8:10);
% 
% value1 = 120+120*0.02;
% value1 = ones(1,length(t1))*value1;
% 
% value2 = 120-120*0.02;
% value2 = ones(1,length(t1))*value2;
% plot(t1,value1,'b');
% hold on
% plot(t1,value2,'b');
% hold on
% t2 = (0:10);
% value3 = 132;
% value3 = ones(1,length(t2))*value3;
% plot(t2,value3,'r');
% legend("DC Motor Data","Settling Time Limit1","Settling Time Limit2","Overshoot Limit")


% 
% figure(4)
% plot(out.simOut, 'y');
% hold on
% plot(out.simOut1,'black')
% legend('data','approximation')
% hold off;
% title("Comparison of DC output and first order approximation");
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% 
% 


% load('DCmotor.mat');
% figure();
% plot(DCmotor.out);
% title("Given response of the DC motor");
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% 
% 
% simIn = DCmotor.out ;
% figure(2);
% plot(out.simOut,'green')
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% title("Filtered Signal and Approximated Signal");
% hold on
% % 
% data = out.simOut.Data';
% data2 = out.simOut.Data;
% y_2 = [data(20001:100001)]; % the values between 2<t<10
% gain = round(mean(y_2));    %9K= gain        
% % 
% % 
% plot(out.simOut1,'black');
% legend("Filtered Signal","First Order Approximated Transfer Function");
% hold off



% simb = out.y;
% 
% plot(simu,'black')
% hold on
plot(out.y,'b');grid
hold on
legend("Linearly Approximated","Non-Linear Model")
t1 = (0.8:10);

value1 = 120+120*0.02;
value1 = ones(1,length(t1))*value1;

value2 = 120-120*0.02;
value2 = ones(1,length(t1))*value2;
plot(t1,value1,'cyan');
hold on
plot(t1,value2,'cyan');
hold on
t2 = (0:10);
value3 = 132;
value3 = ones(1,length(t2))*value3;
plot(t2,value3,'r');
legend("DC Motor Data","Settling Time Limit1","Settling Time Limit2","Overshoot Limit")


% 
% figure(4)
% plot(out.simOut, 'y');
% hold on
% plot(out.simOut1,'black')
% legend('data','approximation')
% hold off;
% title("Comparison of DC output and first order approximation");
% xlabel("Time (s)");
% ylabel("Angular speed (rpm)");
% 
%
