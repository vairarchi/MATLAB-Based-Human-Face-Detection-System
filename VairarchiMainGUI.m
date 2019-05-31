 function varargout = VairarchiMainGUI(varargin)
% VAIRARCHIMAINGUI MATLAB code for VairarchiMainGUI.fig
%      VAIRARCHIMAINGUI, by itself, creates a new VAIRARCHIMAINGUI or raises the existing
%      singleton*.
%
%      H = VAIRARCHIMAINGUI returns the handle to a new VAIRARCHIMAINGUI or the handle to
%      the existing singleton*.
%
%      VAIRARCHIMAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VAIRARCHIMAINGUI.M with the given input arguments.
%
%      VAIRARCHIMAINGUI('Property','Value',...) creates a new VAIRARCHIMAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VairarchiMainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VairarchiMainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VairarchiMainGUI

% Last Modified by GUIDE v2.5 09-Mar-2019 22:31:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VairarchiMainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @VairarchiMainGUI_OutputFcn, ...
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


% --- Executes just before VairarchiMainGUI is made visible.
function VairarchiMainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VairarchiMainGUI (see VARARGIN)

% Choose default command line output for VairarchiMainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VairarchiMainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VairarchiMainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

display Goodbye!!
close(handles.figure1)

% --- Executes on button press in detect.
function detect_Callback(hObject, eventdata, handles)
% hObject    handle to detect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

VairarchiDetector


% --- Executes on button press in track.
function track_Callback(hObject, eventdata, handles)
% hObject    handle to track (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

VairarchiTracking
