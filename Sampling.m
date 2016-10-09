%   The following function receives a vector of the independent
%   variable: time, the dependent variable, the sampling frequency,
%   the duty cycle and the type of sampling: ideal, natural or 
%   instantaneous.
%   It returns a vector of the sampled function

function xi = Sampling(t, x, fs, duty_cycle, samplingType)
    Ts = 1 / fs;
    size_t = length(t);
    duty_cycle = duty_cycle / 100;
    switch samplingType
%% Ideal
        case 'Ideal'
            diraccomb = zeros(size(t));
            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                diraccomb(i * j) = 1;
            end

            diraccomb = diraccomb(1:size_t); %to assure x and diraccomb are the same size
            xi = x .* diraccomb;
%% Instantaneous
        case 'Instantaneous'
            diraccomb = zeros(size(t));
            
            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                diraccomb(i * j) = 1;
            end
            diraccomb = diraccomb(1:size_t); %to assure x and diraccomb are the same size

            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                stepcomb(i * j : i * j + round(duty_cycle * (Ts * size_t / t(end)))) = 1;
            end

            stepcomb = stepcomb(1:size_t);

            xi = x .* diraccomb; %i.e. ideal sampling
            %Bellow: search for every not zero value in dirac's comb and replace
            %the following duty_cycle * Ts by this value.
            x_aux = zeros(size(t)); %matlab cagon
            for i= 1:length(xi)
                if xi(i) ~= 0
                    x_aux(i: i + round(duty_cycle * (Ts * size_t / t(end)))) = x(i);
                end
            end
            xi = x_aux;
            xi = xi(1:size_t);
            
%% Sample and hold
        case 'Sample and hold'
            diraccomb = zeros(size(t));
            
            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                diraccomb(i * j) = 1;
            end
            diraccomb = diraccomb(1:size_t); %to assure x and diraccomb are the same size

            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                stepcomb(i * j : i * j + round(duty_cycle * (Ts * size_t / t(end)))) = 1;
            end

            stepcomb = stepcomb(1:size_t);

            xi = x .* diraccomb; %i.e. ideal sampling
            %Below: search for every not zero value in dirac's comb and replace
            %the following duty_cycle * Ts by this value.
            x_aux = zeros(size(t)); %matlab cagon
            for i = 1:length(xi)
                if xi(i) ~= 0
                    x_aux(i: i + round(duty_cycle * (Ts * size_t / t(end)))) = x(i);
                end
            end
            xi = x_aux;
            xi = xi(1:size_t);
            for i = 1:length(xi)
                if (xi(i) == 0) && (x(i) ~= 0)
                    xi(i) = x(i);
                end
            end
            
%% Natural
        case 'Natural'
            stepcomb = zeros(size(t));

            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                stepcomb(i * j : i * j + round(duty_cycle * (Ts * size_t / t(end)))) = 1;
            end
            
            stepcomb = stepcomb(1:size_t); %to assure x and diraccomb are the same size

            xi = x .* stepcomb;
            
        case 'Natural v2'
            stepcomb = zeros(size(t));

            j = round(Ts * size_t / t(end));
            for i = 1:ceil(t(end) / Ts)
                if (i * j - round((1 - duty_cycle) * (Ts * size_t / t(end)))) < 0
                    stepcomb(0 : i * j + round((Ts * size_t / t(end))) / 2) = 1;
                else
                    stepcomb(i * j + round((Ts * size_t / t(end)) / 2) - round(duty_cycle * (Ts * size_t / t(end))) : i * j + round((Ts * size_t / t(end)) / 2)) = 1;
                end
            end
            
            stepcomb = stepcomb(1:size_t); %to assure x and diraccomb are the same size
            xi = x .* stepcomb;

    end
end