function varargout = makeSession(varargin)


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
function makeSession_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);
function varargout = makeSession_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function sampleRateEntry_Callback(hObject, eventdata, handles)

sR=str2double(get(handles.sampleRateEntry,'String'));
g=evalin('base','exist(''simpSession'');');
if g
    evalin('base',['simpSession.Rate=' num2str(sR) ';']);
else
end

function sampleRateEntry_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function trialLengthEntry_Callback(hObject, eventdata, handles)

function trialLengthEntry_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function trialCountEntry_Callback(hObject, eventdata, handles)

function trialCountEntry_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function boardEntry_Callback(hObject, eventdata, handles)

function [outString,outputCount]=refreshOuts(hObject,eventdata,handles)
    channelCount=evalin('base','numel(simpSession.Channels)');
    cIt=0;
    outString={};

    for n=1:channelCount
        tS=evalin('base',['simpSession.Channels(1,' num2str(n) ').ID']);
        if strmatch('ao',tS)
            cIt=cIt+1;
            outString{cIt}=tS;
            clear tS
        else
        end
    end
    
    assignin('base','debugS',outString)
    if numel(outString)>0
        set(handles.outputChannelMenu,'String',outString);
    else
        set(handles.outputChannelMenu,'String',{'dA1','dA2'});
    end
    outputCount=numel(outString);

    
function channelEntry_Callback(hObject, eventdata, handles)

    boardToUse=get(handles.boardEntry,'String');
    ogChString=get(handles.channelEntry,'String');
    spltChan=strsplit(ogChString,',');
    
    
    channelCount=evalin('base','numel(simpSession.Channels)');
    tS={};
    for n=1:channelCount
        tS{n}=evalin('base',['simpSession.Channels(1,' num2str(n) ').ID']);
    end
    
    
    for n=1:numel(spltChan)
        disp(tS)
        disp('lkl')
        curSt=spltChan{n};
        strcmp(curSt,tS)
        if numel(find(strcmp(curSt,tS)==1))==0
            if strcmp(curSt(1:2),'ao')
                evalin('base',['simpSession.addAnalogOutputChannel(' '''' boardToUse '''' ',' '''' spltChan{n} '''' ',' '''Voltage'');'])
            elseif strcmp(curSt(1:2),'ai')
                evalin('base',['simpSession.addAnalogInputChannel(' '''' boardToUse '''' ',' '''' spltChan{n} '''' ',' '''Voltage'');'])
            else
                disp('name your channels as ai or ao; no digitals for now')
            end
        else
        end
    end
    refreshOuts(hObject,eventdata,handles)


function channelEntry_CreateFcn(hObject, eventdata, handles)

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


function generateWaveBtn_Callback(hObject, eventdata, handles)
    sRate=str2double(get(handles.sampleRateEntry,'String'));
    
    [~,oCnt]=refreshOuts(hObject,eventdata,handles)
    
    
    
    tTrialTime=str2double(get(handles.trialLengthEntry,'String'));
    tSamps=sRate*(tTrialTime);
    totTrials=str2double(get(handles.trialCountEntry,'String'));
    
    g=evalin('base','exist(''dataTrain'')');
    if g==0
        if oCnt==0
            oCnt=2; %debug
        else
        end
        tDM=zeros(tSamps,oCnt,totTrials);
        assignin('base','dataTrain',tDM);
        clear tDM
    else
    end
    
    
    selChanNum=get(handles.outputChannelMenu,'Value');
    tAmp=str2double(get(handles.pulseAmplitudeEntry,'String'));
    tPWdth=str2double(get(handles.pulseWidthEntry,'String'));
    tNumPls=str2double(get(handles.pulseCountEntry,'String'));
    tFrq=str2double(get(handles.pulseFrequencyEntry,'String'));
    tBlTime=str2double(get(handles.baselineEntry,'String'));
    tBlValue=0;
    
    
    trialsToMap=get(handles.trialSpanEntry,'String');
    assignin('base','debug2',{tAmp,tPWdth,tNumPls,tFrq,tBlTime,tBlValue,...
        1,1,sRate,tTrialTime});
    tWv=pulser_pulses(tAmp,tPWdth,tNumPls,tFrq,tBlTime,tBlValue,...
        1,1,sRate,tTrialTime);
    assignin('base','tWv',tWv);
    evalin('base',['dataTrain(:,' num2str(selChanNum) ',' trialsToMap ')=tWv;'])


function outputChannelMenu_Callback(hObject, eventdata, handles)

    refreshOuts(hObject,eventdata,handles)

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

function boardEntry_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end



function clearSessionBtn_Callback(hObject, eventdata, handles)


function baselineEntry_Callback(hObject, eventdata, handles)


function baselineEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pulseCountEntry_Callback(hObject, eventdata, handles)


function pulseCountEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pulseWidthEntry_Callback(hObject, eventdata, handles)


function pulseWidthEntry_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
