PROGRAM_NAME='Bunge - J16011247 - Boardroom 128- PAG'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 08/15/2018  AT: 10:50:39        *)
(***********************************************************)
#warn 'note that this code derives from large training room 137-139 and may reference some additional functionality that isnt required in 128'
#warn 'this code should be loaded on system #1, system #1 must have system number #2 in the URL list (Diagnostics/URL Listing)'
#warn 'no specification received for IPTV control.  Generic commands have been added and tested'  


DEFINE_DEVICE
dvMaster       =       0:01:0           //AMX NX-3200 Processor
dvSOUNDWEB     =       0:04:0           //BSS Blu-101 DSP
dvExterity     =       0:05:0           //Exterity AvediaPlayer R9300 Receiver    http://10.1.7.12   //Exterity r9300 default user:admin password:Labrador labrador
dvCiscoSX80    =       0:06:0           //Cisco SX80  //default username is admin, default password is blank
dvPowerController   =  0:07:0           //Surge X SX-AX20E

dvMatrixSDX         =     128:01:0   	//AMX SDX-514M-DX Switcher //this room doesn't use these

dvCom1		= 5001:1:0
dvCom2		= 5001:2:0

dvMatrix            =    5002:01:129   	//Enova DGX1600 Switcher
//#warn ''
//dvMatrix          =    33002:01:0     //Enova DGX1600 Switcher

dvMatrixOut01       =    5002:01:129   	//Enova DGX1600 Switcher-left display
dvMatrixOut02       =    5002:02:129   	//Enova DGX1600 Switcher-right display
dvMatrixOut05       =    5002:05:129   	//Enova DGX1600 Switcher-vc content
dvMatrixOut06       =    5002:06:129   	//Enova DGX1600 Switcher-audio de-embedder

dvMatrixIn01		=    5002:01:129   	//Enova DGX1600 Switcher
dvMatrixIn02		=    5002:02:129   	//Enova DGX1600 Switcher
dvMatrixIn03		=    5002:03:129   	//Enova DGX1600 Switcher
dvMatrixIn04		=    5002:04:129   	//Enova DGX1600 Switcher
dvMatrixIn05		=    5002:05:129   	//Enova DGX1600 Switcher
dvMatrixIn06		=    5002:06:129   	//Enova DGX1600 Switcher
dvMatrixIn07		=    5002:07:129   	//Enova DGX1600 Switcher
dvMatrixIn08		=    5002:08:129   	//Enova DGX1600 Switcher
dvMatrixIn09		=    5002:09:129   	//Enova DGX1600 Switcher
dvMatrixIn10		=    5002:10:129   	//Enova DGX1600 Switcher
dvMatrixIn11		=    5002:11:129   	//Enova DGX1600 Switcher
dvMatrixIn12		=    5002:12:129   	//Enova DGX1600 Switcher
dvMatrixIn13		=    5002:13:129   	//Enova DGX1600 Switcher
dvMatrixIn14		=    5002:14:129   	//Enova DGX1600 Switcher
dvMatrixIn15		=    5002:15:129   	//Enova DGX1600 Switcher
dvMatrixIn16		=    5002:16:129   	//Enova DGX1600 Switcher


dvTP1               =   10001:01:0      //Ipad Apple Air 2 running Touchpanel Control.  Use TP Transfer or TP Cloud to load files. 

//vdvTPDummy          =   33001:01:0      //Temporary empty touchpanel device
vdvMatrixOutDummy   =   33002:01:0      //Temporary empty matrix output device
vdvRXDummy          =   33003:01:0      //Temporary empty receiver device

vdvCiscoSX80        =   41001:01:0      //The COMM module should use this as its duet device
vdvRX1              =   41002:01:0      //The COMM module should use this as its duet device
vdvRX2              =   41003:01:0      //The COMM module should use this as its duet device
vdvPowerController  =   41004:01:0      // The COMM module should use this as its duet device

//txs appear in 45001+ range
dvRX1               =   46001:01:129      //DXLink 4K HDMI Receiver Module  //NEC E905 - baud rate 9600
dvRX2               =   46002:01:129      //DXLink 4K HDMI Receiver Module  //NEC E905 - baud rate 9600


(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

// Shutdown at 21:00 (9 PM)
INTEGER SHUTDOWN_HOUR = 21
INTEGER SHUTDOWN_MINUTE = 0

dev dvTPAll[]={dvTP1}  //room can be modified to support three touchpanels for future use
dev dvRXAll[]={dvRX1,dvRX2,vdvRXDummy,vdvRXDummy,vdvRXDummy,vdvRXDummy}  //room can be modified to support 6 displays for future use
dev dvMatrixOutAll[]={dvMatrixOut01,dvMatrixOut02,vdvMatrixOutDummy,vdvMatrixOutDummy,dvMatrixOut05,dvMatrixOut06}   //outs 3 and 4 not used
dev dvMatrixInAll[]={dvMatrixIn01,dvMatrixIn02,dvMatrixIn03,dvMatrixIn04,dvMatrixIn05,dvMatrixIn06,dvMatrixIn07,dvMatrixIn08,
		     dvMatrixIn09,dvMatrixIn10,dvMatrixIn11,dvMatrixIn12,dvMatrixIn13,dvMatrixIn14,dvMatrixIn15,dvMatrixIn16}
LONG nTimeFeedbackQry[1]={50}    //Feedback query
LONG nTimeDisplayQry[1]={1000}  //Decoder query 
INTEGER nProjMuteWait=5 
INTEGER nProjInputWait=120 

char    cServerAddress[]={'10.160.208.74'} // IP Address of the BSS
char    cExterityIP[]={'10.160.204.20'}   // 
char    cCodecIPAddress[]={'10.160.90.19'}   // 
char    cCodecUsername[]={'amx'}   // 
char    cCodecPassword[]={'amxcontrol123'}   // 

char    cPowerConditionerIPAddress[]={'10.160.208.76'}   // 
char    cPowerConditionerUsername[]={'admin'}   // 
char    cPowerConditionerPassword[]={'admin'}   // 


/*
CHAR NEC_Power_ON[]={01,$30,$41,$30,$41,$30,$43,$02,$43,$32,$30,$33,$44,$36,$30,$30,$30,$31,$03,$73,$0d}
CHAR NEC_Power_OFF[]={01,$30,$41,$30,$41,$30,$43,$02,$43,$32,$30,$33,$44,$36,$30,$30,$30,$34,$03,$76,$0d}
CHAR NEC_Input_Source_Select_HDMI[]={01,$30,$41,$30,$45,$30,$41,$02,$30,$30,$36,$30,$30,$30,$31,$31,$03,$72,$0d}
CHAR NEC_GET_POWER_STATUS[]= {$01,$30,$2A,$30,$41,$30,$36,$02,$30,$31,$44,$36,$03,$1F,$0D}
*/
      

//VID INPUTS MATCH ENOVA INPUTS

INTEGER SRC_CODEC_FAR_END           = 01
INTEGER SRC_CODEC_CONTENT           = 02
INTEGER SRC_IPTV                    = 03
INTEGER SRC_NORTH_FBOX_VGA          = 04
INTEGER SRC_NORTH_FBOX_HDMI         = 09
INTEGER SRC_HEAD_TBL_VGA            = 05
INTEGER SRC_HEAD_TBL_HDMI           = 10
INTEGER SRC_SOUTH_FBOX_VGA          = 06
INTEGER SRC_SOUTH_FBOX_HDMI         = 11
INTEGER SRC_LECTERN_VGA             = 07
INTEGER SRC_LECTERN_HDMI            = 12

//AUD
INTEGER SRC_VID_CONF_AUD            = 17
INTEGER SRC_MIC_1                   = 18
INTEGER SRC_MIC_2                   = 19
INTEGER SRC_MIC_3                   = 20
INTEGER SRC_POWER_OFF               = 25
INTEGER SRC_MUTE_ALL                = 27
INTEGER SRC_NO_CONTENT              = 28


//bss
CHAR DSP_COMBINE[] =            {$FF,$FF,$FF,$FF,$FF,$FF}; 
CHAR DSP_VC_GAIN[] =            {$00,$0A,$03,$00,$01,$0C}; // 000A0300010C
CHAR DSP_MICS_TO_VC_GAIN[] =    {$FF,$FF,$FF,$FF,$FF,$FF};
CHAR DSP_ROUTER[] =             {$FF,$FF,$FF,$FF,$FF,$FF}; 
CHAR DSP_AUTOMIX[] =            {$00,$0A,$03,$00,$01,$04};   //000A03000104  000A03000106
CHAR DSP_CONTENT_TO_VC_GAIN[] = {$FF,$FF,$FF,$FF,$FF,$FF};
CHAR DSP_PROGRAM_GAIN[]       = {$00,$0A,$03,$00,$01,$0D};  
CHAR DSP_CEILING_MIC_GAIN[]   = {$FF,$FF,$FF,$FF,$FF,$FF};
CHAR DSP_AUTOMIX_CONF[]       = {$00,$0A,$03,$00,$01,$06};   //000A03000106
 
INTEGER GAIN_STEP_PER = 1; //GAIN STEP IF USING SET_GAIN_PERCENT
INTEGER MAX_RAMPGAIN_PER = 100; //THESE ARE VALUES USING SUBSCRIBE%
INTEGER MIN_RAMPGAIN_PER = 0;

CHAR EXTERITY_PREFIX[] =  	{'^send:rm_'}
CHAR EXTERITY_SUFFIX[] = 	{'!',$0D}
CHAR EXTERITY_0[] = 		{'0'}
CHAR EXTERITY_1[] = 		{'1'}
CHAR EXTERITY_2[] = 		{'2'}
CHAR EXTERITY_3[] = 		{'3'}
CHAR EXTERITY_4[] = 		{'4'}
CHAR EXTERITY_5[] = 		{'5'}
CHAR EXTERITY_6[] = 		{'6'}
CHAR EXTERITY_7[] = 		{'7'}
CHAR EXTERITY_8[] = 		{'8'}
CHAR EXTERITY_9[] = 		{'9'}
CHAR EXTERITY_ENTER[] = 	{'enter'}
CHAR EXTERITY_LEFT[] = 		{'left'}
CHAR EXTERITY_right[] = 	{'right'}
CHAR EXTERITY_up[] = 		{'up'}
CHAR EXTERITY_down[] = 		{'down'}
CHAR EXTERITY_pause[] = 	{'pause'}
CHAR EXTERITY_menu[] = 		{'menu'}
CHAR EXTERITY_cancel[] = 	{'cancel'}
CHAR EXTERITY_exterity[] = 	{'exterity'}
CHAR EXTERITY_red[] = 		{'red'}
CHAR EXTERITY_green[] = 	{'green'}
CHAR EXTERITY_yellow[] = 	{'yellow'}
CHAR EXTERITY_blue[] = 		{'blue'}
CHAR EXTERITY_power[] = 	{'power'}
CHAR EXTERITY_rewind[] = 	{'rewind'}
CHAR EXTERITY_stop[] = 		{'stop'}
CHAR EXTERITY_play[] = 		{'play'}
CHAR EXTERITY_record[] = 	{'record'}
CHAR EXTERITY_ff[] = 		{'ff'}
CHAR EXTERITY_skipback[]    = 	{'skipback'}
CHAR EXTERITY_skipforward[] = 	{'skipforward'}
CHAR EXTERITY_chup[] = 		{'chup'}
CHAR EXTERITY_chdown[] = 	{'chdown'}
CHAR EXTERITY_volup[] = 	{'volup'}
CHAR EXTERITY_voldown[] = 	{'voldown'}
CHAR EXTERITY_mute[] = 		{'mute'}
CHAR EXTERITY_guide[] = 	{'guide'}
CHAR EXTERITY_tv[] = 		{'tv'}
CHAR EXTERITY_home[] = 		{'home'}
CHAR EXTERITY_info[] = 		{'info'}
CHAR EXTERITY_subtitle[] = 	{'subtitle'}
CHAR EXTERITY_audio[] = 	{'audio'}

CHAR CODEC_audio_test[] = 	{'xCommand Audio SpeakerCheck'}


(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE
//dev dvTPLastSet[]={vdvTPDummy,vdvTPDummy,vdvTPDummy}

volatile integer nLastPanel
persistent integer nSourceRouted[16]
integer nSourceRoutedTemp[16]    //holds audio temp val
integer nSourceRoutedSDX
volatile integer nDisplayInput[6]
volatile integer nDisplayMute[6]
volatile integer nSwitcherOnline
volatile integer nDisplayPower[6]

volatile integer nNavVidRoutePage[3]
volatile integer nNavAudRoutePage[3]

integer nAudSourceRouted[6]

INTEGER MASTEROUT_VOL[50]; //KEEP TRACK OF MASTEROUT VOLUME
CHAR cSourceNames[50][50]

persistent integer nCombinedMode

volatile integer nIPPortConnected[50]

volatile integer nVTC_Online
volatile integer nVTC_Initialized
volatile integer nVTC_Standby_State
volatile integer nVTC_Call_State



LONG REPEAT_TIME[1];//TIMELINE
LONG CHECK_REPEAT_TIME[1]

INTEGER RAMP_GAIN_PER; //RAMP_GAIN IN PERCENT <0-100>

INTEGER resubscribe = 0;
INTEGER SUBSCRIBED = 0;

PERSISTENT integer nDSP_Router[2][3]
PERSISTENT integer nDSP_Partitions[2]
PERSISTENT integer nDSP_Partitions_Old[2]
VOLATILE integer nDSP_Connected

persistent char cContactInfo[300]
PERSISTENT integer nInitialized

VOLATILE integer nTabSelected[1]

persistent integer nDSP_tbl_mic_mute

integer nAutoShutdownFlag

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

#INCLUDE 'BSS_Soundweb_London.axi'
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)



DEFINE_FUNCTION integer           DSP_GET_LEVEL_FBNUM(integer nInput,integer nMixerNum, char cHiQAddr[], integer nFaderNum)
{
    select {
	active(nMixerNum==2) : {
	    cHiQAddr=DSP_VC_GAIN
	    nFaderNum=4
	    return (nInput*2-1)+6
	} active(nMixerNum==3) : {
	    cHiQAddr=DSP_MICS_TO_VC_GAIN
	    nFaderNum=5
	    return (nInput*2-1)+8
	} active(nMixerNum==4) : {
	    cHiQAddr=DSP_AUTOMIX
	    nFaderNum=nInput+5
	    return (nInput*2-1)+18
	} active(nMixerNum==5) : {
	    cHiQAddr=DSP_PROGRAM_GAIN
	    nFaderNum=9
	    return (nInput*2-1)+25
	} active(nMixerNum==6) : {
	    cHiQAddr=DSP_CEILING_MIC_GAIN
	    nFaderNum=10
	    return (nInput*2-1)+28
	}
    }
}

DEFINE_FUNCTION integer           NAV_populate_menu_bar(dev dvTP) {
    send_command dvTP,"'^SHD-41,Menu 01-Set Combine Mode'"
    send_command dvTP,"'^SHD-41,Menu 02-Video Selection'"
    send_command dvTP,"'^SHD-41,Menu 03-Select VC Content'"
    send_command dvTP,"'^SHD-41,Menu 04-Select Audio'"
    send_command dvTP,"'^SHD-41,Menu 05-More Settings'"
    send_command dvTP,"'^SHD-41,Menu 06-IPTV'"
    send_command dvTP,"'^SHD-41,Menu 07-Lights'"
    send_command dvTP,"'^SHD-41,Menu 08-Shades'"
    send_command dvTP,"'^SHD-41,Menu 09-Display & Screen Control'"
    send_command dvTP,"'^SHD-41,Menu 10-Help'"
    
    //send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,00,0'"
    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,01,0'"
    send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
    send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
    send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
}

DEFINE_FUNCTION integer           NAV_populate_sources(dev dvTP) {
    local_var integer x
    local_var integer y
    for(x=100;x<=600;x=x+100) {
	for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),    	',00,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END),	',02,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT),	',03,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),           	',04,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_NORTH_FBOX_HDMI),	',05,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_NORTH_FBOX_VGA), 	',06,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_HEAD_TBL_HDMI),	',07,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_HEAD_TBL_VGA), 	',08,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_SOUTH_FBOX_HDMI),	',09,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_SOUTH_FBOX_VGA), 	',10,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_LECTERN_HDMI),	',11,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_LECTERN_VGA), 	',12,10'"
    }
    for(x=700;x<=900;x=x+100) {
	for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),       ',00,10'"  //mute all 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD),   ',01,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),           ',02,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),          ',03,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),          ',04,10'"
	//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),          ',05,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_NORTH_FBOX_HDMI),',06,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_NORTH_FBOX_VGA), ',07,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_HEAD_TBL_HDMI),  ',08,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_HEAD_TBL_VGA),   ',09,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_SOUTH_FBOX_HDMI),',10,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_SOUTH_FBOX_VGA), ',11,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_LECTERN_HDMI),   ',12,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_LECTERN_VGA),    ',13,10'"
    } 
    for(x=1000;x<=1000;x=x+100) {
	for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),      ',00,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),            ',04,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NORTH_FBOX_HDMI), ',05,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NORTH_FBOX_VGA),  ',06,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_HEAD_TBL_HDMI),   ',07,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_HEAD_TBL_VGA),    ',08,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_SOUTH_FBOX_HDMI), ',09,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_SOUTH_FBOX_VGA),  ',10,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_LECTERN_HDMI),    ',11,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_LECTERN_VGA),     ',12,10'"
    }
}

DEFINE_FUNCTION                   NAV_populate_display_page(dev dvTP) {
    send_command dvTP,"'^SHD-1101,Displays-Room 137'"
    send_command dvTP,"'^SHD-1101,Displays-Room 138'"
    send_command dvTP,"'^SHD-1101,Displays-Room 139'"
    select {
	active(nCombinedMode==1) : { //AB
	    select {
		active(dvTP.NUMBER==10001 or dvTP.Number==10002) : {
		    send_command dvTP,"'^SSH-1101,Displays-Room 137,01,0'"
		    send_command dvTP,"'^SSH-1101,Displays-Room 138,02,0'"
		} active(dvTP.NUMBER==10003) : {
		    send_command dvTP,"'^SSH-1101,Displays-Room 139,03,0'"
		}
	    }
	} active(nCombinedMode==2) : { //BC
	    select {
		active(dvTP.NUMBER==10002 or dvTP.NUMBER==10003) : {
		    send_command dvTP,"'^SSH-1101,Displays-Room 138,02,0'"
		    send_command dvTP,"'^SSH-1101,Displays-Room 139,03,0'"
		} active(dvTP.NUMBER==10001) : {
		    send_command dvTP,"'^SSH-1101,Displays-Room 137,01,0'"
		}
	    }
	} active(nCombinedMode==3) : { //All Combine
	    send_command dvTP,"'^SSH-1101,Displays-Room 137,01,0'"
	    send_command dvTP,"'^SSH-1101,Displays-Room 138,02,0'"
	    send_command dvTP,"'^SSH-1101,Displays-Room 139,03,0'"
	} active(nCombinedMode==4) : { //Separated
	    select {
		active(dvTP.NUMBER==10001) : send_command dvTP,"'^SSH-1101,Displays-Room 137,01,0'"
		active(dvTP.NUMBER==10002) : send_command dvTP,"'^SSH-1101,Displays-Room 138,02,0'"
		active(dvTP.NUMBER==10003) : send_command dvTP,"'^SSH-1101,Displays-Room 139,03,0'"
	    }
	}
    }
}

define_function char[200]         NAV_replaceLineFeed(char textString[200]) {  //we need a linefeed for the vartext on display buttons, 
								   //it wont fit on vartext 1, so we remove it
    stack_var integer x
    stack_var char newTextString[200]
    newTextString=textString
    for (x=1;x<200;x++) {
	if (newTextString[x]==$0A) newTextString[x]=' '
    }
    return newTextString
}

DEFINE_FUNCTION                   NAV_select_vid_page() {
    send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
    send_command dvTPAll[nLastPanel],"'@PPX'"
    send_command dvTPAll[nLastPanel],"'PPON-0205 Select Video Combined'"
    nTabSelected[1]=3
    select {
	active(nCombinedMode==1 and nLastPanel<3) :  send_command dvTPAll[nLastPanel],"'PPON-0203 Select Video AB'"
	active(nCombinedMode==1 and nLastPanel>2) :  send_command dvTPAll[nLastPanel],"'PPON-0208 Select Video C'"
	active(nCombinedMode==2 and nLastPanel<2) :  send_command dvTPAll[nLastPanel],"'PPON-0206 Select Video A'"
	active(nCombinedMode==2 and nLastPanel>1) :  send_command dvTPAll[nLastPanel],"'PPON-0204 Select Video BC'"
	active(nCombinedMode==3) :                   send_command dvTPAll[nLastPanel],"'PPON-0205 Select Video Combined'"
	active(nCombinedMode==4 and nLastPanel==1) : send_command dvTPAll[nLastPanel],"'PPON-0206 Select Video A'"
	active(nCombinedMode==4 and nLastPanel==2) : send_command dvTPAll[nLastPanel],"'PPON-0207 Select Video B'"
	active(nCombinedMode==4 and nLastPanel==3) : send_command dvTPAll[nLastPanel],"'PPON-0208 Select Video C'"
    }
}

DEFINE_FUNCTION                   SUBSCRIBE_ALL()
{
    local_var integer I
    local_var integer J
    subscribed = 1;
    CALL 'SUBSCRIBE%'(DSP_COMBINE,ROOM_COMBINE,1,0,SOURCE_GAIN)//FB[1][12]
    CALL 'SUBSCRIBE'(DSP_COMBINE,ROOM_COMBINE,1,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_COMBINE,ROOM_COMBINE,2,0,SOURCE_GAIN)
    CALL 'SUBSCRIBE'(DSP_COMBINE,ROOM_COMBINE,2,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_COMBINE,ROOM_COMBINE,3,0,SOURCE_GAIN)
    CALL 'SUBSCRIBE'(DSP_COMBINE,ROOM_COMBINE,3,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_VC_GAIN,N_GAIN,0,1,GAIN)
    CALL 'SUBSCRIBE'(DSP_VC_GAIN,N_GAIN,0,1,MUTE)
    CALL 'SUBSCRIBE%'(DSP_MICS_TO_VC_GAIN,GAIN,1,0,GAIN)
    CALL 'SUBSCRIBE'(DSP_MICS_TO_VC_GAIN,GAIN,1,0,MUTE)      ////FB[10]
    
    FOR(I=1;I<=3;I++) //FB[11-16] MATRIX ROUTER
    {
	FOR(J=1;J<=2;J++)
	{
	    CALL 'SUBSCRIBE'(DSP_ROUTER,ROUTER,J,I,ROUTE) 
	}
    }
    CALL 'SUBSCRIBE'(DSP_COMBINE,ROOM_COMBINE,1,0,PARTITION)//FB[17][12]	//PARTITION #1
    CALL 'SUBSCRIBE'(DSP_COMBINE,ROOM_COMBINE,2,0,PARTITION)//FB[18][12]	//PARTITION #2
    
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,1,0,GAIN)//FB[19]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,1,0,MUTE) 
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,2,0,GAIN)//FB[21]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,2,0,MUTE) 
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,3,0,GAIN)//FB[23]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,3,0,MUTE) 
    
    CALL 'SUBSCRIBE' (DSP_AUTOMIX_CONF,AUTOMIXER,1,0,MUTE) // 25
    CALL 'SUBSCRIBE' (DSP_AUTOMIX_CONF,AUTOMIXER,2,0,MUTE) // 26

    CALL 'SUBSCRIBE' (DSP_CONTENT_TO_VC_GAIN,GAIN,1,0,MUTE) ///FB[25]
    CALL 'SUBSCRIBE%'(DSP_PROGRAM_GAIN,N_GAIN,0,1,GAIN) //FB[26]
    CALL 'SUBSCRIBE' (DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE) ///FB[27]
    CALL 'SUBSCRIBE' (DSP_PROGRAM_GAIN,GAIN,1,0,MUTE) ///FB[28]

}


(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
cSourceNames[01]="'Video Conference'"      
cSourceNames[02]="'Content'"      
cSourceNames[03]="'IPTV'"                             
cSourceNames[04]="'Window',$0A,'Table VGA'"      
cSourceNames[05]="'Wall',$0A,'Table VGA'" 
cSourceNames[06]="'Rear',$0A,'Table VGA'" 
cSourceNames[07]="'Lectern',$0A,'VGA'" 
cSourceNames[09]="'Window',$0A,'Table HDMI'"  
cSourceNames[10]="'Rear',$0A,'Table HDMI'"      
cSourceNames[11]="'Wall',$0A,'Table HDMI'"   
cSourceNames[12]="'Lectern',$0A,'HDMI'"   
cSourceNames[17]="'Video',$0A,'Conference'"           
cSourceNames[18]="'Lapel',$0A,'Mic'"             
cSourceNames[19]="'Handheld',$0A,'Mic'"             
cSourceNames[20]="'Wireless',$0A,'Mic 3'"             
cSourceNames[25]="'Power Off'"                                            
cSourceNames[27]="'Mute All'"                         
cSourceNames[28]="'No Content'"                       


TIMELINE_CREATE(1,nTimeFeedbackQry,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //TV power query timeline
TIMELINE_CREATE(2,nTimeDisplayQry,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //TV power query timeline

//BSS
REPEAT_TIME[1] = 300; //300ms TO UPDATE FEEDBACK
CHECK_REPEAT_TIME[1] = 5000; //check to see if we are connected every 5 seconds
TIMELINE_CREATE(3, REPEAT_TIME, 1, TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//FEEDBACK TIMELINE;
TIMELINE_CREATE(4,CHECK_REPEAT_TIME, 1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//Resubscribe timeline. 


IF(nInitialized==0) cContactInfo="'Use Button below to change Custom Help Message...'"
nInitialized=1

nCombinedMode = 3

DEFINE_MODULE 'NEC_E905_Comm_dr1_0_0' comm(vdvRX1, dvCom1)
DEFINE_MODULE 'NEC_E905_Comm_dr1_0_0' comm(vdvRX2, dvCom2)
//#warn 'vc module disabled for quick load'
DEFINE_MODULE 'Cisco_SX80_CE_Comm_dr1_0_0' comm(vdvCiscoSX80, dvCiscoSX80)
DEFINE_MODULE  'Surgex_iControl2_dr1_0_0'  modPowerController(vdvPowerController, dvPowerController);

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

LEVEL_EVENT[dvMatrixOutAll,50] {
    local_var integer nLastOut
    nLastOut=get_last(dvMatrixOutAll)
    nSourceRouted[nLastOut]=level.value
    if(nLastOut==6) send_command dvTpAll,"'^txt-32,0,',cSourceNames[level.value]"
}

TIMELINE_EVENT[1]//Feedback timeline
{
    local_var integer nCount
    local_var integer x
    local_var integer nTest
    for(nCount=1;nCount<=2;nCount++) {}
    
    for(x=1;x<=8;x++) [dvTp1,x]=nTabSelected[1]==x

    for(x=101;x<=115;x++) [dvTpAll,x]=(nSourceRouted[1]==x-100 and ([vdvRX1,255] and ![vdvRX1,254])) //power on and not cooling
    [dvTpAll,125]=![vdvRX1,255] or [vdvRX1,254]  //power off or cooling
    for(x=201;x<=215;x++) [dvTpAll,x]=(nSourceRouted[2]==x-200 and ([vdvRX2,255] and ![vdvRX2,254])) //power on and not cooling
    [dvTpAll,225]=![vdvRX2,255] or [vdvRX2,254]  //power off or cooling
   
    
    for(x=1003;x<=1013;x++) [dvTpAll,x]=(nSourceRouted[5]==x-1000)
    [dvTPAll,1028]=nSourceRouted[5]==0   //and FB[08][12])
    [dvTPAll,1128]=nDSP_tbl_mic_mute
    [dvTPAll,1401]=![vdvRX1,255] or [vdvRX1,254]
    [dvTPAll,1402]=![vdvRX2,255] or [vdvRX1,254]
    [dvTPAll,1411]=[vdvRX1,255] and ![vdvRX1,254]
    [dvTPAll,1412]=[vdvRX2,255] and ![vdvRX2,254]
    
    for(nCount=1;nCount<=5;nCount++) {
	[dvTPAll,1520+nCount]=nSourceRoutedSDX==nCount
    }
    
    [dvTPAll,1601]=[vdvCiscoSX80,146]
    
    nVTC_Online = [vdvCiscoSX80, 251]
    nVTC_Initialized = [vdvCiscoSX80, 252]
    nVTC_Standby_State = [vdvCiscoSX80, 255]
    nVTC_Call_State = [vdvCiscoSX80, 238]
    
    // auto shutdown if current time matches auto shutdown time
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE))
    {
	if(!nAutoShutdownFlag)	// check flag to make sure it only fires once
	{
	    do_push(dvTP1,17)
	    nAutoShutdownFlag = 1
	}
    }
    // reset auto shutdown flag after a minute
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE + 1))
    {
	nAutoShutdownFlag = 0
    }
}

TIMELINE_EVENT[2]//Display status timeline - 
{
    /*local_var integer n
    for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_STATUS
    wait 3 for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_INPUT_STATUS
    wait 6 for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_MUTE_STATUS
    */
}

TIMELINE_EVENT[3]//BSS FEEDBACK TIMELINE
{
    //FOR ALL DISCRETE SV'S (MUTES, ROUTES, ETC) THE 12TH BYTE <FB[][12]> HOLDS THE ZERO OR ONE (MUTE OR UNMUTE) STATE OF STATE VARIABLE
    //FOR ALL GAIN% SV'S THE 10TH BYTE <FB[][10]> WILL HOLD THE VALUE OF THE FADER IN PERCENT <0-100>. THE 11TH AND 12TH ELEMENT IS THE FRACTIONAL (DECIMAL) VALUE (IE 67.003%) USED ONLY FOR ROUNDING TO THE NEAREST INTEGER FOR THIS SAMPLE PROGAM. THE PROGRAMMER CAN MODIFY TO USE THIS EXTRA RESOLUTION IF DESIRED
    //SEE HELP FILE FOR COMPLETE FB[][] STRUCTURE
    
    /*MASTEROUT_VOL[01] = TYPE_CAST(MID_STRING(FB[01],10,1)); //FB[01] IS THE POSITION IN STARTUP THAT I SUBSCRIBED TO
    SEND_LEVEL dvTPAll,01,MASTEROUT_VOL[01];
    [dvTPAll,1103] = FB[02][12];//ROOM_COMBINE SOURCE_MUTE
    MASTEROUT_VOL[02] = TYPE_CAST(MID_STRING(FB[03],10,1)); 
    SEND_LEVEL dvTPAll,02,MASTEROUT_VOL[02];
    [dvTPAll,1106] = FB[04][12];//ROOM_COMBINE SOURCE_MUTE
    MASTEROUT_VOL[03] = TYPE_CAST(MID_STRING(FB[05],10,1)); 
    SEND_LEVEL dvTPAll,03,MASTEROUT_VOL[03];
    [dvTPAll,1109] = FB[06][12];//ROOM_COMBINE SOURCE_MUTE
    */
    MASTEROUT_VOL[04] = TYPE_CAST(MID_STRING(FB[07],10,1)); //vc gain
    SEND_LEVEL dvTPAll,04,MASTEROUT_VOL[04];
    [dvTPAll,1112] = FB[08][12];//VC GAIN MUTE
    MASTEROUT_VOL[05] = TYPE_CAST(MID_STRING(FB[09],10,1)); //mics to vc gain.
    SEND_LEVEL dvTPAll,05,MASTEROUT_VOL[05];
    [dvTPAll,1115] = FB[10][12];//MICS TO VC
    
    MASTEROUT_VOL[06] = TYPE_CAST(MID_STRING(FB[19],10,1)); //mic 1
    SEND_LEVEL dvTPAll,06,MASTEROUT_VOL[06];
    [dvTPAll,1118] = FB[20][12];
    MASTEROUT_VOL[07] = TYPE_CAST(MID_STRING(FB[21],10,1)); //mic 2
    SEND_LEVEL dvTPAll,07,MASTEROUT_VOL[07];
    [dvTPAll,1121] = FB[22][12];
    MASTEROUT_VOL[08] = TYPE_CAST(MID_STRING(FB[23],10,1)); //mic 3
    SEND_LEVEL dvTPAll,08,MASTEROUT_VOL[08];
    [dvTPAll,1124] = FB[24][12];
    //fb[25][12] not used(program audio to codec)
    MASTEROUT_VOL[09] = TYPE_CAST(MID_STRING(FB[26],10,1)); //program vol
    SEND_LEVEL dvTPAll,09,MASTEROUT_VOL[09];
    [dvTPAll,1127] = FB[27][12];
    [dvTPAll,1130] = FB[28][12];
}

TIMELINE_EVENT[4]//BSS SUBSCRIBE TIMELINE
{
    SEND_STRING dvSOUNDWEB,"STX,ETX"// this command will only work for a serial connection.
    if(!SIX_RECEIVED)
    {
	if(subscribed)
	    resubscribe = 1;
    }
    else
    {
	SIX_RECEIVED = 0
	if(resubscribe)
	{
	    resubscribe = 0
	    SUBSCRIBE_ALL()
	}
    }
}
DATA_EVENT   [dvSOUNDWEB]
{
    ONLINE:
    {	
	STARTUP = 1; //BEGIN LOGGING FEEDBACK VARIABLES:  THESE ARE THE ONLY VARIABLES 	
		    //THAT WILL BE COMPARED TO RECEIVED STRINGS FOR TRUE FEEDBACK
	T = 0; //initialization
      
	SUBSCRIBE_ALL();
      
      
	STARTUP = 0; //END LOGGING FEEDBACK VARIABLES


    }
}//DATA_EVENT
DATA_EVENT   [dvExterity] {
    online : nIPPortConnected[data.device.port]=1
    offline : {
	nIPPortConnected[data.device.port]=0
    }
    string : {
	send_string 0,data.text
	if(find_string(data.text,'login:',1)) {
	    send_string data.device,"'ctrl',$0D"
	}
	if(find_string(data.text,'Password:',1)) {
	    send_string data.device,"'labrador',$0D"
	}
    }
}


DATA_EVENT   [dvMatrixSDX] {
    online :  {
	#warn 'might want to disable 4K using Edid'
	SEND_COMMAND data.device,"'VIDIN_AUTO_SELECT-DISABLE'"
    } command : {
	local_var char cDataTxt[50]
	local_var char cTrash[50]
	local_var char c1
	local_var char c2
	local_var integer nMtxInput
	local_var integer nMtxOutput
	cTrash=REMOVE_STRING(data.text,"'SWITCH-LVIDEOI'",1)
	if(cTrash<>'') {
	    cDataTxt=data.text
	    c1=cDataTxt[2]
	    if(c1>=$30 and c1<=$39) 
		nMtxInput=atoi("cDataTxt[1],cDataTxt[2]")
	    else 
	        nMtxInput=atoi("cDataTxt[1]")
	    send_string 0,"cDataTxt[1]"
	    send_string 0,"cDataTxt[2]"
	    send_string 0,cDataTxt
	    cTrash=REMOVE_STRING(cDataTxt,"'O'",1)
	    if(length_string(cDataTxt)>1)
		nMtxOutput=atoi("cDataTxt[1],cDataTxt[2]")
	    else 
		nMtxOutput=atoi("cDataTxt[1]")
	    send_string 0,"cDataTxt[1]"
	    send_string 0,"cDataTxt[2]"
	    nSourceRoutedSDX=nMtxInput
	}
    }
}

DATA_EVENT   [dvMatrix] {
    online :  {
	integer i;
	
	for(i=1;i<=16;i++)
	{
	    send_command dvMatrixInAll[i], "'VIDIN_HDCP-DISABLE'";
	    send_command dvMatrixInAll[i], "'VIDIN_EDID-Wide-screen'";
	}
	SEND_COMMAND data.device,"'VIDIN_AUTO_SELECT-DISABLE'"
	nSwitcherOnline=1
    } 
    offline : nSwitcherOnline=0
    command : {
	local_var char cDataTxt[50]
	local_var char cTrash[50]
	local_var char c1
	local_var char c2
	local_var integer nMtxInput
	local_var integer nMtxOutput
	cTrash=REMOVE_STRING(data.text,"'SWITCH-LVIDEOI'",1)
	if(cTrash<>'') {
	    cDataTxt=data.text
	    c1=cDataTxt[2]
	    if(c1>=$30 and c1<=$39) 
		nMtxInput=atoi("cDataTxt[1],cDataTxt[2]")
	    else 
	        nMtxInput=atoi("cDataTxt[1]")
	    send_string 0,"cDataTxt[1]"
	    send_string 0,"cDataTxt[2]"
	    send_string 0,cDataTxt
	    cTrash=REMOVE_STRING(cDataTxt,"'O'",1)
	    if(length_string(cDataTxt)>1)
		nMtxOutput=atoi("cDataTxt[1],cDataTxt[2]")
	    else 
		nMtxOutput=atoi("cDataTxt[1]")
	    send_string 0,"cDataTxt[1]"
	    send_string 0,"cDataTxt[2]"
	    nSourceRouted[nMtxOutput]=nMtxInput
	    if(nMtxOutput==6) send_command dvTpAll,"'^txt-32,0,',cSourceNames[nMtxInput]"
	}
    }
}

DATA_EVENT   [dvTPALL] {
    online : {
	local_var integer x
	nLastPanel=get_last(dvTPAll)
	send_command data.device,"'ADBEEP'"
	for(x=1;x<=28;x++) {
	    send_command data.device,"'^txt-',itoa(x),',0,',cSourceNames[x]"    //source names
	}
	send_command data.device,"'PAGE-001 Splash'"
	send_level data.device,11,data.device.number-9999
	send_command data.device,"'^txt-32,0,',cSourceNames[nSourceRouted[06]]"
	send_command data.device,"'^txt-60,1,',cContactInfo"
	NAV_populate_menu_bar(data.device)
	NAV_populate_sources(data.device)
	NAV_populate_display_page(data.device)
	nTabSelected[1]=0
    } string : {
        local_var char cTrash[100]
	cTrash=REMOVE_STRING(data.text,"'KEYB-'",1)
	if(data.text<>'ABORT' and cTrash<>'') {
	    cContactInfo=data.text
	    send_command dvTPAll,"'^txt-60,1,',cContactInfo"
	}
    }
}

DATA_EVENT   [dvRXALL] {
    online : {
//	send_command data.device,'SET BAUD 9600,N,8,1 DISABLE 485'
    }
    string : {
	send_string 0,"'dxlink recvr data ',itoa(get_last(dvRXAll)),' ',data.text"
	/*select {
	    active(find_string(data.text,CHRISTIE_RESP_POWER_OFF,1))      : nDisplayPower[get_last(dvRXAll)]=0
	    active(find_string(data.text,CHRISTIE_RESP_POWER_COOLING,1))  : nDisplayPower[get_last(dvRXAll)]=0
	    active(find_string(data.text,CHRISTIE_RESP_POWER_ON,1))       : nDisplayPower[get_last(dvRXAll)]=1
	    active(find_string(data.text,CHRISTIE_RESP_POWER_WARMING,1))  : nDisplayPower[get_last(dvRXAll)]=1
	    active(find_string(data.text,CHRISTIE_RESP_MUTE_OFF,1))       : nDisplayMute[get_last(dvRXAll)]=0
	    active(find_string(data.text,CHRISTIE_RESP_MUTE_ON,1))        : nDisplayMute[get_last(dvRXAll)]=1
	    active(find_string(data.text,CHRISTIE_RESP_INPUT_HDMI,1))     : nDisplayInput[get_last(dvRXAll)]=0
	    active(find_string(data.text,CHRISTIE_RESP_INPUT_VGA,1))      : nDisplayInput[get_last(dvRXAll)]=1
	}*/
    }
}
DATA_EVENT   [vdvCiscoSX80]
{
    ONLINE:
    {
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-IP_Address,',cCodecIPAddress"
	//SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,23'" // TELNET PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,22'" // SSH PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-User_Name,',cCodecUserName" // 
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Password,',cCodecPassword" // 
	SEND_COMMAND vdvCiscoSX80,"'REINIT'"
	//SEND_COMMAND vdvCiscoSX80,"'debug-4'" // use only when debugging project.
    }
}

DATA_EVENT   [vdvPowerController]
{
	ONLINE:
	{
		IF (dvPowerController.NUMBER == 0)
		SEND_COMMAND vdvPowerController,"'PROPERTY,IP_Address,',cPowerConditionerIPAddress"
		SEND_COMMAND vdvPowerController,"'PROPERTY-User_Name,',cPowerConditionerUsername"
		SEND_COMMAND vdvPowerController,"'PROPERTY-Password,',cPowerConditionerPassword"
		SEND_COMMAND vdvPowerController,'REINIT'
	}
	COMMAND : {
	    local_var char cTrash[200]
	    cTrash=REMOVE_STRING(data.text,'UPSINPUTPROPERTY-ENERGY_USED,',1) 
	    if(cTrash<>'') send_command dvTPAll,"'^txt-61,0,Energy Used: ',data.text"
	}
	
}

CHANNEL_EVENT [vdvCiscoSX80,255] {
    on : {
	on[vdvRX1,255]
	on[vdvRX2,255]
	send_level dvMatrixOutAll[1],50,1  //route VC
	send_level dvMatrixOutAll[2],50,2  //route VC
	CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
	CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
    }
}


BUTTON_EVENT [dvTPAll,0] {
    push : {
	nLastPanel=1
	//dvTPLastSet[1]=dvTP1
	//dvTPLastSet[2]=vdvTPDummy
	//dvTPLastSet[3]=vdvTPDummy
    }
}

BUTTON_EVENT [dvTPAll,1]    //NAV - Begin (go to combine page)
{
PUSH: {
	//send_command dvTPAll[nLastPanel],"'PAGE-005 Blank'"
	//NAV_populate_menu_bar(dvTPAll[nLastPanel])
	//NAV_populate_sources(dvTPAll[nLastPanel])
	//NAV_populate_display_page(dvTPAll[nLastPanel])
	//send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	//send_command dvTPAll[nLastPanel],"'@PPX'"
	//send_command dvTPAll[nLastPanel],"'PPON-0201 View Combine Mode'"
    }
}



BUTTON_EVENT [dvTPAll,3] {  //NAV - Video Routing Page
    PUSH: nav_select_vid_page()
}



BUTTON_EVENT [dvTPAll,4] {  //NAV - VC Content Page
    PUSH: {
	nTabSelected[1]=4
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	send_command dvTPAll[nLastPanel],"'PPON-0209 Select VC Content'"
    }
}

BUTTON_EVENT [dvTPAll,5] {  //NAV - Audio Routing Page
    PUSH: {
	nTabSelected[1]=5
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
//	send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
	
	select {
	    active(nCombinedMode==1 and nLastPanel<3) :  send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
	    active(nCombinedMode==1 and nLastPanel>2) :  send_command dvTPAll[nLastPanel],"'PPON-0212 Select Audio Group 3'"
	    active(nCombinedMode==2 and nLastPanel<2) :  send_command dvTPAll[nLastPanel],"'PPON-0210 Select Audio Group 1'"
	    active(nCombinedMode==2 and nLastPanel>1) :  send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
	    active(nCombinedMode==3) :                   send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
	    active(nCombinedMode==4 and nLastPanel==1) : send_command dvTPAll[nLastPanel],"'PPON-0210 Select Audio Group 1'"
	    active(nCombinedMode==4 and nLastPanel==2) : send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
	    active(nCombinedMode==4 and nLastPanel==3) : send_command dvTPAll[nLastPanel],"'PPON-0212 Select Audio Group 3'"
	}
    }
}

BUTTON_EVENT [dvTPAll,6] {  //NAV - IPTV Page
    PUSH: {
	nTabSelected[1]=6
    }
}

BUTTON_EVENT [dvTPAll,7] {  //NAV - Display Power Page
    PUSH: {
	nTabSelected[1]=7
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	select {
	    active(nCombinedMode==1 and nLastPanel<3) :  send_command dvTPAll[nLastPanel],"'PPON-0701 Display Power AB'"
	    active(nCombinedMode==1 and nLastPanel>2) :  send_command dvTPAll[nLastPanel],"'PPON-0706 Display Power C'"
	    active(nCombinedMode==2 and nLastPanel<2) :  send_command dvTPAll[nLastPanel],"'PPON-0704 Display Power A'"
	    active(nCombinedMode==2 and nLastPanel>1) :  send_command dvTPAll[nLastPanel],"'PPON-0702 Display Power BC'"
	    active(nCombinedMode==3) :                   send_command dvTPAll[nLastPanel],"'PPON-0703 Display Power ABC'"
	    active(nCombinedMode==4 and nLastPanel==1) : send_command dvTPAll[nLastPanel],"'PPON-0704 Display Power A'"
	    active(nCombinedMode==4 and nLastPanel==2) : send_command dvTPAll[nLastPanel],"'PPON-0705 Display Power B'"
	    active(nCombinedMode==4 and nLastPanel==3) : send_command dvTPAll[nLastPanel],"'PPON-0706 Display Power C'"
	}
    }
}
BUTTON_EVENT [dvTPAll,8] {  //NAV - HELP PAGE
    PUSH: {
	nTabSelected[1]=8
	send_command vdvPowerController,'?UPSINPUTPROPERTY-ENERGY_USED'
    }
}




BUTTON_EVENT [dvTPAll,017] { //NAV - Shutdown
    PUSH: {
	nTabSelected[1]=0
	CALL 'SET_VAL'(DSP_VC_GAIN,N_GAIN,0,1,MUTE,1) 
	CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
	CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
	CALL 'SET_VAL'(DSP_AUTOMIX_CONF,AUTOMIXER,1,0,MUTE,1) 
	CALL 'SET_VAL'(DSP_AUTOMIX_CONF,AUTOMIXER,2,0,MUTE,1) 
//	CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1) 
//	CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1) 
//	CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,5,0,MUTE,1) 
	//CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN,GAIN,1,0,MUTE,1) 
	CALL 'SET_VAL'(DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE,1) 
	off[vdvRX1,255]
	off[vdvRX2,255]
	wait 60 {
	    off[vdvRX1,255]
	    off[vdvRX2,255]
	}
    }
}

BUTTON_EVENT [dvTPAll,020] { //NAV - Tech contact
    push : {
	send_command button.input.device,"'@AKB-',cContactInfo,';Please enter the help message here...'"
    }
}


BUTTON_EVENT [dvTPAll,051] { //audio confirm yes
    push : {
	NAV_select_vid_page()
	send_level dvMatrixOutAll[6],50,nSourceRoutedTemp[6]
	CALL 'SET_VAL'(DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE,0) 
	CALL 'SET_GAIN%'(DSP_PROGRAM_GAIN,N_GAIN,0,1,66)
    }
}

BUTTON_EVENT [dvTPAll,052] { //audio confirm no
    push : {
	NAV_select_vid_page()
    }
}

BUTTON_EVENT [dvTPAll,101]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,102]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,103]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,104]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,105]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,106]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,107]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,108]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,109]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,110]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,111]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,112]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,113]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,114]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,115] {//MATRIX ROUTE VIDEO
    PUSH: { //
	LOCAL_VAR INTEGER nOffset
	nOffSet=100
	send_string 0,"'route ',itoa(button.input.channel-100),' to 1'"
	send_level dvMatrixOutAll[1],50,button.input.channel-100
	on[vdvRX1,255]
	cancel_wait 'proj1input'
	wait nProjInputWait 'proj1input' send_command vdvRX1,"'INPUT-HDMI'"
	
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,N_GAIN,0,1,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,N_GAIN,0,1,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		if(nSourceRouted[6]<>button.input.channel-nOffset) {
		    nSourceRoutedTemp[6]=button.input.channel-nOffset
		    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
		    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[6]]),' in the Room Speakers?'"
		}
	    }
	}
    }
}
BUTTON_EVENT [dvTPAll,125] { //MATRIX POWER OFF
    PUSH: {
	send_string 0,"'proj 1 off'"
	off[vdvRx1,255]
	wait 50 off[vdvRx1,255]
    }
}

BUTTON_EVENT [dvTPAll,201]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,202]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,203]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,204]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,205]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,206]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,207]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,208]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,209]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,210]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,211]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,212]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,213]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,214]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,215]  //MATRIX ROUTE VIDEO
{
PUSH: //
    {
	local_var integer nOffset
	nOffset=200
	send_level dvMatrixOutAll[2],50,button.input.channel-200
	on[vdvRx2,255]
	cancel_wait 'proj2input'
	wait nProjInputWait 'proj2input' send_command vdvRx2,"'INPUT-HDMI'"
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,N_GAIN,0,1,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,N_GAIN,0,1,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		if(nSourceRouted[6]<>button.input.channel-nOffset) {
		    nSourceRoutedTemp[6]=button.input.channel-nOffset
		    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
		    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[6]]),' in the Room Speakers?'"
		}
	    }
	}
    }
}
BUTTON_EVENT [dvTPAll,225]  //MATRIX POWER OFF
{
PUSH: //
    {
	send_string 0,"'proj 2 off'"
	off[vdvRx2,255]
	wait 50 off[vdvRx2,255]
    }
}


BUTTON_EVENT [dvTPAll,801]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,802]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,803]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,804]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,805]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,806]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,807]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,808]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,809]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,810]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,811]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,812]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,813]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,814]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,815]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,816]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,817]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,818]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,819]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,820]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,821]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,822]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,823]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,824]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,825]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,826]    //MATRIX ROUTE AUDIO  -  Group 2 
BUTTON_EVENT [dvTPAll,827]  { //MATRIX ROUTE AUDIO  -  Group 2 
    push : {
	select {
	    active(button.input.channel-800==SRC_MUTE_ALL) : {
		CALL 'SET_VAL'(DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE,1) 
		CALL 'SET_VAL'(DSP_VC_GAIN,N_GAIN,0,1,MUTE,1) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
		CALL 'SET_VAL'(DSP_AUTOMIX_CONF,AUTOMIXER,1,0,MUTE,1) 
		CALL 'SET_VAL'(DSP_AUTOMIX_CONF,AUTOMIXER,2,0,MUTE,1) 
	    } active(button.input.channel-800>=SRC_MIC_1 and button.input.channel-800<=SRC_MIC_3) : {
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,button.input.channel-817,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_AUTOMIX,AUTOMIXER,button.input.channel-817,0,66)
	    } active(button.input.channel-800==SRC_VID_CONF_AUD) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,N_GAIN,0,1,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,N_GAIN,0,1,66)
	    } active(1) : {
		send_level dvMatrixOutAll[6],50,button.input.channel-800
		CALL 'SET_VAL'(DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_PROGRAM_GAIN,N_GAIN,0,1,66)
	    }
	}
    }
}



BUTTON_EVENT [dvTPAll,1003] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1004] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1005] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1006] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1007] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1008] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1009] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1010] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1011] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1012] 	//Select VC Content
BUTTON_EVENT [dvTPAll,1013] { 	//Select VC Content
    push : {
	send_level dvMatrixOutAll[5],50,button.input.channel-1000  //send video to Codec (DVI)
	send_level dvMatrixOutAll[6],50,button.input.channel-1000  //must also change program audio because no audio de-embedder was used on output 5
	CALL 'SET_VAL'  (DSP_CONTENT_TO_VC_GAIN,GAIN,1,0,MUTE,0)   //unmute audio to codec
	CALL 'SET_VAL'  (DSP_PROGRAM_GAIN,N_GAIN,0,1,MUTE,0)         //UNMUTE audio heard locally
	CALL 'SET_GAIN%'(DSP_PROGRAM_GAIN,N_GAIN,0,1,66)             //set normal volume locally
    	//send_command vdvCiscoSX80,"'PASSTHRU-xcommand UserInterface Presentation ExternalSource Remove SourceIdentifier: AMX'"
	#warn 'test this'
	//wait 3 send_command vdvCiscoSX80,"'PASSTHRU-xcommand UserInterface Presentation ExternalSource Add ConnectorId: 3 Name: ',$22,NAV_replaceLineFeed(cSourceNames[button.input.channel-1000]),$22,' SourceIdentifier: AMX Type: other'"
	//wait 3 send_command vdvCiscoSX80,"'PASSTHRU-xcommand UserInterface Presentation ExternalSource Add ConnectorId: 3 Name: ',$22,'AMX Content',$22,' SourceIdentifier: AMX Type: other'"
	//wait 7 send_command vdvCiscoSX80,"'PASSTHRU-xcommand UserInterface Presentation ExternalSource Select SourceIdentifier: AMX'"
    }
}
BUTTON_EVENT [dvTPAll,1028] { 	//Select VC Content None
    push : {
	send_level dvMatrixOutAll[5],50,0                          //stop video to codec
	CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN,GAIN,1,0,MUTE,1)     //stop audio to codec
	send_command vdvCiscoSX80,"'PASSTHRU-xcommand UserInterface Presentation ExternalSource RemoveAll'"
    }
}

BUTTON_EVENT [dvTPAll,1110]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
		//CALL 'SET_GAIN%'(WC_GAIN,GAIN,1,0,MASTEROUT_VOL)
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1111]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHIQAddr,nFader)
		
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1112]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,N_GAIN,0,1,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,N_GAIN,0,1,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1113]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1114]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1115]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,1) 
	}
    }
}





BUTTON_EVENT [dvTPAll,1116]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1117]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1118]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1119]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=2
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=2
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1120]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=2
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=2
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1121]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=2
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,0)
	
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1122]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=3
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=3
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1123]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=3
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=3
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1124]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=3
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,nInput,0,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1125]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	    }
    }
    HOLD[1,REPEAT]:
    {
    	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1126]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	}
    }
HOLD[1,REPEAT]:
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,N_GAIN,0,1,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1127]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,N_GAIN,0,1,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,N_GAIN,0,1,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1128]//GAIN - MUTE
{
PUSH:
    {
	local_var char cHIQAddr[20]
	cHIQAddr=DSP_AUTOMIX
	nDSP_tbl_mic_mute=!nDSP_tbl_mic_mute
	IF(nDSP_Tbl_Mic_Mute) {
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,3,0,MUTE,1)
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,4,0,MUTE,1)
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,5,0,MUTE,1)
	} ELSE {
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,3,0,MUTE,0) 
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,4,0,MUTE,0)
	    CALL 'SET_VAL'(cHIQAddr,AUTOMIXER,5,0,MUTE,0)
	}
    }
}

BUTTON_EVENT [dvTPAll,1130]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,6,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,1) 
	}
    }
}

BUTTON_EVENT [dvTPAll,1200]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1201]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1202]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1203]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1204]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1205]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1206]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1207]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1208]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1209]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1211]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1212]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1213]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1214]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1215]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1221]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1222]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1223]   //Exterity R9300 Receiver
BUTTON_EVENT [dvTPAll,1224] { //Exterity R9300 Receiver
    push : {
	local_var integer nChannel
	nChannel=button.input.channel-1200
	if(!nIPPortConnected[dvExterity.port]) IP_CLIENT_OPEN(dvExterity.port,cExterityIP,23,IP_TCP)
	cancel_wait 'exterity_wait' {
	    wait_until (nIPPortConnected[dvExterity.port]) 'exterity_wait' {
		select {
		    active(nChannel==00) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_0,EXTERITY_SUFFIX"
		    active(nChannel==01) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_1,EXTERITY_SUFFIX"
		    active(nChannel==02) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_2,EXTERITY_SUFFIX"
		    active(nChannel==03) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_3,EXTERITY_SUFFIX"
		    active(nChannel==04) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_4,EXTERITY_SUFFIX"
		    active(nChannel==05) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_5,EXTERITY_SUFFIX"
		    active(nChannel==06) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_6,EXTERITY_SUFFIX"
		    active(nChannel==07) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_7,EXTERITY_SUFFIX"
		    active(nChannel==08) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_8,EXTERITY_SUFFIX"
		    active(nChannel==09) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_9,EXTERITY_SUFFIX"
		    active(nChannel==11) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_UP,EXTERITY_SUFFIX"
		    active(nChannel==12) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_DOWN,EXTERITY_SUFFIX"
		    active(nChannel==13) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_LEFT,EXTERITY_SUFFIX"
		    active(nChannel==14) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_RIGHT,EXTERITY_SUFFIX"
		    active(nChannel==15) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_ENTER,EXTERITY_SUFFIX"
		    active(nChannel==21) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_CANCEL,EXTERITY_SUFFIX"
		    active(nChannel==22) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_GUIDE,EXTERITY_SUFFIX"
		    active(nChannel==23) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_CHUP,EXTERITY_SUFFIX"
		    active(nChannel==24) : send_string dvExterity,"EXTERITY_PREFIX,EXTERITY_chdown,EXTERITY_SUFFIX"
		}
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,1401]    //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1402] {  //Display Power Page - Off
    push : {
	local_var integer nTmpChan
	nTmpChan=button.input.channel-1400
	select {
	    active(nTmpChan==1) : {
		off[vdvRx1,255] 
		wait 50 off[vdvRx1,255]
	    }
	    active(nTmpChan==2) : {
		off[vdvRx2,255] 
		wait 50 off[vdvRx2,255]	    
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,1411]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1412] { //Display Power Page - On
    push : {
	local_var integer nTmpChan
	nTmpChan=button.input.channel-1410
	select {
	    active(nTmpChan==1) : {
		on[vdvRx1,255] 
		wait 50 on[vdvRx1,255]
	    }
	    active(nTmpChan==2) : {
		on[vdvRx2,255] 
		wait 50 on[vdvRx2,255]	    
	    }
	}
    }
}



BUTTON_EVENT [dvTPAll,1500] { //Display Power Page - All Off
    PUSH: {
	send_string 0,"'ALL PROJECTORS off'"
	off[vdvRx1,255] 
	off[vdvRx2,255] 
	wait 50 off[vdvRx1,255]
	wait 50 off[vdvRx2,255]
    }
}
BUTTON_EVENT [dvTPAll,1501] { //Display Power Page - All On
    PUSH: {
	send_string 0,"'ALL PROJECTORS oN'"
	on[vdvRx1,255] 
	on[vdvRx2,255] 
	wait 50 on[vdvRx1,255]
	wait 50 on[vdvRx2,255]
    }
}

BUTTON_EVENT [dvTPAll,1521]  //switcher
BUTTON_EVENT [dvTPAll,1522]  //switcher
BUTTON_EVENT [dvTPAll,1523]  //switcher
BUTTON_EVENT [dvTPAll,1524]  //switcher
BUTTON_EVENT [dvTPAll,1525]  //switcher
{
PUSH: 
    {
	SEND_COMMAND dvMatrixSDX, "'VI',itoa(button.input.channel-1520),'O1'"
    }
}

BUTTON_EVENT [dvTPAll,1601]   //CODEC - Toggle Mic Mute
{
PUSH: 
    {
	[vdvCiscoSX80,146]=![vdvCiscoSX80,146]
    }
}
(*****************************************************************)
(*                                                               *)
(*                      !!!! WARNING !!!!                        *)
(*                                                               *)
(* Due to differences in the underlying architecture of the      *)
(* X-Series masters, changing variables in the DEFINE_PROGRAM    *)
(* section of code can negatively impact program performance.    *)
(*                                                               *)
(* See “Differences in DEFINE_PROGRAM Program Execution” section *)
(* of the NX-Series Controllers WebConsole & Programming Guide   *)
(* for additional and alternate coding methodologies.            *)
(*****************************************************************)

DEFINE_PROGRAM

wait 200 if(!nIPPortConnected[dvExterity.port]) IP_CLIENT_OPEN(dvExterity.port,cExterityIP,23,IP_TCP)
	
	
(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)


