function b = syntha(fb,num,fs)
    % fb = base frequency, num = length of vector(half,quarter), fs = samples(frequencies) per seconds 
    n = 0:(num-1);
    omega = 2 * pi * fb/fs;
    y = cos(omega*n) + 0.375 * cos(3*omega*n) + 0.581 * cos(5*omega*n) + 0.382 * cos(7*omega*n)+ 0.141 * cos(9 * omega*n) + 0.028 * cos(11*omega*n) + 0.009 * cos(13*omega*n);
    A = linspace(0, 0.4, (length(y)*0.25));  % generates(3d parameter points), from (1st parameter) to (2nd parameter)
    D = linspace(0.4, 0.4,(length(y)*0.05));
    S = linspace(0.4, 0.4,(length(y)*0.60));
    R = linspace(0.4, 0,(length(y)*0.10));
    ADSR = [A D S R] ;
    x = zeros(size(y));
    x(1:length(ADSR)) = ADSR;
    x(length(y)+1:length(ADSR))= [];
    tone=y.* x; %multiply element by element
    b = tone;

