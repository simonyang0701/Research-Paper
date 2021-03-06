function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%    TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 03-Jun-2018 14:58:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;
backgroundImage =importdata('DEMO3.jpg');
axes(handles.axes1);
image(backgroundImage);
axis off
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d = evalin('base','a');
interval = 800;
limit = 1000;
s = 1;
t = 1;
data = 0;
for s = 1:limit
    while(t < interval)
        b = d.analogRead(0);
        data = [data b];
        t = t + 1;
    end
    t = 1;
    j=3;
    L=length(data);
    result = sum(abs(data(1+j+j:L)-2*data(1+j:L-j)+data(1:L-j-j)));
    if(result > 20000)
        set(handles.pushbutton1,'backgroundcolor',[1,1,0]);%move
    elseif (result > 6000 && result<20000)
        set(handles.pushbutton1,'backgroundcolor',[0,1,0]);%on
    else
        set(handles.pushbutton1,'backgroundcolor',[1,0,0]);%off
    end
    guidata(hObject,handles);
    pause(0.01);
    data = 0;
    s = s+1;
end
% for k = 1:10
%     re = randi(3);
%     if(re > 2)
%         status = 1;
%     elseif (re> 1 && re<=2)
%         status = 2;
%     else
%         status = 3;
%     end
%     
%     if status == 1
%         set(handles.pushbutton1,'backgroundcolor',[1,1,0]);
%     elseif status == 2
%         set(handles.pushbutton1,'backgroundcolor',[0,1,0]);
%     else
%         set(handles.pushbutton1,'backgroundcolor',[1,0,0]);
%     end
%     guidata(hObject,handles);
% %     pause(0.5);
%     k=k+1;
%     
% end


