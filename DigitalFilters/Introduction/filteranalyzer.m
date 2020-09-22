function z_1 = filteranalyzer(b, a, N, plotPole)
[h,w] = freqz(b,a,N);
h = h(2:end); w = w(2:end);
mag = 20*log10(abs(h)); 
phase = unwrap(angle(h))*180/pi; 

validPole = plotPole && ~isempty(roots(a)); 
if(validPole)
    p = roots(a);
    w_n1 = angle(p(1))/pi;
    z_1 = p(1)/norm(p(1));
    y_1 = freqresp(tf(b,a),z_1);
    % y_n1 = evalfr(tf(b,a),z_1);
    % z = p(1)/norm(p(1));    % part of the unit circle
    % f = sum(b.*[1 z^(-1) z^(-2) z^(-3)])/sum(a.*[1 z^(-1) z^(-2) z^(-3)]);
    
    mag_1 = 20*log10(abs(y_1));
    phase_1 = angle(y_1)*180/pi-360;
end

figure('Name','Frequency Response Marked')
subplot(2,1,1); 
hold on; grid on; box on;
plot(w/pi,mag,'b');
if(validPole)
    scatter(w_n1,mag_1,'r*','Linewidth',2);
    line([w_n1 w_n1],[min(mag) mag_1],'Color','red','LineStyle','--')
end
axis tight
ylabel('Magnitude (dB)')
xlabel('\fontsize{10} Normalized Frequency (\times\pi rad/sample)','Interpreter',"tex")
title('Frequency Response of H(z)'); hold off;

subplot(2,1,2);
hold on; grid on; box on;
plot(w/pi,phase,'b');
if(validPole)
    scatter(w_n1,phase_1,'r*','Linewidth',2);
    line([w_n1 w_n1],[min(phase) phase_1],'Color','red','LineStyle','--')
end
axis tight
ylabel('Phase (degrees)')
xlabel('\fontsize{10} Normalized Frequency (\times\pi rad/sample)','Interpreter',"tex")
end