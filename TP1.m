function varargout = TP1(varargin)
% TP1 MATLAB code for TP1.fig
%      TP1, by itself, creates a new TP1 or raises the existing
%      singleton*.
%
%      H = TP1 returns the handle to a new TP1 or the handle to
%      the existing singleton*.
%
%      TP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP1.M with the given input arguments.
%
%      TP1('Property','Value',...) creates a new TP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TP1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TP1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TP1

% Last Modified by GUIDE v2.5 16-Apr-2015 14:02:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TP1_OpeningFcn, ...
                   'gui_OutputFcn',  @TP1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TP1 is made visible.
function TP1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TP1 (see VARARGIN)

% Choose default command line output for TP1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TP1 wait for user response (see UIRESUME)
% uiwait(handles.fig_gui);


% --- Outputs from this function are returned to the command line.
function varargout = TP1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function in_fun_Callback(hObject, eventdata, handles)
% hObject    handle to in_fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in_fun as text
%        str2double(get(hObject,'String')) returns contents of in_fun as a double


% --- Executes during object creation, after setting all properties.
function in_fun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in_fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_inman.
function togglebutton_inman_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_inman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_infile.
function togglebutton_infile_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_infile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_inimport.
function pushbutton_inimport_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inimport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_tmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tmin as text
%        str2double(get(hObject,'String')) returns contents of edit_tmin as a double


% --- Executes during object creation, after setting all properties.
function edit_tmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_tmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tmax as text
%        str2double(get(hObject,'String')) returns contents of edit_tmax as a double


% --- Executes during object creation, after setting all properties.
function edit_tmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ft_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ft as text
%        str2double(get(hObject,'String')) returns contents of edit_ft as a double


% --- Executes during object creation, after setting all properties.
function edit_ft_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_AAFnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AAFnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AAFnum as text
%        str2double(get(hObject,'String')) returns contents of edit_AAFnum as a double


% --- Executes during object creation, after setting all properties.
function edit_AAFnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AAFnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_AAFden_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AAFden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AAFden as text
%        str2double(get(hObject,'String')) returns contents of edit_AAFden as a double


% --- Executes during object creation, after setting all properties.
function edit_AAFden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AAFden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_AAF.
function togglebutton_AAF_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_AAF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_AAF


% --- Executes on button press in pushbutton_aafimport.
function pushbutton_aafimport_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_aafimport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_aafman.
function togglebutton_aafman_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_aafman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_aaffile.
function togglebutton_aaffile_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_aaffile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_startsi.
function pushbutton_startsi_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_startsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_gen.
function radiobutton_gen_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_gen


% --- Executes on button press in radiobutton_aaf.
function radiobutton_aaf_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_aaf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_aaf


% --- Executes on button press in radiobutton_pulsesh.
function radiobutton_pulsesh_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_pulsesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_pulsesh


% --- Executes on button press in radiobutton_pulseak.
function radiobutton_pulseak_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_pulseak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_pulseak


% --- Executes on button press in radiobutton_sh.
function radiobutton_sh_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_sh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_sh


% --- Executes on button press in radiobutton_ak.
function radiobutton_ak_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_ak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_ak


% --- Executes on button press in radiobutton_ref.
function radiobutton_ref_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_ref


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_dcSH_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dcSH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dcSH as text
%        str2double(get(hObject,'String')) returns contents of edit_dcSH as a double


% --- Executes during object creation, after setting all properties.
function edit_dcSH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dcSH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dcAK_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dcAK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dcAK as text
%        str2double(get(hObject,'String')) returns contents of edit_dcAK as a double


% --- Executes during object creation, after setting all properties.
function edit_dcAK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dcAK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fs_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fs as text
%        str2double(get(hObject,'String')) returns contents of edit_fs as a double


% --- Executes during object creation, after setting all properties.
function edit_fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_SandH.
function togglebutton_SandH_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_SandH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_SandH


% --- Executes on button press in togglebutton_AnaK.
function togglebutton_AnaK_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_AnaK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_AnaK



function edit_Renum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Renum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Renum as text
%        str2double(get(hObject,'String')) returns contents of edit_Renum as a double


% --- Executes during object creation, after setting all properties.
function edit_Renum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Renum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Reden_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Reden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Reden as text
%        str2double(get(hObject,'String')) returns contents of edit_Reden as a double


% --- Executes during object creation, after setting all properties.
function edit_Reden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Reden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_Re.
function togglebutton_Re_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_Re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_Re


% --- Executes on button press in pushbutton_reimport.
function pushbutton_reimport_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reimport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_reman.
function togglebutton_reman_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_reman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_refile.
function togglebutton_refile_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_refile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on togglebutton_AnaK and none of its controls.
function togglebutton_AnaK_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton_AnaK (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_fft.
function radiobutton_fft_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_fft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_fft


% --- Executes on button press in togglebutton_noise.
function togglebutton_noise_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_noise_Callback(hObject, eventdata, handles)
% hObject    handle to edit_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_noise as text
%        str2double(get(hObject,'String')) returns contents of edit_noise as a double


% --- Executes during object creation, after setting all properties.
function edit_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editx1_Callback(hObject, eventdata, handles)
% hObject    handle to editx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editx1 as text
%        str2double(get(hObject,'String')) returns contents of editx1 as a double


% --- Executes during object creation, after setting all properties.
function editx1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editx2_Callback(hObject, eventdata, handles)
% hObject    handle to editx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editx2 as text
%        str2double(get(hObject,'String')) returns contents of editx2 as a double


% --- Executes during object creation, after setting all properties.
function editx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edity1_Callback(hObject, eventdata, handles)
% hObject    handle to edity1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edity1 as text
%        str2double(get(hObject,'String')) returns contents of edity1 as a double


% --- Executes during object creation, after setting all properties.
function edity1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edity1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edity2_Callback(hObject, eventdata, handles)
% hObject    handle to edity2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edity2 as text
%        str2double(get(hObject,'String')) returns contents of edity2 as a double


% --- Executes during object creation, after setting all properties.
function edity2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edity2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_zoom.
function pushbutton_zoom_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton_zoom.
function togglebutton_zoom_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_zoom


% --- Executes on button press in togglebutton_pan.
function togglebutton_pan_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_pan


% --- Executes on button press in togglebutton_grid.
function togglebutton_grid_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_grid


% --- Executes on button press in togglebutton_mouse.
function togglebutton_mouse_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_mouse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_mouse



function edit_Q_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Q as text
%        str2double(get(hObject,'String')) returns contents of edit_Q as a double


% --- Executes during object creation, after setting all properties.
function edit_Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_w0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_w0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_w0 as text
%        str2double(get(hObject,'String')) returns contents of edit_w0 as a double


% --- Executes during object creation, after setting all properties.
function edit_w0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_w0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_A0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A0 as text
%        str2double(get(hObject,'String')) returns contents of edit_A0 as a double


% --- Executes during object creation, after setting all properties.
function edit_A0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_RLC.
function radiobutton_RLC_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_RLC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_RLC


% --- Executes on button press in togglebutton_RLC.
function togglebutton_RLC_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_RLC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_RLC


% --- Executes on button press in radiobutton_semilog.
function radiobutton_semilog_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_semilog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_semilog



function edit_periodic_Callback(hObject, eventdata, handles)
% hObject    handle to edit_periodic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_periodic as text
%        str2double(get(hObject,'String')) returns contents of edit_periodic as a double


% --- Executes during object creation, after setting all properties.
function edit_periodic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_periodic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_marker.
function togglebutton_marker_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_marker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_marker


% --- Executes on button press in pushbutton_export.
function pushbutton_export_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_per_Callback(hObject, eventdata, handles)
% hObject    handle to edit_per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_per as text
%        str2double(get(hObject,'String')) returns contents of edit_per as a double


% --- Executes during object creation, after setting all properties.
function edit_per_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_totalpower_Callback(hObject, eventdata, handles)
% hObject    handle to edit_totalpower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_totalpower as text
%        str2double(get(hObject,'String')) returns contents of edit_totalpower as a double


% --- Executes during object creation, after setting all properties.
function edit_totalpower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_totalpower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_thd_Callback(hObject, eventdata, handles)
% hObject    handle to edit_thd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_thd as text
%        str2double(get(hObject,'String')) returns contents of edit_thd as a double


% --- Executes during object creation, after setting all properties.
function edit_thd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_thd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_window.
function popupmenu_window_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_window contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_window


% --- Executes during object creation, after setting all properties.
function popupmenu_window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
