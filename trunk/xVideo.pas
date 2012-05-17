unit xVideo;

{
  xVideo 1.2 Delphi unit
  Copyright (c) 2009-2010 Cristea Aurel Ionut.
  Check http://surodev.com for updates
}


interface

uses
  Windows;
  const
  {DLL NAME}
  DLLNAME                       =   'xVideo.dll';
  {xVideo Plugin CLSID}
  CLSID_DSHOWPLUGIN: TGUID = '{00000000-0000-0000-0000-000000000000}';
  {xVideo Version}
  xVideo_VERSION = $10200;             // API version
  xVideo_VERSIONTEXT = '1.2.0';         //TEXT version

  type
   DWORD = LongWord;
   BOOL = LongBool;
   FLOAT = Single;
   QWORD = Int64;

   HWINDOW = DWORD;   //multi video handle
   HSTREAM = DWORD;   // playing sample's channel handle
   HRECORD = DWORD;   // recording handle
   HSYNC   = DWORD;   // synchronizer handle
   HDSP    = DWORD;   // DSP handle

 SYNCPROC = procedure(handle: HSYNC; channel, data: DWORD; user: Pointer); stdcall;
  {
    Sync callback function. NOTE: a sync callback function should be very
    quick as other syncs cannot be processed until it has finished. If the
    sync is a "mixtime" sync, then other streams and MOD musics can not be
    mixed until it's finished either.
    handle : The sync that has occured
    channel: Channel that the sync occured in
    data   : Additional data associated with the sync's occurance
    user   : The 'user' parameter given when calling xVideo_ChannelSetSync
  }

  DSPPROC = procedure(handle: HDSP; channel: DWORD; buffer: Pointer; length: DWORD; user: Pointer); stdcall;
  {
    DSP callback function. NOTE: A DSP function should obviously be as quick
    as possible... other DSP functions, streams and MOD musics can not be
    processed until it's finished.
    handle : The DSP handle
    channel: Channel that the DSP is being applied to
    buffer : Buffer to apply the DSP to
    length : Number of bytes in the buffer
    user   : The 'user' parameter given when calling xVideo_ChannelSetDSP
  }
  DRAWPROC = procedure(handle: HDC;channel: HSTREAM; user: Pointer);  stdcall;

//for Mix_StreamCreate function
 PTMixingFiles = ^TMixingFiles ;
 TMixingFiles = array[0..14] of PCHAR;

/////////////CALLBACKS///////////////////
///
 TCallBackEnumEncoderFilter = function(Filter : Pointer; FilterName: PChar) : BOOL; stdcall;
 {
   Filter- the instance of a IBaseFilter;
   FilterName - The name of the Filter
 }

 TCallBackConnectedFilters  = function(Filter : Pointer; FilterName: PChar;pp:BOOL;user:pointer) : BOOL; stdcall;
 {
   Filter- the instance of a IBaseFilter;
   FilterName - The name of the Filter
   pp - Boolean, Filter supports or not Property Pages
   user - The 'user' parameter 
 }

 TCallBackEnumDevices       = function(device: PChar;user:Pointer) : BOOL; stdcall; TCallBackChannelDVDChange  = function(oldChan:HSTREAM;newChan:HSTREAM;user: Pointer):BOOL;stdcall;
 {
   device - the device name
   user - The 'user' parameter 
 }

/////////////////////////////////////////
//for xVideo_ChannelGetInfo function
 xVideo_ChannelInfo= ^TxVideo_ChannelInfo;
 TxVideo_ChannelInfo = record
     AvgTimePerFrame : Double; //average Time per frame (i.e 23.97 - it will draw 23.97 frames per seconds);
     Height, Width : integer; //video size;
     Channels: integer; //number of channels (i.e.1= mono,2= stereo...)
     freq: DWORD;  //sample rate
     wBits: DWORD; // number of bits per sample of mono data */
     ftpoint: BOOL;//true if audio is 32 bit floating point, false else
 end;

//for xVideo_ChannelSetConfig function
 TextOverlayStruct = ^TTextOverlayStruct;
 TTextOverlayStruct = record
    x:     integer;       //x position
    y:     integer;       //y position
    red:   integer;       //0 ..255
    green: integer;       //0 ..255
    blue : integer;       //0 ..255
    txtfont: HFONT;       //handle of a Font
 end;

 VideoColors = ^TVideoColors;
 TVideoColors=record
  HUE: integer;            //-180...180
  Contrast: integer;       //0...128
  Brightness: integer;     //-128...128.
  Saturation: integer;     //0...128
 end;

 ///////xVideo_ChannelSetAttribute/GetAttribute Constants
 const
  xVideo_ATTRIB_VOL         = 1;     //used to set Audio Volume
  xVideo_ATTRIB_PAN         = 2;     //used to set Audio Pan
  xVideo_ATTRIB_RATE        = 3;     //used to set Graph Rate
  xVideo_ATTRIB_AspectRatio = 4;     //used to set Aspect Ratio
     xVideo_Ratio_4p3       = 1010;
     xVideo_Ratio_16p9      = 1011;
  xVideo_ATTRIB_PITCH       = 5;    //used to set Audio Pitch
  xVideo_ATTRIB_AVSync      = 6;    //used to set Audio/Video Delay
  xVideo_ATTRIB_TEMPO       = 7;    //used to set Audio Tempo
  xVideo_ATTRIB_ChanProcess = 8;   //used to set audio channel to be processed
                                   {
                                     value: 0 - process as stereo
                                            1 - process right channel
                                            2 - process left channel

                                   }
//xVideo_SetConfig configs and values
  xVideo_FLOATDSP              =    $1003;      //use this to enable/disable floating point DSP Processing
  xVideo_WindowLessStreams     =    $1002;      //use this to set the number of streams in a VMR7/9 Windowsless mode
  xVideo_WindowLessHandle      =    $1001;      //VMR7/VMR9 WindowLess Mode need an initial window so set a HWND to use properly VMR
  xVideo_VideoRenderer         =    $1000;
  xVideo_VMR7                  =    1;          //pass this to select VMR7 Windowed render
  xVideo_Overlay               =    2;          //pass this to select overlay video render
  xVideo_VMR9                  =    3;          //pass this to select VMR9 Windowed render
  xVideo_NULL                  =    4;          //pass this to select NULL Video Renderer
  xVideo_VMR7WindowsLess       =    5;          //pass this to select VMR7 window less render
  xVideo_VMR9WindowsLess       =    6;          //pass this to select VMR9 window less render
  xVideo_EVR                   =    7;          //pass this to select Enhanced Video Renderer
//for xVideo_DVDSetOption
  xVideo_DVD_TITLEMENU                 =   100;
  xVideo_DVD_ROOT                      =   101;          //go to DVD root
  xVideo_DVD_NEXTCHAPTER               =   102;          //go to dvd next chapter
  xVideo_DVD_PREVCHAPTER               =   103;          //go to dvd previous chapter
  xVideo_DVD_TITLE                     =   104;          //set the playing title
  xVideo_DVD_TITLECHAPTER              =   105;          //set chapter in title
//for xVideo_DVDGetProp
  xVideo_DVDCurrentTitle           =$10010;     //used in prop
  xVideo_DVDTitles                 =$10020;   //used in prop
  xVideo_DVDTitleChapters          =$10030;   //used in prop
  xVideo_DVDCurrentTitleTime       =   145;   //uses to get current DVD title Length
  xVideo_DVDCurrentTitlePosition   =   146;   //uses to get current DVD title position

//for xVideo_MultiVideoSetOption
  xVideo_MultivideoParent    =    432 ;

////////xVideo_MIX_ChanOptions //////////////////////
  xVideo_MixRect            =    2000;
  xVideo_MixAlpha           =    2001;

///Recorder Flags///
  Record_AudioDevices       =  5000;
  Record_VideoDevices       =  5001;

//ERROR CODES
  xVideo_Unknown            =    -1;   //unknown error
  xVideo_OK                 =    0;    //all is ok
  xVideo_BADFILENAME        =    2;    //file don't exists or the filename parameter is NULL
  xVideo_INVALIDCHAN        =    5;    //invalid channel

  xVideo_ERROR1             =    107;  //this is returned by set dvd menu function
  xVideo_ERROR2             =    108;  // next chapter failed
  xVideo_ERROR3             =    109;  //prev chapter failed
  xVideo_ERROR4             =    110;  // title menu failed
  xVideo_ERROR5             =    111;  //graph creation failed
  xVideo_ERROR6             =    112;  //DVD Graph creation failed
  xVideo_ERROR7             =    114;
  xVideo_ERROR8             =    115;  //NO DVD Decoder found


//xVideo_ChannelGetLenght/SetPosition/GetPosition: modes
  xVideo_POS_SEC            =     0; //position in seconds
  xVideo_POS_FRAME          =     1; //position in frames
  xVideo_POS_MILISEC        =     2; //position in miliseconds

//xVideo_ChannelSetSync types
  xVideo_SYNC_POS         = 0;
  xVideo_SYNC_END         = 1;
  xVideo_SYNC_SLIDE       = 2;
  xVideo_SYNC_FREE        = 3;
  xVideo_SYNC_SETPOS      = 4;

//xVideo_ChannelGetState return values
  xVideo_STATE_STOPPED    =	0;  //channel is stopped
  xVideo_STATE_PLAYING	  = 1;  //channel is playing
  xVideo_STATE_PAUSED  	  = 2;  //channel is paused
  
//xVideo_DVD_Menu option parameters list
  xVideo_DVDSelAtPos      =21;   //use this to select button at a TPoint
  xVideo_DVDActAtPos      =22;   //use this to activate button at a TPoint
  xVideo_DVDActivBut      =23;   //use this to activate selected button
  xVideo_DVDSeleButton    =24;
/////
  xVideo_UNICODE            = $80000000;   //pass this flag when use UNICODE strings
  xVideo_STREAM_AUTOFREE    = $7000000;   //put this flag to free the stream when it completes
  xVideo_STREAM_DECODE      = $600000;   //put this flag to set the channnel as a encoding one



 function  xVideo_GetVersion(): DWORD; stdcall; external DLLNAME;
 function  xVideo_StreamCreateURL( str: PCHAR;flags: DWORD): HSTREAM;  stdcall; external DLLNAME;
 function  xVideo_StreamCreateFile(str: PCHAR;position: DWORD;flags: DWORD):HSTREAM;stdcall; external DLLNAME;
 function  xVideo_Init(handle: HWND):bool;stdcall; external DLLNAME;
 procedure xVideo_ChannelSetPosition(chan: HSTREAM;pos: Double;mode: DWORD);stdcall;   external DLLNAME;
 function  xVideo_ChannelGetLength(chan: HSTREAM;mode: DWORD): Double; stdcall;  external DLLNAME;
 function  xVideo_ChannelGetPosition(chan: HSTREAM;mode: DWORD): Double;    stdcall;  external DLLNAME;
 procedure xVideo_ChannelSetWindow(chan: HSTREAM;handle: HWND);stdcall;   external DLLNAME;
 procedure xVideo_ChannelResizeWindow(chan: HSTREAM;left,top,right,bottom: integer);stdcall; external DLLNAME;
 procedure xVideo_ChannelSetFullscreen(chan: HSTREAM;value: boolean);stdcall; external DLLNAME;
 function  xVideo_ChannelPlay(chan: HSTREAM):bool;stdcall;  external DLLNAME;
 function  xVideo_ChannelPause(chan: HSTREAM):bool;stdcall;  external DLLNAME;
 function  xVideo_StreamFree(chan: HStream): bool; stdcall;  external DLLNAME;
 function  xVideo_ChannelStop(chan: HStream): bool; stdcall;  external DLLNAME;
 procedure xVideo_ChannelGetInfo(chan: HSTREAM;value: Pointer);stdcall; external DLLNAME;
 function  xVideo_StreamCreateDVD(dvdfile: Pointer;flags:DWORD):HSTREAM;stdcall; external DLLNAME;
 function  xVideo_DVDSetOption(chan: HStream;option: DWORD;value: DWORD): bool; stdcall;  external DLLNAME;
 function  xVideo_DVDGetProp(Chan: HSTREAM; prop: DWORD; value: DWORD): DWORD; stdcall; external DLLNAME;
 procedure xVideo_SetConfig(config: integer;value: integer);   stdcall;  external DLLNAME;
 function  xVideo_ErrorGetCode(): integer; stdcall;  external DLLNAME;
 procedure xVideo_LoadPlugin(str: pchar;guid :TGUID;name: PCHAR);   stdcall;  external DLLNAME;
 procedure xVideo_LoadPlugin2(str: Pointer;guid :Pointer;name: Pointer;flags: DWORD);   stdcall;  external DLLNAME;
 function  xVideo_Free(): BOOL; stdcall;  external DLLNAME;
 procedure xVideo_ChannelGetConnectedFilters(chan: HSTREAM;callback :Pointer;user:Pointer);stdcall; external DLLNAME;      //2.4.1
 procedure xVideo_ShowFilterPropertyPage(chan:HSTREAM;filter:DWORD;hndparent: HWND);  stdcall; external DLLNAME;      //2.4.1
 function  xVideo_MIX_StreamCreateFile(files: TMixingFiles;fileno: integer;flags: DWORD): HSTREAM;    stdcall;  external DLLNAME;
 function  xVideo_MIX_ChanOptions(chan: HSTREAM;option:DWORD;value: DWORD;value2: DWORD;rect: TRECT): BOOL;   stdcall;  external DLLNAME;
 procedure xVideo_ChannelSetTextOverlay(chan: HSTREAM ;text:PCHAR;x, y, red, green, blue: integer;font :HFONT);   stdcall;  external DLLNAME;
 function  xVideo_GetGraph(chan: HSTREAM): Pointer;   stdcall;  external DLLNAME;
///////
 function xVideo_Record_GetDevices(devicetype: DWORD;callback: Pointer;user: Pointer): integer; stdcall; external DLLNAME;
 function xVideo_RecordStart(audiodevice: Integer;videodevice: Integer;devicetype: DWORD;flags: DWORD): HRECORD; stdcall; external DLLNAME;
 function xVideo_RecordFree(rec: HRECORD): BOOL; stdcall; external DLLNAME;


 function  xVideo_ChannelAddWindow( chan:HSTREAM;win:HWND): HWINDOW;  stdcall; external DLLNAME;
 function  xVideo_ChannelRemoveWindow(chan:HSTREAM;window:HWINDOW):BOOL;stdcall; external DLLNAME;
 procedure xVideo_MultiVideoResize(chan:HSTREAM;window:HWINDOW;left,top,width,height: integer); stdcall; external DLLNAME;
 procedure xVideo_MultiVideoSetOption(chan: HSTREAM; window: HWINDOW; option: DWORD; value: DWORD);stdcall; external DLLNAME;
 function  xVideo_ChannelGetFrame(chan: HSTREAM): HBITMAP; stdcall; external DLLNAME;

 procedure xVideo_ChannelSetAttribute(chan: HSTREAM; option: DWORD;value: Double); stdcall; external DLLNAME;
 procedure xVideo_ChannelGetAttribute(chan: HSTREAM; option: DWORD;var value: Double); stdcall; external DLLNAME;
 function  xVideo_ChannelSetSync(chan: HSTREAM;typo: DWORD;param: QWORD;proc: Pointer;user: Pointer): HSYNC; stdcall; external DLLNAME;
 function  xVideo_ChannelRemoveSync(chan: HSTREAM; sync: HSYNC): BOOL; stdcall; external DLLNAME;
 function  xVideo_ChannelSetDSP(chan: HSTREAM;proc: Pointer;user: Pointer): HDSP; stdcall; external DLLNAME;
 function  xVideo_ChannelRemoveDSP(chan: HSTREAM;dsp: HDSP): BOOL; stdcall; external DLLNAME;
 function  xVideo_ChannelGetData(chan: HSTREAM;data: Pointer;size: DWORD): DWORD;   stdcall; external DLLNAME;
 function  xVideo_ChannelGetState(chan: HSTREAM): DWORD; stdcall; external DLLNAME;
 function  xVideo_ChannelSlideAttribute(chan: HSTREAM;typo: DWORD;param: double):BOOL;stdcall; external DLLNAME;
 function  xVideo_DVD_Menu(chan: HSTREAM;option: DWORD;value1: integer;value2: integer):BOOL; stdcall; external DLLNAME;
 function  xVideo_ChannelSetDrawCallback(chan: HSTREAM; proc: Pointer; user: Pointer):BOOL; stdcall; external DLLNAME;
 function  xVideo_ChannelRepaint(Chan: HSTREAM; handle: HWND; dc: HDC): BOOL; stdcall; external DLLNAME;
 function  xVideo_LoadPlugin3(str: pchar;flags: DWORD):Boolean;   stdcall;  external DLLNAME;

 implementation

// END OF FILE /////////////////////////////////////////////////////////////////

end.
