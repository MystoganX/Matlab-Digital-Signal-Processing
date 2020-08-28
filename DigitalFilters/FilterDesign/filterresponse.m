function [H, w, y] = filterresponse(b, a, x, varargin)
p = inputParser;
defaultFileName = '';
defaultMagPlot = 'amplitude';
validMagPlots = {'indB','amplitude'};
checkMagPlot = @(x) any(validatestring(x,validMagPlots));

addRequired(p,'b',@isnumeric);
addRequired(p,'a',@isnumeric);
addRequired(p,'x',@isnumeric);
addParameter(p,'filename',defaultFileName,@ischar)
addParameter(p,'magplot',defaultMagPlot,checkMagPlot)
% p.KeepUnmatched = true;
parse(p,b,a,x,varargin{:})

n = 0:length(x)-1;
y = filter(b,a,x);
[H,w] = freqz(b,a);
w = w/pi;

if(strcmpi(p.Results.magplot,'indb'))
    mag = 20*log10(abs(H));
    y_label = 'Magnitude (dB)';
else
    mag = abs(H);
    y_label = 'Amplitude';
end
phase = unwrap(angle(H))*180/pi;

figure('Name','Filter Effect')
subplot(2,2,1)
plot(w,mag);
ylim([min(min(mag),mean(mag)-1) max(max(mag),mean(mag)+1)])
xticks(0:0.25:1);
% xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi'})
xlabel('\omega normalized (\times \pi rad/sample)');
ylabel(y_label)
title('Magnitude \mid H(\omega) \mid');
grid on;

subplot(2,2,2)
plot(w,phase);
xticks(0:0.25:1);
% xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi'})
xlabel('\omega normalized (\times \pi rad/sample)');
ylabel('Phase (degree)')
title('Phase \angle H(\omega)');
grid on;

subplot(2,1,2)
plot(n,x,'b'); hold on;
plot(n,y,'r'); 
ylabel('Amplitude')
xlabel('n (samples)')
title('System Response')
legend({'Input','Output'})
grid on, hold off;

if(~isempty(p.Results.filename))
    set(gcf,'PaperPositionMode','auto','PaperOrientation','landscape','PaperUnits','Points','PaperSize',[1 0.6]*1024)
    print(filename,'-dpdf','-fillpage')
end

end