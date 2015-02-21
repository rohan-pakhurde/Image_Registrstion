function varargout = Add_Logo(varargin)
% ADD_LOGO M-file for Add_Logo.fig
%      ADD_LOGO, by itself, creates a new ADD_LOGO or raises the existing
%      singleton*.
%
%      H = ADD_LOGO returns the handle to a new ADD_LOGO or the handle to
%      the existing singleton*.
%
%      ADD_LOGO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD_LOGO.M with the given input arguments.
%
%      ADD_LOGO('Property','Value',...) creates a new ADD_LOGO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Add_Logo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Add_Logo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Add_Logo

% Last Modified by GUIDE v2.5 04-May-2011 23:40:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Add_Logo_OpeningFcn, ...
                   'gui_OutputFcn',  @Add_Logo_OutputFcn, ...
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


% --- Executes just before Add_Logo is made visible.
function Add_Logo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Add_Logo (see VARARGIN)

% Choose default command line output for Add_Logo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Add_Logo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.text1,'Visible','off');
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.edit1,'Visible','off');
set(handles.pushbutton3,'Visible','off');


% --- Outputs from this function are returned to the command line.
function varargout = Add_Logo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
[filename1, pathname1] = uigetfile('Extract_Logo', 'Pick an Image');
set(handles.text1,'Visible','on');
if isequal(filename1,0)
   set(handles.text1,'String','File selection Canceled');
else
    set(handles.text1,'String','Select Logo. Double click to load.');
    File1 = fullfile(pathname1,filename1);
%     handles.File_Name = filename1;
    guidata(hObject,handles);
    subplot('Position',[0.2 0.5 0.4 0.4]);
    IMG=imread(strcat(pathname1,'\',filename1));
    imshow(strcat(pathname1,'\',filename1));
    pathname1=strrep(pathname1, '\', '\\');
%     title('Image 1');
    h = imrect;
    position = wait(h);
    set(handles.text2,'Visible','on');
    set(handles.text2,'String','Selected Logo is.');
    logo = imcrop(IMG,position);
    handles.Logo=logo;
    subplot('Position',[0.7 0.6 0.2 0.2]);
    imshow(logo);
    setappdata(0,'Logo',logo);
    set(handles.text3,'Visible','on');
    set(handles.text3,'String','Enter Name of Logo below.');
    set(handles.edit1,'Visible','on');
    set(handles.pushbutton3,'Visible','on');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Add_Logo('Visible','off');
Front('Visible','on');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.edit1,'String');
set(handles.text3,'String',a);
I=getappdata(0,'Logo');
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
Dest=strcat('Logos','\',a,'.bmp');
imwrite(I,Dest);
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
load('Logo_Info\TestData.mat','Logo_Log');
[r ~]=size(Logo_Log);
temp={Dest,a};
Logo_Log(r+1,:)=temp;
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
save('Logo_Info\TestData.mat','Logo_Log');

% load('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\Logo_Info\Name.mat','Logo_Name');
% [r ~]=size(Logo_Name);
% temp={a};
% Logo_Name(r+1,:)=temp;
% save('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\Logo_Info\Name.mat','Logo_Name');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Logo_Log={};
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
save('Logo_Info\TestData.mat','Logo_Log');
