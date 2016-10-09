classdef TP1GUI < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        handles;
        x; % Input Signal
        y; % Output Signal
        t; % Vector con [tmin, tmax]
        tmin;
        tmax;
        ft; % samples per second
        fs; % Sampling frequency
        SandH; % SandH = 1 if passthrough off
        AnaK; % AnaK = 1 if passthrough off
        PulseDCSH; % Duty del Sample and Hold
        PulseDCAK; % Duty del Analog Key
        InputM; % Modo de input Manual=1 File=0
        AF; % AF = 1 if passthrough off
        AFM; %Modo de AF Manual=1 File = 0
        AFnum; % Num del AF
        AFden; % Den del AF
        RE; % RE = 1 if passthrough off
        REnum; % Num del Recovery
        REden; % Den del Recovery
        Mode; % Mode = 1 Spectrum, Mode = 0 Time
        
        tocs; % Just for fun
        pollos;
        walter;
        
        Aaf_file = struct('freq', [], 'mag', [], 'phase', []);
        Re_file = struct('freq', [], 'mag', [], 'phase', []);
        
        toolbar = struct('zoom', [], 'pan', [], 'cursor', [], 'marker', []);
        
        bb_sounds = struct('intro', [], 'science', [], 'knocks', [], 'better', [], 'tap', [], 'chicken', [], 'saymyname', [], 'youreright', []);
      end
    
    methods 
        function self = TP1GUI(self)
            hfig=hgload('TP1.fig');
            self.handles = guihandles(hfig);
            movegui(hfig,'center');
            
            % Fancy buttons b*tch
            self.toolbar.zoom = zoom(hfig);
            self.toolbar.pan = pan(hfig);
            self.toolbar.marker = datacursormode(hfig);
            
            set(self.handles.togglebutton_inman,'callback', @self.togglebutton_inman_callback); %Input Manual
            set(self.handles.togglebutton_infile,'callback', @self.togglebutton_infile_callback); %Input File
            set(self.handles.in_fun,'callback', @self.in_fun_callback); %Edit Input
            set(self.handles.edit_tmin,'callback', @self.edit_tmin_callback); %Edit tmin
            set(self.handles.edit_tmax,'callback', @self.edit_tmax_callback); %Edit tmax
            set(self.handles.edit_ft,'callback', @self.edit_ft_callback); %Edit ft
            set(self.handles.togglebutton_aafman,'callback', @self.togglebutton_aafman_callback); %AF Manual
            set(self.handles.togglebutton_aaffile,'callback', @self.togglebutton_aaffile_callback); %AF File
            set(self.handles.edit_AAFnum,'callback', @self.edit_AAFnum_callback); %Edit AF Num
            set(self.handles.edit_AAFden,'callback', @self.edit_AAFden_callback); %Edit AF Den
            set(self.handles.togglebutton_AAF,'callback', @self.togglebutton_AAF_callback); %AF Passhthrought
            set(self.handles.pushbutton_startsi,'callback', @self.pushbutton_startsi_callback); %Start Sim
            set(self.handles.edit_fs,'callback', @self.edit_fs_callback); %Edit Pulse F
            set(self.handles.edit_dcSH,'callback', @self.edit_dcSH_callback); %Edit Pulse DC SH
            set(self.handles.edit_dcAK,'callback', @self.edit_dcAK_callback); %Edit Pulse DC AK
            set(self.handles.togglebutton_SandH,'callback', @self.togglebutton_SandH_callback); %SH Passhthrought
            set(self.handles.togglebutton_AnaK,'callback', @self.togglebutton_AnaK_callback); %AK Passhthrought
            set(self.handles.togglebutton_reman,'callback', @self.togglebutton_reman_callback); %Recovery Manual
            set(self.handles.togglebutton_refile,'callback', @self.togglebutton_refile_callback); %Recovery File
            set(self.handles.edit_Renum,'callback', @self.edit_Renum_callback); %Edit Recovery Num
            set(self.handles.edit_Reden,'callback', @self.edit_Reden_callback); %Edit Recovery Den
            set(self.handles.togglebutton_Re,'callback', @self.togglebutton_Re_callback); %Recovery Passhthrought
            set(self.handles.radiobutton_gen, 'callback', @self.plot_signal); %Plot the madness
            set(self.handles.radiobutton_aaf, 'callback', @self.plot_signal);
            set(self.handles.radiobutton_sh, 'callback', @self.plot_signal);
            set(self.handles.radiobutton_ak, 'callback', @self.plot_signal);
            set(self.handles.radiobutton_ref, 'callback', @self.plot_signal);
            set(self.handles.radiobutton_fft, 'callback', @self.plot_signal);
            set(self.handles.radiobutton_semilog, 'callback', @self.plot_signal);
            set(self.handles.pushbutton_export, 'callback', @self.export);

            set(self.handles.edit_per, 'callback', @self.edit_per_callback);
            
            % Fancy buttons
            
            set(self.handles.togglebutton_zoom, 'callback', @self.togglebutton_zoom_callback);
            set(self.handles.togglebutton_pan, 'callback', @self.togglebutton_pan_callback);
            set(self.handles.togglebutton_grid, 'callback', @self.togglebutton_grid_callback);
            set(self.handles.togglebutton_mouse, 'callback', @self.togglebutton_mouse_callback);
            set(self.handles.togglebutton_marker, 'callback', @self.togglebutton_marker_callback);

            %callbacks de los limites del grafico
            set(self.handles.editx1, 'callback', @self.xlimites);
            set(self.handles.editx2, 'callback', @self.xlimites);
            set(self.handles.edity1, 'callback', @self.ylimites);
            set(self.handles.edity2, 'callback', @self.ylimites);
            
            set(self.handles.in_fun, 'String', '5*sin(2*pi*1e2*t)');
            self.tocs = 0;
            
            self.x = get(self.handles.in_fun, 'String');
            self.tmin = str2double(get(self.handles.edit_tmin,'String'));
            self.tmax = str2double(get(self.handles.edit_tmax,'String'));
            self.ft = str2double(get(self.handles.edit_ft,'String')); % samples per second
            self.SandH = ~get(self.handles.togglebutton_SandH, 'Value'); % SandH = 1 if passthrough off
            self.AnaK = ~get(self.handles.togglebutton_AnaK, 'Value'); % AnaK = 1 if passthrough off
            self.PulseDCSH = str2double(get(self.handles.edit_dcSH,'String'));
            self.PulseDCAK = str2double(get(self.handles.edit_dcAK,'String'));
            self.fs = str2double(get(self.handles.edit_fs,'String'));
            self.AF = ~get(self.handles.togglebutton_AAF, 'Value');
            self.AFnum = str2num(get(self.handles.edit_AAFnum,'String'));
            self.AFden = str2num(get(self.handles.edit_AAFden,'String'));
            self.RE = ~get(self.handles.togglebutton_Re, 'Value');
            self.REnum = str2num(get(self.handles.edit_Renum,'String'));
            self.REden= str2num(get(self.handles.edit_Reden,'String'));
            self.Mode = get(self.handles.radiobutton_fft, 'Value');
            
            %The ultimate and definite guide to breaking bad's sounds
            [self.bb_sounds.intro.file, self.bb_sounds.intro.fs] = wavread('intro');
            [self.bb_sounds.science.file, self.bb_sounds.science.fs] = wavread('science');
            [self.bb_sounds.knocks.file, self.bb_sounds.knocks.fs] = wavread('knocks');
            [self.bb_sounds.better.file, self.bb_sounds.better.fs] = wavread('better');
            [self.bb_sounds.tap.file, self.bb_sounds.tap.fs] = wavread('tap');
            [self.bb_sounds.chicken.file, self.bb_sounds.chicken.fs] = wavread('chicken');
            [self.bb_sounds.saymyname.file, self.bb_sounds.saymyname.fs] = wavread('saymyname');
            [self.bb_sounds.youreright.file, self.bb_sounds.youreright.fs] = wavread('youreright');
            
            sound(self.bb_sounds.intro.file, self.bb_sounds.intro.fs);
            
            % Art pr0n
            self.pollos = imread('lospolloshermanos.png');
            self.walter = imread('walter.png');
            
            sampling_bad_image = imread('sampling_bad.png');
            axes(self.handles.axes2);
            image4button = image(sampling_bad_image,'Parent',self.handles.axes2);
            clean_axes(self.handles.axes2)
            color = get(self.handles.fig_gui,'Color');
            set(self.handles.axes2,'XColor',color,'YColor',color,'TickDir','out')
            set(self.handles.axes2,'Visible','off')
            set(image4button, 'ButtonDownFcn', @self.lospollos);
            
            title_image = imread('title.png');
            axes(self.handles.axes1);
            image(title_image,'Parent',self.handles.axes1);
            clean_axes(self.handles.axes1);
            
           self.init_bodes(); 
        end
        
        %% Start Simulation
        function pushbutton_startsi_callback(self, varargin)
            sound(self.bb_sounds.science.file, self.bb_sounds.science.fs);
            if (get(self.handles.togglebutton_inman, 'Value') == 1)
                self.t = (self.tmin:1/self.ft:(self.tmax));
                t = self.t;
                self.y.gen = eval(self.x);
            else
                t = self.t;
                self.tmin = t(1);
                self.tmax = t(end);
                self.ft = 1 / (t(2) - t(1));
                self.y.gen = self.x;
            end
            y_active = self.y.gen; %y_active saves the last changes of the signal to be used in the next stage
            
            %Abajo se mermea un cacho la señal para que sea mas posta
            if get(self.handles.togglebutton_noise, 'Value')
                noiseAmplitude = .01 * str2double(get(self.handles.edit_noise,'String')) * max(abs(y_active)); % Amplitud ruido: 1% del maximo de la señal
                y_active = y_active + noiseAmplitude * randn(size(y_active));
                self.y.gen = y_active;
            end
            if (self.AF == 1)
                if ~get(self.handles.togglebutton_aaffile, 'Value');
                    y_active = aFilterResponse(t, self.ft, y_active, self.AFnum, self.AFden);
                else
                    y_active = aFilterResponseFile(t, self.ft, y_active, self.Aaf_file.freq, self.Aaf_file.mag, self.Aaf_file.phase);
                end
            end
            self.y.aaf = y_active;
            if (self.SandH == 1)
                y_active = Sampling(t, y_active, self.fs, self.PulseDCSH, 'Sample and hold');
            end
            self.y.sh = y_active;
            if get(self.handles.togglebutton_RLC, 'Value')
                A0 = str2double(get(self.handles.edit_A0, 'String'));
                w0 = str2double(get(self.handles.edit_w0, 'String'));
                Q = str2double(get(self.handles.edit_Q, 'String'));
                y_active = aFilterResponse(t, self.ft, y_active, A0 * w0^2, [1 w0/Q w0^2]);
            end
            noiseAmplitude = 0.8 * .01 * str2double(get(self.handles.edit_noise,'String')) * max(abs(y_active)); % Amplitud ruido: 1% del maximo de la señal
            y_active = y_active + noiseAmplitude * randn(size(y_active));
            self.y.sh = y_active;
            
            
            if (self.AnaK == 1)
                y_active = Sampling(t, y_active, self.fs, self.PulseDCAK, 'Natural'); %You can also try 'Natural v2'
            end
            self.y.ak = y_active;
            noiseAmplitude = .8 * .01 * str2double(get(self.handles.edit_noise,'String')) * max(abs(y_active)); % Amplitud ruido: 1% del maximo de la señal
            y_active = y_active + noiseAmplitude * randn(size(y_active));
            self.y.ak = y_active;
            
            if (self.RE == 1)
                if ~get(self.handles.togglebutton_refile, 'Value');
                    y_active = aFilterResponse(t, self.ft, y_active, self.REnum, self.REden);
                else
                    y_active = aFilterResponseFile(t, self.ft, y_active, self.Re_file.freq, self.Re_file.mag, self.Re_file.phase);
                end
            end
            self.y.ref = y_active;
            
            %
            
            freqV = linspace(0, self.ft / 2, round(length(t) / 2));
            fullSpectrum = abs(fftshift(fft(y_active))) / length(y_active);
            fullSpectrum = fullSpectrum((round(length(fullSpectrum) / 2) : end));
            [c index] = min(abs(freqV-eval(get(self.handles.edit_per, 'String'))));
            if (5 * index <= length(fullSpectrum))
                THD = (fullSpectrum(2 * index) + fullSpectrum(3 * index) + fullSpectrum(4 * index) + fullSpectrum(5 * index)) / (fullSpectrum(index) + fullSpectrum(2 * index) + fullSpectrum(3 * index) + fullSpectrum(4 * index) + fullSpectrum(5 * index));
                set(self.handles.edit_thd, 'String', THD);
            elseif (3 * index <= length(fullSpectrum))
                THD = (fullSpectrum(2 * index) + fullSpectrum(3 * index)) / (fullSpectrum(index) + fullSpectrum(2 * index) + fullSpectrum(3 * index));
                set(self.handles.edit_thd, 'String', THD);
            end
            set(self.handles.edit_totalpower, 'String', bandpower(y_active));
            
            self.plot_signal();
        end
        
        function plot_signal(self, varargin)
            if isfield(self.y, 'aaf')
                t = self.t;
                if get(self.handles.radiobutton_fft, 'Value') == 0;
                    if get(self.handles.radiobutton_gen, 'Value')
                        plot(self.t, self.y.gen, 'Color', get(self.handles.radiobutton_gen, 'BackgroundColor'), 'LineWidth', 1.4)
                        hold on
                    end
                    if get(self.handles.radiobutton_aaf, 'Value')
                        plot(self.t, self.y.aaf, 'Color', get(self.handles.radiobutton_aaf, 'BackgroundColor'), 'LineWidth', 1.4)
                        hold on
                    end
                    if get(self.handles.radiobutton_sh, 'Value')
                        plot(self.t, self.y.sh, 'Color', get(self.handles.radiobutton_sh, 'BackgroundColor'), 'LineWidth', 1.4)
                        hold on
                    end
                    if get(self.handles.radiobutton_ak, 'Value')
                        plot(self.t, self.y.ak, 'Color', get(self.handles.radiobutton_ak, 'BackgroundColor'), 'LineWidth', 1.4)
                        hold on
                    end
                    if get(self.handles.radiobutton_ref, 'Value')
                        plot(self.t, self.y.ref, 'Color', get(self.handles.radiobutton_ref, 'BackgroundColor'), 'LineWidth', 1.4)
                        hold on
                    end
                    xlabel('Time [sec]');
                    ylabel('Magnitude');
                    title('Signal vs Time');
                else
                    if (~get(self.handles.radiobutton_semilog, 'Value')) && 1
                        freqV = linspace(-self.ft / 2, self.ft / 2, 2^nextpow2(length(t)-1));
                    else
                        freqV = linspace(0, self.ft / 2, round(length(t) / 2));
                    end
                    window_ = get(self.handles.popupmenu_window, 'String');
                    window_ = window_(get(self.handles.popupmenu_window, 'Value'));
                    window_ = cell2str(window_);
                    window_ = window_(3:end-3);
                        
                    if get(self.handles.radiobutton_gen, 'Value')
                        fullSpectrum = abs(fftshift(fft(self.y.gen(1:end-1).*window(eval(window_),length(self.y.sh)-1)', 2^nextpow2(length(self.y.gen)-1))))/length(freqV);
                        if ~get(self.handles.radiobutton_semilog, 'Value')
                            plot(freqV, 20*log10(fullSpectrum), 'Color', get(self.handles.radiobutton_gen, 'BackgroundColor'), 'LineWidth', 1.4)
                        else
                            semilogx(freqV, 20*log10(fullSpectrum((round(length(fullSpectrum) / 2) : end))), 'Color', get(self.handles.radiobutton_gen, 'BackgroundColor'), 'LineWidth', 1.4)
                        end
                        hold on
                    end
                    if get(self.handles.radiobutton_aaf, 'Value')
                        fullSpectrum = abs(fftshift(fft(self.y.aaf(1:end-1).*window(eval(window_),length(self.y.sh)-1)', 2^nextpow2(length(self.y.aaf)-1))))/length(freqV);
                        if ~get(self.handles.radiobutton_semilog, 'Value');
                            plot(freqV, 20*log10(fullSpectrum), 'Color', get(self.handles.radiobutton_aaf, 'BackgroundColor'), 'LineWidth', 1.4)
                        else
                            semilogx(freqV, 20*log10(fullSpectrum((round(length(fullSpectrum) / 2) : end))), 'Color', get(self.handles.radiobutton_aaf, 'BackgroundColor'), 'LineWidth', 1.4)
                        end
                        hold on
                    end
                    if get(self.handles.radiobutton_sh, 'Value')
                        fullSpectrum = abs(fftshift(fft(self.y.sh(1:end-1).*window(eval(window_),length(self.y.sh)-1)',2^nextpow2(length(self.y.sh)-1))))/length(freqV);                        
                        if ~get(self.handles.radiobutton_semilog, 'Value');
                            plot(freqV, 20*log10(fullSpectrum), 'Color', get(self.handles.radiobutton_sh, 'BackgroundColor'), 'LineWidth', 1.4)
                        else
                            semilogx(freqV, 20*log10(fullSpectrum((round(length(fullSpectrum) / 2) : end))), 'Color', get(self.handles.radiobutton_sh, 'BackgroundColor'), 'LineWidth', 1.4)
                        end
                        hold on
                    end
                    if get(self.handles.radiobutton_ak, 'Value')
                        fullSpectrum = abs(fftshift(fft(self.y.ak(1:end-1).*window(eval(window_),length(self.y.sh)-1)',2^nextpow2(length(self.y.ak)-1))))/length(freqV);
                        if ~get(self.handles.radiobutton_semilog, 'Value');
                            plot(freqV, 20*log10(fullSpectrum), 'Color', get(self.handles.radiobutton_ak, 'BackgroundColor'), 'LineWidth', 1.4)
                        else
                            semilogx(freqV, 20*log10(fullSpectrum((round(length(fullSpectrum) / 2) : end))), 'Color', get(self.handles.radiobutton_ak, 'BackgroundColor'), 'LineWidth', 1.4)
                        end
                        hold on
                    end
                    if get(self.handles.radiobutton_ref, 'Value')
                        fullSpectrum = abs(fftshift(fft(self.y.ref(1:end-1).*window(eval(window_),length(self.y.sh)-1)',2^nextpow2(length(self.y.ref)-1))))/length(freqV);
                        if ~get(self.handles.radiobutton_semilog, 'Value');
                            plot(freqV, 20*log10(fullSpectrum), 'Color', get(self.handles.radiobutton_ref, 'BackgroundColor'), 'LineWidth', 1.4)
                        else
                            semilogx(freqV, 20*log10(fullSpectrum((round(length(fullSpectrum) / 2) : end))), 'Color', get(self.handles.radiobutton_ref, 'BackgroundColor'), 'LineWidth', 1.4)
                        end
                        hold on
                    end
                    xlabel('Frequency [Hz])');
                    ylabel('Magnitude');
                    if ~get(self.handles.radiobutton_semilog, 'Value');
                        xlim([0,self.fs * 2])
                    else
                        xlim('auto');
                    end
                    title('Fourier Transform of the Signal');
                    
                    
                end
                hold off
            end
            xl=xlim;
            yl=ylim;
            set(self.handles.editx1,'String',num2str(xl(1)))
            set(self.handles.editx2,'String',num2str(xl(2)))
            set(self.handles.edity1,'String',num2str(yl(1)))
            set(self.handles.edity2,'String',num2str(yl(2)))
        end
        
        %% Signal
        function in_fun_callback(self,varargin)
            self.x = get(self.handles.in_fun,'String');
        end
        
         function edit_tmin_callback(self,varargin)
             self.tmin = str2double(get(self.handles.edit_tmin,'String'));
         end
         
        function edit_tmax_callback(self,varargin)
            self.tmax = str2double(get(self.handles.edit_tmax,'String'));
        end
        
         function edit_ft_callback(self,varargin)
            self.ft = str2double(get(self.handles.edit_ft,'String'));
         end
         
         
         %% AF       
        function togglebutton_AAF_callback(self, varargin)
            self.AF = ~get(self.handles.togglebutton_AAF, 'Value');
        end
        
         function edit_AAFnum_callback(self,varargin)
            self.AFnum = str2num(get(self.handles.edit_AAFnum,'String'));
         end
               
        function edit_AAFden_callback(self,varargin)
            self.AFden= str2num(get(self.handles.edit_AAFden,'String')); 
        end
        
        %% Pulse generator
        
        function edit_fs_callback(self,varargin)
            self.fs = str2double(get(self.handles.edit_fs,'String'));
        end
        
        %% SandH
        function togglebutton_SandH_callback(self, varargin)
            sound(self.bb_sounds.saymyname.file, self.bb_sounds.saymyname.fs);
            self.SandH = ~get(self.handles.togglebutton_SandH, 'Value');
        end
        
        function edit_dcSH_callback(self,varargin)
            self.PulseDCSH = str2double(get(self.handles.edit_dcSH,'String'));
        end
        
        %% AnaK
        function togglebutton_AnaK_callback(self, varargin)
            sound(self.bb_sounds.youreright.file, self.bb_sounds.youreright.fs);
            self.AnaK = ~get(self.handles.togglebutton_AnaK, 'Value');
        end
       
        function edit_dcAK_callback(self,varargin)
            self.PulseDCAK = str2double(get(self.handles.edit_dcAK,'String'));
        end
        
        %% Recovery
        function togglebutton_Re_callback(self, varargin)
            self.RE = ~get(self.handles.togglebutton_Re, 'Value');
        end
        
        function edit_Renum_callback(self,varargin)
            self.REnum = str2num(get(self.handles.edit_Renum,'String'));
        end
        
        function edit_Reden_callback(self,varargin)
            self.REden= str2num(get(self.handles.edit_Reden,'String'));
        end
        %% Funciones del gráfico
        function xlimites(self,varargin)
            xlim([str2double(get(self.handles.editx1,'String')),str2double(get(self.handles.editx2,'String'))])
        end
        
        function ylimites(self,varargin)
            ylim([str2double(get(self.handles.edity1,'String')),str2double(get(self.handles.edity2,'String'))])
        end
        
        %% Choose your own file or adventure functions
        
        function togglebutton_infile_callback(self, varargin)
            csv_file = uigetfile;
            if ~isscalar(csv_file)
                values = dlmread(csv_file);
                self.t = values(:,1)';
                self.x = values(:,2)';
                set(self.handles.togglebutton_infile, 'Value', 1);
                set(self.handles.togglebutton_inman, 'Value', 0);
            else
                set(self.handles.togglebutton_infile, 'Value', 0);
                set(self.handles.togglebutton_inman, 'Value', 1);
            end
        end
        
        function togglebutton_inman_callback(self, varargin)
            set(self.handles.togglebutton_infile, 'Value', 0);
            set(self.handles.togglebutton_inman, 'Value', 1);
        end
        
        function togglebutton_aaffile_callback(self, varargin)
            csv_file = uigetfile;
            if ~isscalar(csv_file)
                values = dlmread(csv_file);
                self.Aaf_file.freq = values(:,1)';
                self.Aaf_file.mag = values(:,2)';
                self.Aaf_file.phase = values(:,3)';
                set(self.handles.togglebutton_aaffile, 'Value', 1);
                set(self.handles.togglebutton_aafman, 'Value', 0);
            else
                set(self.handles.togglebutton_aaffile, 'Value', 0);
                set(self.handles.togglebutton_aafman, 'Value', 1);
            end
        end
        
        function togglebutton_aafman_callback(self, varargin)
            set(self.handles.togglebutton_aaffile, 'Value', 0);
            set(self.handles.togglebutton_aafman, 'Value', 1);
        end
        
        function togglebutton_refile_callback(self, varargin)
            csv_file = uigetfile;
            if ~isscalar(csv_file)
                values = dlmread(csv_file);
                self.Re_file.freq = values(:,1)';
                self.Re_file.mag = values(:,2)';
                self.Re_file.phase = values(:,3)';
                set(self.handles.togglebutton_refile, 'Value', 1);
                set(self.handles.togglebutton_reman, 'Value', 0);
            else
                set(self.handles.togglebutton_refile, 'Value', 0);
                set(self.handles.togglebutton_reman, 'Value', 1);
            end
        end
        
        function togglebutton_reman_callback(self, varargin)
            set(self.handles.togglebutton_refile, 'Value', 0);
            set(self.handles.togglebutton_reman, 'Value', 1);
        end
        
        %% Export
        
        function export(self, varargin)
            figure();
            x1 = str2double(get(self.handles.editx1,'String'));
            x2 = str2double(get(self.handles.editx2,'String'));
            y1 = str2double(get(self.handles.edity1,'String'));
            y2 = str2double(get(self.handles.edity2,'String'));
            self.plot_signal();
            xlim([x1 x2]);
            ylim([y1 y2]);
            fig=gcf;
            set(findall(fig,'-property','FontSize'),'FontSize',12)
            axes(self.handles.axes1);
            set(self.handles.editx1,'String',num2str(x1))
            set(self.handles.editx2,'String',num2str(x2))
            set(self.handles.edity1,'String',num2str(y1))
            set(self.handles.edity2,'String',num2str(y2))
        end
        
        function edit_per_callback(self,varargin)
            f=eval(get(self.handles.edit_per,'String'));
            set(self.handles.edit_tmax,'String',num2str(16*1/f));
            self.tmax=16*1/f;
            set(self.handles.edit_ft,'String',num2str(f*(2^nextpow2(1e3*20))));
            self.ft=f*(2^nextpow2(1e3*20));
        end
        
        %% Fancy buttons callbacks
        
        function togglebutton_zoom_callback(self, varargin)
            sound(self.bb_sounds.better.file, self.bb_sounds.better.fs);
            set(self.toolbar.pan, 'Enable', 'off');
            set(self.handles.togglebutton_pan, 'Value', 0);
            set(self.toolbar.zoom, 'Enable', 'on');
            set(self.handles.togglebutton_zoom, 'Value', 1);
            setAllowAxesZoom(self.toolbar.zoom,self.handles.axes1,1);
            set(self.handles.togglebutton_mouse, 'Value', 0);
            set(self.toolbar.marker,'Enable','off');
            set(self.handles.togglebutton_marker, 'Value', 0);
        end
        
        function togglebutton_mouse_callback(self, varargin)
            set(self.handles.togglebutton_mouse, 'Value', 1);
            set(self.toolbar.pan, 'Enable', 'off');
            set(self.handles.togglebutton_pan, 'Value', 0);
            set(self.toolbar.zoom, 'Enable', 'off');
            set(self.handles.togglebutton_zoom, 'Value', 0);
            set(self.toolbar.marker,'Enable','off');
            set(self.handles.togglebutton_marker, 'Value', 0);
        end
        
        function togglebutton_marker_callback(self, varargin)
            set(self.toolbar.pan, 'Enable', 'off');
            set(self.handles.togglebutton_pan, 'Value', 0);
            set(self.toolbar.zoom, 'Enable', 'off');
            set(self.handles.togglebutton_zoom, 'Value', 0);
            set(self.handles.togglebutton_mouse, 'Value', 0);
            set(self.toolbar.marker,'Enable','on');
            set(self.handles.togglebutton_marker, 'Value', 1);
        end
        
        function togglebutton_grid_callback(self, varargin)
            if get(self.handles.togglebutton_grid, 'Value')
                grid on
            else
                grid off
            end
        end
        
        function togglebutton_pan_callback(self, varargin)
            set(self.toolbar.zoom, 'Enable', 'off');
            set(self.handles.togglebutton_zoom, 'Value', 0);
            set(self.toolbar.pan, 'Enable', 'on');
            set(self.handles.togglebutton_pan, 'Value', 1);
            setAllowAxesPan(self.toolbar.pan,self.handles.axes1,1);
            set(self.handles.togglebutton_mouse, 'Value', 0);
            set(self.toolbar.marker,'Enable','off');
            set(self.handles.togglebutton_marker, 'Value', 0);
        end
        
        function lospollos(self, varargin)
            self.tocs = self.tocs + 1;
            if self.tocs < 6
                sound(self.bb_sounds.tap.file, self.bb_sounds.tap.fs);
            elseif self.tocs == 6
                sound(self.bb_sounds.knocks.file, self.bb_sounds.knocks.fs);
                axes(self.handles.axes2);
                image4button = image(self.walter,'Parent',self.handles.axes2);
                clean_axes(self.handles.axes2);
                color = get(self.handles.fig_gui,'Color');
                set(self.handles.axes2,'XColor',color,'YColor',color,'TickDir','out')
                set(self.handles.axes2,'Visible','off')
                set(image4button, 'ButtonDownFcn', @self.lospollos);
            elseif self.tocs < 10
                sound(self.bb_sounds.tap.file, self.bb_sounds.tap.fs);
            elseif self.tocs == 10
                sound(self.bb_sounds.chicken.file, self.bb_sounds.chicken.fs);
                axes(self.handles.axes2);
                image4button = image(self.pollos,'Parent',self.handles.axes2);
                clean_axes(self.handles.axes2);
                color = get(self.handles.fig_gui,'Color');
                set(self.handles.axes2,'XColor',color,'YColor',color,'TickDir','out')
                set(self.handles.axes2,'Visible','off')
                set(image4button, 'ButtonDownFcn', @self.lospollos);
            else
                sound(self.bb_sounds.chicken.file, self.bb_sounds.chicken.fs);
            end
            axes(self.handles.axes1);
        end
        
        function init_bodes(self, varargin)
                values = dlmread('Faa.csv');
                self.Aaf_file.freq = values(:,1)';
                self.Aaf_file.mag = values(:,2)';
                self.Aaf_file.phase = values(:,3)';
                set(self.handles.togglebutton_aaffile, 'Value', 1);
                set(self.handles.togglebutton_aafman, 'Value', 0);

                values = dlmread('FR.csv');
                self.Re_file.freq = values(:,1)';
                self.Re_file.mag = values(:,2)';
                self.Re_file.phase = values(:,3)';
                set(self.handles.togglebutton_refile, 'Value', 1);
                set(self.handles.togglebutton_reman, 'Value', 0);
        end
    end
    

end

