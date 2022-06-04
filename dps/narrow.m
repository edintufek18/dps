[signal, fs] = audioread("1.danes_je_lep_dan_klarinet_22050.wav");
N = length(signal);
f = fs*(0:N-1)/ N;
subplot(2,1,1);
ftx = fft(signal);
xlim([-fs/2 fs/2]);
plot(f,abs(ftx))
title("FFT'ed amplitude spectar of the signal");

subplot(2,1,2); 
w = 2*pi*438.5/fs;
n = (0:N-1);

%clarinet equation
x = cos(w * n) + 0.375 * cos(3*w*n) + 0.581 * cos(5*w*n) + 0.382 * cos(7*w*n)... 
    + 0.141*cos(9*w*n) +0.028*cos(11*w*n)+ 0.009 *cos(13*w*n);

ftklarinet = fft(x);
xlim([-fs/2  fs/2]);
plot(f,abs(ftklarinet));
title("FFT'ed clarinted signal");

bnds = bandstop(signal, [415 465], fs);
bnds = bandstop(bnds, [1295 1345], fs);
bnds = bandstop(bnds, [2174 2224], fs);
bnds = bandstop(bnds, [3055 3105], fs);
bnds = bandstop(bnds, [3935 3985], fs);
bnds = bandstop(bnds, [4815 4865], fs);
bnds = bandstop(bnds, [5675 5725], fs);
soundsc(bnds, fs);





