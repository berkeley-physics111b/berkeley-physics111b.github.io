function varargout = fittinggui(varargin)
% FITTINGGUI M-file for fittinggui.fig
%      FITTINGGUI is intended for use with the Physics 111 MATLAB Fitting
%      Toolkit (linfit, expfit, gaussfit).  It should run just fine with
%      other fitting functions, so long as they return the proper output.
%
%       Input: x,y,'String-name-of-fitting-function',(dy)
%           The String-name-of-fitting-function refers to a string
%           containing the name of the desired fitting function.  For
%           example, if we wanted to perform a linfit, we would pass in
%           'linfit'
%       Output: A structure containing the fitting information.  This is
%           exactly the output of the fitting function referenced in
%           String-name-of-fitting-function.
%
%
%       Note that the output function's structure must take in the
%       variables: x,y,(dy) where dy is optional and return a structure
%       containing at the very least a fitx and fity element giving the
%       x/y-coordinates for the intended fit respectively.
%
%       How to use: A proper call to fittinggui is as follows:
%           fit-variable = fittinggui(x,y,'name-of-fitting-function',dy);
%
%       This call will store in fitting-variable a fit of type
%       'name-of-fitting-function'.
%
%           The interface itself is relatively simple, simply click and
%           drag across the graph to select the points you wish to fit.
%           Shift+click-dragging allows you to select data from different
%           areas of the graph easily.  Once you are satisfied with the
%           data you have selected, click the Try Fit button.  This will
%           overlay the fit on the graph as well as give you fitting
%           information in the lower right corner.  Once satisfied with the
%           fit, click Use Fit to return the current fit.
%
%       Trying Fit without selecting any data uses the entire data set.
%       Using Fit without Trying a fit first results in no action, while
%       forcing an exit through the windows command returns NaN.
%
%       Not providing a dy array will result in an equal-weights fit.
%       Providing a dy array will cause the fit to propogate error through
%       the fit and into the fitting parameters.  In the error propogation
%       the option is available to view the graph with errorbars turned on.
%
%       If you are having trouble clicking on a portion of the data, try
%       maximizing the window to see better.


% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fittinggui_OpeningFcn, ...
                   'gui_OutputFcn',  @fittinggui_OutputFcn, ...
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


% --- Executes just before fittinggui is made visible.
function fittinggui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fittinggui (see VARARGIN)

% Choose default command line output for fittinggui
handles.output = hObject;

handles.xin = varargin{1};
handles.yin = varargin{2};
handles.fitfun = varargin{3};

if nargin==7
    handles.errorpresent = true;
    handles.dyin = varargin{4};
else
    set(handles.errorbar,'Enable','off');
    handles.errorpresent = false;
end


set(handles.axes1,'XLimMode','auto');
set(handles.axes1,'YLimMode','auto');
handles.fullplot = plot(handles.xin,handles.yin,'.');
% set(handles.axes1,'XLimMode','manual');
% set(handles.axes1,'YLimMode','manual');

% Update handles structure
guidata(hObject, handles);
hold on;
brush on;

% UIWAIT makes fittinggui wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fittinggui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
if (isfield(handles,'fit'))
    varargout{1} = handles.output;   
    delete(handles.figure1);
else
    varargout{1} = NaN;
end



% --- Executes on selection change in errorbar.
function errorbar_Callback(hObject, eventdata, handles)
% hObject    handle to errorbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns errorbar contents as cell array
%        contents{get(hObject,'Value')} returns selected item from errorbar
setting = get(handles.errorbar,'Value');

if(isfield(handles,'errplot'))
    delete(handles.errplot);
    handles = rmfield(handles,'errplot');
end
set(handles.axes1,'XLimMode','auto');
set(handles.axes1,'YLimMode','auto');
if(isfield(handles,'fitplot'))
    set(handles.fitplot,'visible','off');
end
if(setting == 2)
        handles.errplot = errorbar(handles.xin,handles.yin,handles.dyin,'.');
        set(handles.errplot,'marker','none');
end
set(handles.axes1,'XLimMode','manual');
set(handles.axes1,'YLimMode','manual');
if(isfield(handles,'fitplot'))
    set(handles.fitplot,'visible','on');
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function errorbar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errorbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tryfit.
function tryfit_Callback(hObject, eventdata, handles)
% hObject    handle to tryfit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% axisdata = get(handles.axes1);
% if (size(axisdata.Children,1) > 1)
%     if(isfield(get(axisdata.Children(1)),'UData'))
%         co = get(axisdata.Children(2));
%     else
%         co = get(axisdata.Children(1));
%     end
% else
%     co = get(axisdata.Children);
% end

if(isfield(handles,'fitplot'))
    delete(handles.fitplot);
    handles = rmfield(handles,'fitplot');
end

co = get(handles.fullplot);
    
x = handles.xin;
y = handles.yin;

bdata = find(co.BrushData == 1);
if (~isempty(bdata))
    x = x(bdata);
    y = y(bdata);
end

if (handles.errorpresent)
    dy = handles.dyin;
    if(~isempty(bdata))
        dy = dy(bdata);
    end
    
    handles.fit = feval(handles.fitfun,x,y,dy);
end

handles.fit = feval(handles.fitfun,x,y);


%Reset axis to fit to curve then stop fitting so it doesn fit a bad
%curvefit
set(handles.axes1,'XLimMode','auto');
set(handles.axes1,'YLimMode','auto');
set(handles.axes1,'XLimMode','manual');
set(handles.axes1,'YLimMode','manual');
fity = handles.fit.fity;

fit = handles.fit;
fit = rmfield(fit,'fity');
fit = rmfield(fit,'fitx');
set(handles.fittxt,'String',evalc('fit'));

handles.fitplot = plot(x,fity,'r-');

guidata(hObject, handles);


% --- Executes on button press in usefit.
function usefit_Callback(hObject, eventdata, handles)
% hObject    handle to usefit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isfield(handles,'fit'))
    handles.output = handles.fit;
    guidata(hObject, handles);
    uiresume(handles.figure1);
end

