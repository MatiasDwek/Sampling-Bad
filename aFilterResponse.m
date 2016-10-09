function y = aFilterResponse(t, ft, x, num, den)
%AFILTERRESPONSE computes the response of a signal to an
%analog filter
%   aFilterResponse receives a vector of the independent
%   variable: time, its sample frequency, the dependent variable,
%   the numerator, and the denominator (format: [n_x ... n_1 n_0]).
%   It returns the response to the analog filter

%   Copyright 2015-2015 Grupo 1
%   $Revision: NaN $  $Date: 26/03/2015 $

    %% Time specifications:
    size_t = length(t);
    freqVector = linspace(-ft / 2, ft / 2, size_t);

    %% Transfer Funct°
    freqVector_bode = freqVector(1, round(size_t / 2) : end) * 2 * pi;
    Hs = tf(num, den);
    [mag, phase] = bode(Hs, freqVector_bode);
    H = exp(phase * 1i * 2 * pi / 360) .* mag;
    H = squeeze(H)';

    H_mirror = fliplr(H);
    H_mirror = horzcat(H_mirror(1:end - 1), H);

    %% Signals
    X = fft(x);
    X = fftshift(X);


    Y = X .* H_mirror;

    Y = ifftshift(Y);
    y = ifft(Y, 'symmetric');
end

