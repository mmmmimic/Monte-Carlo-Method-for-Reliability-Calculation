function varargout = Montcarlo(varargin)
% MONTCARLO MATLAB code for Montcarlo.fig
%      MONTCARLO, by itself, creates a new MONTCARLO or raises the existing
%      singleton*.
%
%      H = MONTCARLO returns the handle to a new MONTCARLO or the handle to
%      the existing singleton*.
%
%      MONTCARLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONTCARLO.M with the given input arguments.
%
%      MONTCARLO('Property','Value',...) creates a new MONTCARLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Montcarlo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Montcarlo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Montcarlo

% Last Modified by GUIDE v2.5 03-Nov-2017 19:12:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Montcarlo_OpeningFcn, ...
    'gui_OutputFcn',  @Montcarlo_OutputFcn, ...
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


% --- Executes just before Montcarlo is made visible.
function Montcarlo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Montcarlo (see VARARGIN)

% Choose default command line output for Montcarlo
handles.output = hObject;
set(handles.yl1,'String','0')
set(handles.yl2,'String','1')
set(handles.yl3,'String','0')
set(handles.yl4,'String','0')
set(handles.yl5,'String','0')
set(handles.qd1,'String','0')
set(handles.qd2,'String','1')
set(handles.qd3,'String','0')
set(handles.qd4,'String','0')
set(handles.qd5,'String','0')
set(handles.mncs,'String','5000')
handles.yl01=0
handles.yl02=1
handles.yl03=0
handles.yl04=0
handles.yl05=0
handles.qd01=0
handles.qd02=1
handles.qd03=0
handles.qd04=0
handles.qd05=0
handles.ylv=1
handles.qdv=1
handles.n=5000
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Montcarlo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Montcarlo_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function kkd_Callback(hObject, eventdata, handles)
% hObject    handle to kkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kkd as text
%        str2double(get(hObject,'String')) returns contents of kkd as a double


% --- Executes during object creation, after setting all properties.
function kkd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kkd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mn.
function mn_Callback(hObject, eventdata, handles)
% hObject    handle to mn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ÃÉÌØ¿¨ÂåÄ£Äâ
switch handles.ylv
    case 1
        x=handles.yl01+sqrt(handles.yl02)*randn(1,handles.n)
    case 2
        x=exp(handles.yl01+sqrt(handles.yl02)*randn(1,handles.n))
    case 3
        x=exprnd(handles.yl03,1,handles.n)
    case 4
        x=wblrnd(handles.yl05,handles.yl04,1,handles.n)
end
switch handles.qdv
    case 1
        y=handles.qd01+sqrt(handles.qd02)*randn(1,handles.n)
    case 2
        y=exp(handles.qd01+sqrt(handles.qd02)*randn(1,handles.n))
    case 3
        y=exprnd(handles.qd03,1,handles.n)
    case 4
        y=wblrnd(handles.qd05,handles.qd04,1,handles.n)
end
sum=0
for i=1:handles.n
   if y(i)>x(i)
       sum=sum+1
   end
end
rate=sum/handles.n
set(handles.kkd,'String',rate)


% --- Executes on selection change in qdtype.
function qdtype_Callback(hObject, eventdata, handles)
% hObject    handle to qdtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns qdtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from qdtype
handles.qdv=get(hObject,'Value')
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qdtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qdtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qd1_Callback(hObject, eventdata, handles)
% hObject    handle to qd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qd1 as text
%        str2double(get(hObject,'String')) returns contents of qd1 as a double
handles.qd01=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qd2_Callback(hObject, eventdata, handles)
% hObject    handle to qd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qd2 as text
%        str2double(get(hObject,'String')) returns contents of qd2 as a double
handles.qd02=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qd2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qd3_Callback(hObject, eventdata, handles)
% hObject    handle to qd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qd3 as text
%        str2double(get(hObject,'String')) returns contents of qd3 as a double
handles.qd03=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qd3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qd4_Callback(hObject, eventdata, handles)
% hObject    handle to qd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qd4 as text
%        str2double(get(hObject,'String')) returns contents of qd4 as a double
handles.qd04=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qd4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qd5_Callback(hObject, eventdata, handles)
% hObject    handle to qd5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qd5 as text
%        str2double(get(hObject,'String')) returns contents of qd5 as a double
handles.qd05=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function qd5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in yltype.
function yltype_Callback(hObject, eventdata, handles)
% hObject    handle to yltype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns yltype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from yltype
handles.ylv=get(hObject,'Value')
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yltype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yltype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yl1_Callback(hObject, eventdata, handles)
% hObject    handle to yl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yl1 as text
%        str2double(get(hObject,'String')) returns contents of yl1 as a double
handles.yl01=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yl1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yl2_Callback(hObject, eventdata, handles)
% hObject    handle to yl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yl2 as text
%        str2double(get(hObject,'String')) returns contents of yl2 as a double
handles.yl02=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yl2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yl3_Callback(hObject, eventdata, handles)
% hObject    handle to yl3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yl3 as text
%        str2double(get(hObject,'String')) returns contents of yl3 as a double
handles.yl03=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yl3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yl3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yl4_Callback(hObject, eventdata, handles)
% hObject    handle to yl4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yl4 as text
%        str2double(get(hObject,'String')) returns contents of yl4 as a double
handles.yl04=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yl4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yl4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yl5_Callback(hObject, eventdata, handles)
% hObject    handle to yl5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yl5 as text
%        str2double(get(hObject,'String')) returns contents of yl5 as a double
handles.yl05=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function yl5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yl5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mncs_Callback(hObject, eventdata, handles)
% hObject    handle to mncs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mncs as text
%        str2double(get(hObject,'String')) returns contents of mncs as a double
handles.n=str2num(get(hObject,'String'))
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function mncs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mncs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
