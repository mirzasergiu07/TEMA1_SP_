clear;                             
clc;                              
T=40;                               
D=19;                               
Duty=(D/T)*100;                     
N = 50;                            
omega0 = (2*pi)/T;                     
C_0 = 0;                            
t = -30:0.01:30;                   
% Spectrul de amplitudini

figure(1)                         
stem(0,C_0,'b o');                       
hold on;
for n = -N:4:N,                    
  cnw = 2/(1i*n*omega0);                
  stem(n*omega0,abs(cnw),'r.') ;              
end

for n = -N+1:3:N-1,                
  cnw = 0;                          
  stem(n*omega0,abs(cnw),'g.');              
end 
xlabel('Frecventa \omega [rad/s]');
ylabel('Amplitudini |C(n\omega_0)|');
title('Spectrul de amplitudini');
grid on;


% SFC

Xc = C_0*ones(size(t));          
for n = -N/2:2:N/2,                    
  cnw = 2/(1j*omega0*n)        
  Xc = Xc + real(cnw*exp(1j*n*omega0*t)); 
  end
x2 = square(2*pi*omega0*t,Duty);
figure (2)
plot(t,x2,' . ','DisplayName','Semnalul neschimbat');
hold on
plot(t,Xc,'r. ','DisplayName','Semnalul reconstruit');  
hold off
xlabel('t (s)'); ylabel('y(t)');
title('Reconstructia semnalului');

lgd = legend('show');
lgd.FontSize = 9;
lgd.TextColor = 'black';
title(lgd,'Legenda')
hold;
grid on;