function varargout = Front(varargin)
% FRONT M-file for Front.fig
%      FRONT, by itself, creates a new FRONT or raises the existing
%      singleton*.
%
%      H = FRONT returns the handle to a new FRONT or the handle to
%      the existing singleton*.
%
%      FRONT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRONT.M with the given input arguments.
%
%      FRONT('Property','Value',...) creates a new FRONT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Front_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Front_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Front

% Last Modified by GUIDE v2.5 15-Apr-2011 14:46:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Front_OpeningFcn, ...
                   'gui_OutputFcn',  @Front_OutputFcn, ...
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


% --- Executes just before Front is made visible.
function Front_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Front (see VARARGIN)

% Choose default command line output for Front
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Front wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.text2,'Visible','off');
subplot('Position',[0.25 0.4 0.5 0.5]);
imshow('Default.bmp');


% --- Outputs from this function are returned to the command line.
function varargout = Front_OutputFcn(hObject, eventdata, handles) 
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
Front('Visible','off');
Add_Logo('Visible','on');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Sensed = imread('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\Extract_Logo\Lemonade.bmp');
Sensed=getappdata(0,'SensedImg');
subplot('Position',[0.25 0.5 0.4 0.4]);
imshow(Sensed);
% Template=imread('C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\Logos\Lemonade.bmp');
if (get(handles.radiobutton1,'Value') == get(hObject,'Max'))
%     [Sensed_Img Result]=NCC(Sensed,Template);
%     %disp(Result);
%     subplot('Position',[0.2 0.4 0.4 0.4]);
%     imshow(Sensed_Img);
    Call_NCC(handles,Sensed);
elseif (get(handles.radiobutton2,'Value') == get(hObject,'Max'))
%     [Sensed_Img Result]=Vector_Quantization(Sensed,Template);
%     subplot('Position',[0.2 0.4 0.4 0.4]);
%     imshow(Sensed_Img);
    Call_VQ_LBG(handles,Sensed);
elseif (get(handles.radiobutton3,'Value') == get(hObject,'Max'))
%     [Sensed_Img Result]=Fast_VQ(Sensed,Template);
%     subplot('Position',[0.2 0.4 0.4 0.4]);
%     imshow(Sensed_Img);
    Call_VQ_KFCG(handles,Sensed);
end;
% Sensed_Img=NCC(Sensed,Template);
% subplot('Position',[0.2 0.4 0.4 0.4]);
% imshow(Sensed_Img);

% function IMG1=Trail()
% 
% Log=getappdata(0,'Logo');
% [r c]=size(Log);
% % disp(r);
% Count=getappdata(0,'Index');
% while Count<r+1
%     % disp('REpeat !!!!')
%     source=Log{Count,1};
%     % subplot(3,3,3)
%     subplot('Position',[0.72 0.6 0.2 0.2]);
%     imshow(source);
%     Count=Count+1;
% %     if Count==r+1
% %     Count=1;
% %     end;
% %      wait(hObject,5);
% end
% IMG1=Sample2();


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2,'Visible','off');
set(handles.text3,'Visible','off');
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
[filename, pathname] = uigetfile('Extract_Logo', 'Pick an Image');
SensedImg=imread(strcat(pathname,'\',filename));
subplot('Position',[0.25 0.5 0.4 0.4]);
imshow(SensedImg);
setappdata(0,'SensedImg',SensedImg);

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton3,'Value',0);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);

function Call_NCC(handles,Sensed_IMG)
F_Result=false;
Template_No=1;
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
load('Logo_Info\TestData.mat','Logo_Log');
[r ~]=size(Logo_Log);
while F_Result==false && Template_No<=r 
    Template_Addr=Logo_Log{Template_No,1};
    Template_Name=Logo_Log{Template_No,2};
    Template=imread(Template_Addr);
    subplot('Position',[0.74 0.62 0.2 0.2]);
    imshow(Template);
    pause(0.5);
    [Sensed_Img Result]=NCC(Sensed_IMG,Template,Template_Name);
    if Result==true
    subplot('Position',[0.25 0.5 0.4 0.4]);
    imshow(Sensed_Img);
    Show_Match(handles);
    F_Result=true;
    break;
    else
        Show_NoMatch(handles)
    end;
    Template_No=Template_No+1;
end

function Call_VQ_LBG(handles,Sensed_IMG)
F_Result=false;
Template_No=1;
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
load('Logo_Info\TestData.mat','Logo_Log');
[r ~]=size(Logo_Log);
while F_Result==false && Template_No<=r 
    Template_Addr=Logo_Log{Template_No,1};
    Template_Name=Logo_Log{Template_No,2};
    Template=imread(Template_Addr);
    subplot('Position',[0.74 0.62 0.2 0.2]);
    imshow(Template);
    pause(0.5);
    [Sensed_Img Result]=Vector_Quantization(Sensed_IMG,Template,Template_Name);
    if Result==true
    subplot('Position',[0.25 0.5 0.4 0.4]);
    imshow(Sensed_Img);
    Show_Match(handles);
    F_Result=true;
    break;
    else
        Show_NoMatch(handles)
    end;
    Template_No=Template_No+1;
end

function Call_VQ_KFCG(handles,Sensed_IMG)
F_Result=false;
Template_No=1;
% C:\D-DRIVE\Rohan\BE-PROJECT\Codes\GUI\Final_GUI_Rough\
load('Logo_Info\TestData.mat','Logo_Log');
[r ~]=size(Logo_Log);
while F_Result==false && Template_No<=r 
    Template_Addr=Logo_Log{Template_No,1};
    Template_Name=Logo_Log{Template_No,2};
    Template=imread(Template_Addr);
    subplot('Position',[0.74 0.62 0.2 0.2]);
    imshow(Template);
    pause(0.5);
    [Sensed_Img Result]=Fast_VQ(Sensed_IMG,Template,Template_Name);
    if Result==true
    subplot('Position',[0.25 0.5 0.4 0.4]);
    imshow(Sensed_Img);
    Show_Match(handles);
    F_Result=true;
    break;
    else
        Show_NoMatch(handles)
    end;
    Template_No=Template_No+1;
end

function Show_Match(handles)
set(handles.text2,'Visible','on');
match= strvcat(' ','MATCH');
set(handles.text2,'String',match);
for i=1:10
    pause(0.5);
    set(handles.text2,'ForegroundColor',[0 0 0]);
    set(handles.text2,'BackgroundColor',[0 1 0]);
    pause(0.5);
    set(handles.text2,'ForegroundColor',[0 1 0]);
    set(handles.text2,'BackgroundColor',[0.94 0.94 0.94]);
end
set(handles.text2,'Visible','off');

function Show_NoMatch(handles)
set(handles.text2,'Visible','on');
nomatch= strvcat(' ','NO MATCH');
set(handles.text2,'String',nomatch);
for i=1:5
    pause(0.2);
    set(handles.text2,'ForegroundColor',[0 0 0]);
    set(handles.text2,'BackgroundColor',[1 0 0]);
    pause(0.2);
    set(handles.text2,'ForegroundColor',[1 0 0]);
    set(handles.text2,'BackgroundColor',[0.94 0.94 0.94]);
end
set(handles.text2,'Visible','off');
