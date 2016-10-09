function y = aFilterResponseFile(t, ft, x, freq, mag, phase)
%AFILTERRESPONSE computes the response of a signal to an
%analog filter
%   aFilterResponse receives a vector of the independent
%   variable: time, its sample frequency, the dependent variable,
%   the frequency vector in Hertz, the magnitude in times and the phase in degrees.
%   It returns the response to the analog filter

%   Copyright 2015-2015 Grupo 1
%   $Revision: NaN $  $Date: 26/03/2015 $

    %% Time specifications:
    size_t = length(t);
    freqVector = linspace(-ft / 2, ft / 2, size_t);
    mag=[mag,zeros(1,floor((size_t)/2-length(freq)))];
    phase=[phase,zeros(1,floor((size_t)/2-length(freq)))];
    freq=[freq,linspace(max(freq)+1,max(freqVector),(size_t)/2-length(freq))];
    %% Transfer Funct°
    freqVector_bode = freqVector(1, round(size_t / 2) : end);
    mag_inter = interp1(freq, mag, freqVector_bode, 'spline');
    phase_inter = interp1(freq, phase, freqVector_bode, 'spline');
    H = exp(phase_inter * 1i * 2 * pi / 360) .* mag_inter;

    H_mirror = 1;
    for n = 1:length(H)
        H_mirror(n) = H(length(H) + 1 - n); %no tengo internet y no puedo buscar como mirrorear un vector
    end
    H_mirror = horzcat(H_mirror(1:end - 1), H);

    %% Signals
    X = fft(x);
    X = fftshift(X);


    Y = X .* H_mirror;

    Y = ifftshift(Y);
    y = ifft(Y, 'symmetric');
end

