function varargout = makeSession(varargin)
% MAKESESSION MATLAB code for makeSession.fig
%      MAKESESSION, by itself, creates a new MAKESESSION or raises the existing
%      singleton*.
%
%      H = MAKESESSION returns the handle to a new MAKESESSION or the handle to
%      the existing singleton*.
%
%      MAKESESSION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAKESESSION.M with the given input arguments.
%
%      MAKESESSION('Property','Value',...) creates a new MAKESESSION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before makeSession_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to makeSession_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help makeSession

% Last Modified by GUIDE v2.5 10-Oct-2017 13:28:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @makeSession_OpeningFcn, ...
                   'gui_OutputFcn',  @makeSession_OutputFcn, ...
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


% --- Executes just before makeSession is made visible.
function makeSession_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to makeSession (see VARARGIN)

% Choose default command line output for makeSession
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes makeSession wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = makeSession_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sampleRateEntry_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRateEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRateEntry as text
%        str2double(get(hObject,'String')) returns contents of sampleRateEntry as a double
sR=str2double(get(handles.sampleRateEntry,'String'));
g=evalin('base','exist(''simpSession'');');
if g
    evalin('base',['simpSession.Rate=' num2str(sR) ';']);
else
end

% --- Executes during object creation, after setting all properties.
function sampleRateEntry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleRateEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trialLengthEntry_Callback(hObject, eventdata, handles)
% hObject    handle to trialLengthEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trialLengthEntry as text
%        str2double(get(hObject,'String')) returns contents of trialLengthEntry as a double


% --- Executes during object creation, after setting all properties.
function trialLengthEntry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialLengthEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trialCountEntry_Callback(hObject, eventdata, handles)
% hObject    handle to trialCountEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trialCountEntry as text
%        str2double(get(hObject,'String')) returns contents of trialCountEntry as a double


% --- Executes during object creation, after setting all properties.
function trialCountEntry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialCountEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boardEntry_Callback(hObject, eventdata, handles)
% hObject    handle to boardEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boardEntry as text
%        str2double(get(hObject,'String')) returns contents of boardEntry as a double


% --- Executes during object creation, after setting all properties.
function boardEntry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boardEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channelEntry_Callback(hObject, eventdata, handles)
% hObject    handle to channelEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelEntry as text
%        str2double(get(hObject,'String')) returns contents of channelEntry as a double

boardToUse=get(handles.boardEntry,'String');
ogChString=get(handles.channelEntry,'String');
spltChan=strsplit(ogChString,',');

for n=1:numel(spltChan)
    curSt=spltChan{n};
    if strcmp(curSt(1:2),'ao')
        evalin('base',['simpSession.addAnalogOutputChannel(' '''' boardToUse '''' ',' '''' spltChan{n} '''' ',' '''Voltage'');'])
    elseif strcmp(curSt(1:2),'ai')
        evalin('base',['simpSession.addAnalogInputChannel(' '''' boardToUse '''' ',' '''' spltChan{n} '''' ',' '''Voltage'');'])
    else
        disp('name your channels as ai or ao; no digitals for now')
    end
end

set(handles.outputChannelMenu,'String',strsimpSession.Channels.ID)

% --- Executes during object creation, after setting all properties.
function channelEntry_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelEntry (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startSessionBtn.
function startSessionBtn_Callback(hObject, eventdata, handles)

sR=str2double(get(handles.sampleRateEntry,'String'));
sDT=1./sR;

disp('setting up your hardware homez');
evalin('base','simpSession=daq.createSession(''ni'');')
evalin('base',['simpSession.Rate=' num2str(sR) ';']);


function startRunBtn_Callback(hObject, eventdata, handles)


function pulseAmplitudeEntry_Callback(hObject, eventdata, handles)


function pulseAmplitudeEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pulseFrequencyEntry_Callback(hObject, eventdata, handles)


function pulseFrequencyEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function waveformTypeMenu_Callback(hObject, eventdata, handles)


function waveformTypeMenu_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit10_Callback(hObject, eventdata, handles)


function edit10_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit11_Callback(hObject, eventdata, handles)


function edit11_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit12_Callback(hObject, eventdata, handles)


function edit12_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit13_Callback(hObject, eventdata, handles)


function edit13_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit14_Callback(hObject, eventdata, handles)


function edit14_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton3_Callback(hObject, eventdata, handles)


function outputChannelMenu_Callback(hObject, eventdata, handles)


function outputChannelMenu_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton4_Callback(hObject, eventdata, handles)


function trialSpanEntry_Callback(hObject, eventdata, handles)


function trialSpanEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
