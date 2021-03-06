function varargout = VairarchiDetector(varargin)
% VAIRARCHIDETECTOR MATLAB code for VairarchiDetector.fig
%      VAIRARCHIDETECTOR, by itself, creates a new VAIRARCHIDETECTOR or raises the existing
%      singleton*.
%
%      H = VAIRARCHIDETECTOR returns the handle to a new VAIRARCHIDETECTOR or the handle to
%      the existing singleton*.
%
%      VAIRARCHIDETECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VAIRARCHIDETECTOR.M with the given input arguments.
%
%      VAIRARCHIDETECTOR('Property','Value',...) creates a new VAIRARCHIDETECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VairarchiDetector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VairarchiDetector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VairarchiDetector

% Last Modified by GUIDE v2.5 22-Feb-2019 16:48:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VairarchiDetector_OpeningFcn, ...
                   'gui_OutputFcn',  @VairarchiDetector_OutputFcn, ...
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


% --- Executes just before VairarchiDetector is made visible.
function VairarchiDetector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VairarchiDetector (see VARARGIN)

% Choose default command line output for VairarchiDetector
handles.output = hObject;
axes(handles.axes1);
imshow('blank.jpg');
axis off;

axes(handles.axes2);
imshow('blank.jpg');
axis off;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VairarchiDetector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VairarchiDetector_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in face.
function face_Callback(hObject, eventdata, handles)
% hObject    handle to face (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileName=getappdata(hObject,'FN')

FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on number of objects
BB = step(FDetect,FileName);

axes(handles.axes2)
imshow(FileName); 
hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',3,'LineStyle','-','EdgeColor','r');
end
hold off;
%Face=imcrop(FileName,BB);
%figure,imshow(Face);
display(BB)

% --- Executes on button press in eyes.
function eyes_Callback(hObject, eventdata, handles)
% hObject    handle to eyes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileName=getappdata(hObject,'FN')

%To detect Eyes
EyeDetect = vision.CascadeObjectDetector('EyePairBig'); 


BB=step(EyeDetect,FileName);

axes(handles.axes2)
imshow(FileName); 
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','r');
title('Eyes Detection');
%Eyes=imcrop(I,BB);
%figure,imshow(Eyes);


% --- Executes on button press in mouth.
function mouth_Callback(hObject, eventdata, handles)
% hObject    handle to mouth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileName=getappdata(hObject,'FN')

%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',120); 

BB=step(MouthDetect,FileName);

axes(handles.axes2)
imshow(FileName); 
hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;



% --- Executes on button press in nose.
function nose_Callback(hObject, eventdata, handles)
% hObject    handle to nose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FileName=getappdata(hObject,'FN')

NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16); 

BB=step(NoseDetect,FileName);

axes(handles.axes2)
imshow(FileName); 
hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Nose Detection');
hold off;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename filepath]=uigetfile({'*.*';'*.jpg';'*.png';'*.bmp'}, 'Search Image to be Displayed');
fullname = [filepath filename];
%now we read the image fullname
ImageFile = imread(fullname);
%Now let's display the image
axes(handles.axes1)
imshow(ImageFile)

setappdata(handles.face,'FN',ImageFile);
setappdata(handles.eyes,'FN',ImageFile);
setappdata(handles.mouth,'FN',ImageFile);
setappdata(handles.nose,'FN',ImageFile);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

display 'Exiting Detection Module!'
close(handles.figure1)
