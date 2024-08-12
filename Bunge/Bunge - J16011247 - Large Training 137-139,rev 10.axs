PROGRAM_NAME='Bunge - J16011247 - Large Training 137-139 - PAG'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 08/14/2018  AT: 08:00:22        *)
(***********************************************************)
#warn 'this code should be loaded on system #137, system #137 must have system number #138 in the URL list (Diagnostics/URL Listing)'
#warn 'projectors need to be CHANGED to baud rate 38400 or control thru DXLINK Receiver will fail'
#warn 'no specification received for IPTV control.  Generic commands have been added and tested'  
#warn 'check that ctrl methods match drawing'
//***   EXAMPLE  OF ROOM COMBINING LOGIC  -  USE FOR NEW FUNCTIONALITY ***//
/*
BUTTON_EVENT [dvTPAll,0000] { //NAV - Shutdown
    PUSH: {
	select {
	    active(nCombinedMode==1) : { //AB
		select {
		    active(dvTP.NUMBER==10001 or dvTP.Number==10002) : {
		    } active(dvTP.NUMBER==10003) : {
		    }
		}
	    } active(nCombinedMode==2) : { //BC
		select {
		    active(dvTP.NUMBER==10002 or dvTP.NUMBER==10003) : {
		    } active(dvTP.NUMBER==10001) : {
		    }
		}
	    } active(nCombinedMode==3) : { //All Combine
	    } active(nCombinedMode==4) : { //Separated
		select {
		    active(dvTP.NUMBER==10001) : {
		    } active(dvTP.NUMBER==10002) : {
		    } active(dvTP.NUMBER==10003) : {
		    }
		}
	    }
	}
    }
}
*/
//***   USED FOR COPY AND PASTE ***//


DEFINE_DEVICE
dvMaster			= 0:01:0           //AMX NX-3200 Processor
dvSOUNDWEB			= 0:04:0           //BSS Blu-101 DSP
dvExterity			= 0:05:0           //Exterity AvediaPlayer R9300 Receiver    http://10.1.7.12   //Exterity r9300 default user:admin password:Labrador labrador
dvCiscoSX80_137		= 0:06:0           //Cisco SX80  //default username is admin, default password is blank
dvCiscoSX80_138		= 0:07:0           //Cisco SX80  //default username is admin, default password is blank
dvCiscoSX80_139		= 0:08:0           //Cisco SX80  //default username is admin, default password is blank
dvPowerController   = 0:09:0           //Surge X SX-AX20E

dvMatrixSDX         = 128:01:0   		//AMX SDX-514M-DX Switcher //this room doesn't use these

dvRelays2           = 129:01:0   		//AMX EXB-Relay 8

dvRelays1           = 5001:21:0     	 //AMX NX-3200 Processor Relays

dvMatrix            = 5002:01:138   	//Enova DGX1600 Switcher
//#warn ''
//dvMatrix			= 33002:01:0   		//Enova DGX1600 Switcher

dvMatrixOut01		= 5002:01:138   	//Enova DGX1600 Switcher
dvMatrixOut02		= 5002:02:138   	//Enova DGX1600 Switcher
dvMatrixOut03		= 5002:03:138   	//Enova DGX1600 Switcher
dvMatrixOut04		= 5002:04:138   	//Enova DGX1600 Switcher
dvMatrixOut05		= 5002:05:138   	//Enova DGX1600 Switcher
dvMatrixOut06		= 5002:06:138   	//Enova DGX1600 Switcher
dvMatrixOut07		= 5002:07:138   	//Enova DGX1600 Switcher
dvMatrixOut08		= 5002:08:138   	//Enova DGX1600 Switcher
dvMatrixOut09		= 5002:09:138   	//Enova DGX1600 Switcher
dvMatrixOut10		= 5002:10:138   	//Enova DGX1600 Switcher
dvMatrixOut11		= 5002:11:138   	//Enova DGX1600 Switcher
dvMatrixOut12		= 5002:12:138   	//Enova DGX1600 Switcher
dvMatrixOut13		= 5002:13:138   	//Enova DGX1600 Switcher
dvMatrixOut14		= 5002:14:138   	//Enova DGX1600 Switcher
dvMatrixOut15		= 5002:15:138   	//Enova DGX1600 Switcher
dvMatrixOut16		= 5002:16:138   	//Enova DGX1600 Switcher

dvMatrixIn01		= 5002:01:138   	//Enova DGX1600 Switcher
dvMatrixIn02		= 5002:02:138   	//Enova DGX1600 Switcher
dvMatrixIn03		= 5002:03:138   	//Enova DGX1600 Switcher
dvMatrixIn04		= 5002:04:138   	//Enova DGX1600 Switcher
dvMatrixIn05		= 5002:05:138   	//Enova DGX1600 Switcher
dvMatrixIn06		= 5002:06:138   	//Enova DGX1600 Switcher
dvMatrixIn07		= 5002:07:138   	//Enova DGX1600 Switcher
dvMatrixIn08		= 5002:08:138   	//Enova DGX1600 Switcher
dvMatrixIn09		= 5002:09:138   	//Enova DGX1600 Switcher
dvMatrixIn10		= 5002:10:138   	//Enova DGX1600 Switcher
dvMatrixIn11		= 5002:11:138   	//Enova DGX1600 Switcher
dvMatrixIn12		= 5002:12:138   	//Enova DGX1600 Switcher
dvMatrixIn13		= 5002:13:138   	//Enova DGX1600 Switcher
dvMatrixIn14		= 5002:14:138   	//Enova DGX1600 Switcher
dvMatrixIn15		= 5002:15:138   	//Enova DGX1600 Switcher
dvMatrixIn16		= 5002:16:138   	//Enova DGX1600 Switcher

dvTP1				= 10001:01:0		//MSD-1001i G4 Touchpanel	137
dvTP2				= 10002:01:0		//MSD-1001i G4 Touchpanel	138
dvTP3				= 10003:01:0		//MSD-1001i G4 Touchpanel	139

vdvTPDummy			= 33001:01:0		//Temporary empty touchpanel device

vdvCiscoSX80_137	= 41001:1:0			// The COMM module should use this as its duet device
vdvCiscoSX80_138	= 41002:1:0			// The COMM module should use this as its duet device
vdvCiscoSX80_139	= 41003:1:0			// The COMM module should use this as its duet device
vdvPowerController	= 41004:1:0			// The COMM module should use this as its duet device

//txs appear in 45001+ range
dvRX1				= 46001:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200
dvRX2				= 46002:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200
dvRX3				= 46003:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200
dvRX4				= 46004:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200
dvRX5				= 46005:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200
dvRX6				= 46006:01:138		//DXLink 4K HDMI Receiver Module  //christie projector - DHD700 GS  - baud rate 19200


(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

// Shutdown at 21:00 (9 PM)
INTEGER SHUTDOWN_HOUR = 21
INTEGER SHUTDOWN_MINUTE = 0

dev dvTPAll[]={dvTP1,dvTP2,dvTP3}

RM_137_W=1
RM_137_N=2
RM_138_N=3
RM_138_E=4
RM_139_L=5
RM_139_R=6


dev dvRXAll[]={dvRX5,dvRX1,dvRX2,dvRX6,dvRX3,dvRX4}
//dev dvRXAll[]={dvRX1,dvRX2,dvRX3,dvRX4,dvRX5,dvRX6}

dev dvMatrixOutAll[] = 
	{dvMatrixOut05,dvMatrixOut01,dvMatrixOut02,dvMatrixOut06,dvMatrixOut03,dvMatrixOut04,
	dvMatrixOut07,dvMatrixOut08,dvMatrixOut09,dvMatrixOut10,dvMatrixOut11,dvMatrixOut12,dvMatrixOut13,dvMatrixOut14,dvMatrixOut15}
dev dvMatrixInAll[]={
	dvMatrixIn01,dvMatrixIn02,dvMatrixIn03,dvMatrixIn04,dvMatrixIn05,dvMatrixIn06,dvMatrixIn07,dvMatrixIn08,
	dvMatrixIn09,dvMatrixIn10,dvMatrixIn11,dvMatrixIn12,dvMatrixIn13,dvMatrixIn14,dvMatrixIn15,dvMatrixIn16}



LONG nTimeFeedbackQry[1]={50}    //Feedback query
LONG nTimeDisplayQry[1]={1000}  //Decoder query
INTEGER nProjMuteWait=5 
INTEGER nProjInputWait=120 

char cServerAddress[]				= {'10.160.208.28'} // IP Address of the BSS
char cExterityIP[]					= {'10.160.204.14'}	// 
char cCodecIPAddress137[]			= {'10.160.90.41'}	// 
char cCodecIPAddress138[]			= {'10.160.90.13'}	// 
char cCodecIPAddress139[]			= {'10.160.90.45'}	// 

//#warn 'put codec username and password here'
char cCodecUsername[]				= {'amx'}			// 
char cCodecPassword[]				= {'amxcontrol123'}	// 
char cPowerConditionerIPAddress[]	= {'10.160.208.30'}	// 
char cPowerConditionerUsername[]	= {'admin'}			// 
char cPowerConditionerPassword[]	= {'admin'}			// 

CHAR CHRISTIE_POWER_OFF[ ]              ={'(','P','W','R','0',')'}
CHAR CHRISTIE_POWER_ON[ ]               ={'(','P','W','R','1',')'}
CHAR CHRISTIE_GET_STATUS[ ]             ={'(','P','W','R','?',')'}
CHAR CHRISTIE_RESP_POWER_OFF[ ]         ={'(','P','W','R','!','0',')'}
CHAR CHRISTIE_RESP_POWER_ON[ ]          ={'(','P','W','R','!','1',')'}
CHAR CHRISTIE_RESP_POWER_WARMING[ ]     ={'(','P','W','R','!','1','1',')'}
CHAR CHRISTIE_RESP_POWER_COOLING[ ]     ={'(','P','W','R','!','1','0',')'}
CHAR CHRISTIE_MUTE_OFF[ ]               ={'(','S','H','U','0',')'}
CHAR CHRISTIE_MUTE_ON[ ]           	={'(','S','H','U','1',')'}
CHAR CHRISTIE_RESP_MUTE_ON[ ]      	={'(','S','H','U','!','0','1',')'}
CHAR CHRISTIE_RESP_MUTE_OFF[ ]     	={'(','S','H','U','!','0','0',')'}
CHAR CHRISTIE_GET_MUTE_STATUS[ ]   	={'(','S','H','U','?',')'}
CHAR CHRISTIE_INPUT_VGA[]          	={'(SIN+MAIN 1)'}
CHAR CHRISTIE_INPUT_HDMI[]         	={'(SIN+MAIN 3)'}
CHAR CHRISTIE_GET_INPUT_STATUS[ ]  	={'(','S','I','N','?',')'}
CHAR CHRISTIE_RESP_INPUT_VGA[]     	={'(SIN!1)'}
CHAR CHRISTIE_RESP_INPUT_HDMI[]    	={'(SIN!3)'}
CHAR CHRISTIE_GET_SYS_INFO[]    	={'(SST?)'}

INTEGER PWR_ON	= 27
INTEGER PWR_OFF = 28

char SAMSUNG_INPUT_RGB[]     = {$AA,$14,$FF,$01,$14,$28}
CHAR SAMSUNG_POWER_OFF[ ]    = {$AA,$11,$00,$01,$00,$12}
CHAR SAMSUNG_POWER_ON[ ]     = {$AA,$11,$00,$01,$01,$13}
CHAR SAMSUNG_INPUT_HDMI_1[ ] = {$AA,$14,$00,$01,$21,$36}
CHAR SAMSUNG_INPUT_DVI[ ]    = {$AA,$14,$00,$01,$18,$2D}
CHAR SAMSUNG_VOLUP[]=          {$AA,$B0,$00,$01,$07,$B8}
CHAR SAMSUNG_VOLDN[]=          {$AA,$B0,$00,$01,$0B,$BC}
CHAR SAMSUNG_GET_VOL[]=        {$AA,$12,$00,$00,$12}
CHAR SAMSUNG_GET_INPUT[]=      {$AA,$14,$00,$00,$14}
CHAR SAMSUNG_GET_POWER[]=      {$AA,$11,$00,$00,$11}
CHAR SAMSUNG_GET_MUTE[]=       {$AA,$13,$00,$00,$13}
CHAR SAMSUNG_RESP_INPUT_DVI[]= {$AA,$FF,$00,$03,'A',$14,$18}
CHAR SAMSUNG_RESP_INPUT_HDMI[]={$AA,$FF,$00,$03,'A',$14,$21}
CHAR SAMSUNG_RESP_POWER_ON[]=  {$AA,$FF,$00,$03,'A',$11,$01}
CHAR SAMSUNG_RESP_POWER_OFF[]= {$AA,$FF,$00,$03,'A',$11,$00}
CHAR SAMSUNG_RESP_MUTE_ON[]=   {$AA,$FF,$00,$03,'A',$13,$01}
CHAR SAMSUNG_RESP_MUTE_OFF[]=  {$AA,$FF,$00,$03,'A',$13,$00}

CHAR SAMSUNG_MUTE_OFF[]=       {$AA,$13,$00,$01,$00,$14}
CHAR SAMSUNG_MUTE_TOGGLE[]=    {$AA,$B0,$00,$01,$0F,$C0}
CHAR SAMSUNG_VOL_00 [ ]      = {$AA,$12,$FF,$01,$00,$12}  //112 hex=274 dec   274/256=1    
CHAR SAMSUNG_VOL_10 [ ]      = {$AA,$12,$FF,$01,$0A,$1C}
CHAR SAMSUNG_VOL_20 [ ]      = {$AA,$12,$FF,$01,$14,$26}
CHAR SAMSUNG_VOL_30 [ ]      = {$AA,$12,$FF,$01,$1E,$30}
CHAR SAMSUNG_VOL_40 [ ]      = {$AA,$12,$FF,$01,$28,$3A}
CHAR SAMSUNG_VOL_50 [ ]      = {$AA,$12,$FF,$01,$32,$44}
CHAR SAMSUNG_VOL_60 [ ]      = {$AA,$12,$FF,$01,$3C,$4E}
CHAR SAMSUNG_VOL_70 [ ]      = {$AA,$12,$FF,$01,$46,$58}
CHAR SAMSUNG_VOL_80 [ ]      = {$AA,$12,$FF,$01,$50,$62}
CHAR SAMSUNG_VOL_90 [ ]      = {$AA,$12,$FF,$01,$5A,$6C}
CHAR SAMSUNG_VOL_100[ ]      = {$AA,$12,$FF,$01,$64,$76}

//VID INPUTS MATCH ENOVA INPUTS
INTEGER SRC_RM_137_W_HDMI           = 18
INTEGER SRC_RM_137_W_VGA            = 19
INTEGER SRC_RM_137_N_HDMI           = 13
INTEGER SRC_RM_137_N_VGA            = 10
INTEGER SRC_RM_138_N_HDMI           = 14
INTEGER SRC_RM_138_N_VGA            = 11
INTEGER SRC_RM_138_E_HDMI           = 16
INTEGER SRC_RM_138_E_VGA            = 17
INTEGER SRC_RM_139_N_HDMI           = 15
INTEGER SRC_RM_139_N_VGA            = 12
INTEGER SRC_CODEC_FAR_END           = 3
INTEGER SRC_CODEC_CONTENT           = 4
INTEGER SRC_IPTV                    = 9
INTEGER SRC_CAMERA                  = 6
INTEGER SRC_CODEC_DVI_OUT           = 5
//AUD
INTEGER SRC_VID_CONF_AUD            = 21
INTEGER SRC_MIC_1                   = 22
INTEGER SRC_MIC_2                   = 23
INTEGER SRC_MIC_3                   = 24
INTEGER SRC_POWER_OFF               = 25
INTEGER SRC_VIDEO_MUTE              = 26
INTEGER SRC_MUTE_ALL                = 27
INTEGER SRC_NO_CONTENT              = 28


//bss
CHAR DSP_COMBINE_PROG[]				= {$00,$01,$03,$00,$01,$04}; 
CHAR DSP_COMBINE_MICS[]				= {$00,$01,$03,$00,$01,$3B}; 
CHAR DSP_COMBINE_VTC[]				= {$00,$01,$03,$00,$01,$33}; 
CHAR DSP_VC_GAIN[]					= {$00,$01,$03,$00,$01,$03};
CHAR DSP_MICS_TO_VC_GAIN[]			= {$00,$01,$03,$00,$01,$06};
CHAR DSP_ROUTER[]					= {$00,$01,$03,$00,$01,$07}; 
CHAR DSP_AUTOMIX[]					= {$00,$01,$03,$00,$01,$02}; 
//CHAR DSP_CONTENT_TO_VC_GAIN[]		= {$00,$01,$03,$00,$01,$0C};
CHAR DSP_CONTENT_TO_VC_GAIN[]		= {$00,$01,$03,$00,$01,$08};
CHAR DSP_SIDE_MICS_TO_138[]			= {$00,$01,$03,$00,$01,$25};

CHAR DSP_137_PROGRAM[]				= {$00,$01,$03,$00,$01,$3D};
CHAR DSP_139_PROGRAM[]				= {$00,$01,$03,$00,$01,$3E};


CHAR DSP_VC_GAIN_137[]				= {$00,$05,$03,$00,$01,$08};
CHAR DSP_MICS_TO_VC_GAIN_137[]		= {$00,$05,$03,$00,$01,$0C};
CHAR DSP_MIC_AUTOMIX_137[]			= {$00,$05,$03,$00,$01,$09};
CHAR DSP_CONTENT_TO_VC_GAIN_137[]	= {$00,$05,$03,$00,$01,$11};


CHAR DSP_VC_GAIN_139[]				= {$00,$07,$03,$00,$01,$08};
CHAR DSP_MICS_TO_VC_GAIN_139[]		= {$00,$07,$03,$00,$01,$0C};
CHAR DSP_MIC_AUTOMIX_139[]			= {$00,$07,$03,$00,$01,$09};
CHAR DSP_CONTENT_TO_VC_GAIN_139[]	= {$00,$07,$03,$00,$01,$11};


 
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

DEVCHAN rel_137_N_UP={dvRelays1,1}
DEVCHAN rel_137_N_DN={dvRelays1,2}
DEVCHAN rel_138_N_UP={dvRelays1,3}
DEVCHAN rel_138_N_DN={dvRelays1,4}
DEVCHAN rel_139_L_UP={dvRelays1,5}
DEVCHAN rel_139_L_DN={dvRelays1,6}
DEVCHAN rel_139_R_UP={dvRelays1,7}
DEVCHAN rel_139_R_DN={dvRelays1,8}

DEVCHAN rel_137_W_UP={dvRelays2,1}
DEVCHAN rel_137_W_DN={dvRelays2,2}
DEVCHAN rel_138_E_UP={dvRelays2,3}
DEVCHAN rel_138_E_DN={dvRelays2,4}

DEVCHAN rel_Output_UP[] = {{dvRelays2,1}, {dvRelays1,1}, {dvRelays1,3}, {dvRelays2,3}, {dvRelays1,5}, {dvRelays1,7}};
DEVCHAN rel_Output_DN[] = {{dvRelays2,2}, {dvRelays1,2}, {dvRelays1,4}, {dvRelays2,4}, {dvRelays1,6}, {dvRelays1,8}};

MODE_AB_COMBINED=1
MODE_BC_COMBINED=2
MODE_ABC_COMBINED=3
MODE_SEPARATE=4

INTEGER MODE_AUDIO_OUTPUT[4][3] =
{
	{13,13,14},	// AB
	{12,13,13},	// BC
	{13,13,13},	// ABC
	{12,13,14}	// separate
}

(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE
dev dvTPLastSet[]={vdvTPDummy,vdvTPDummy,vdvTPDummy}

volatile integer nLastPanel
persistent integer nSourceRouted[16]
integer nSourceRoutedTemp[16]    //holds audio temp val
integer nSourceRoutedSDX
volatile integer nDisplayInput[6]
volatile integer nDisplayMute[6]
volatile integer nDisplayPollEnable
volatile integer nSwitcherOnline
volatile integer nDisplayPower[6]
volatile integer nNavVidRoutePage[3]
volatile integer nNavAudRoutePage[3]

integer nAudSourceRouted[6]

INTEGER MASTEROUT_VOL[50]; //KEEP TRACK OF MASTEROUT VOLUME
CHAR cSourceNames[50][50]

persistent integer nCombinedMode

volatile integer nIPPortConnected[50]


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

VOLATILE integer nTabSelected[3]

PERSISTENT integer nMatrixMoreSources[6]

integer nAutoShutdownFlag

integer nRoomOnSplashPage[3];


integer nBtnsVtcContent137[]	= {1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050};
integer nBtnsVtcContent138[]	= {1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020};
integer nBtnsVtcContent139[]	= {1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080};

integer nBtnsSource[]			= {2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020};
integer nBtnsDest[]			= {2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116};
integer nBtnsAudio[]			= {2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216};
integer nBtnsDisplayMute[]		= {2301,2302,2303,2304,2305,2306};
integer nSourceSelect[3];
integer nDestSelect[3];

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE
([rel_137_W_UP],[rel_137_W_DN])
([rel_137_N_UP],[rel_137_N_DN])
([rel_138_N_UP],[rel_138_N_DN])
([rel_138_E_UP],[rel_138_E_DN])
([rel_139_L_UP],[rel_139_L_DN])
([rel_139_R_UP],[rel_139_R_DN])
#INCLUDE 'BSS_Soundweb_London.axi'
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)


DEFINE_FUNCTION					fnDisplayCmd(integer nDisplayNum,integer nCmd)
{
	switch(nCmd)
	{
		case PWR_ON:
		{
			send_string dvRXAll[nDisplayNum],CHRISTIE_POWER_ON;					// turn the display on
			
			switch(nDisplayNum)
			{
				case 1:
				{
					cancel_wait 'proj1mute'
					wait nProjMuteWait 'proj1mute'
					{
						send_string dvRXAll[1],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj1input'
					wait nProjInputWait 'proj1input'
					{
						send_string dvRXAll[1],CHRISTIE_INPUT_HDMI
					}
				}
				case 2:
				{
					cancel_wait 'proj2mute'
					wait nProjMuteWait 'proj2mute'
					{
						send_string dvRXAll[2],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj2input'
					wait nProjInputWait 'proj2input'
					{
						send_string dvRXAll[2],CHRISTIE_INPUT_HDMI
					}
				}
				case 3:
				{
					cancel_wait 'proj3mute'
					wait nProjMuteWait 'proj3mute'
					{
						send_string dvRXAll[3],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj3input'
					wait nProjInputWait 'proj3input'
					{
						send_string dvRXAll[3],CHRISTIE_INPUT_HDMI
					}
				}
				case 4:
				{
					cancel_wait 'proj4mute'
					wait nProjMuteWait 'proj4mute'
					{
						send_string dvRXAll[4],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj4input'
					wait nProjInputWait 'proj4input'
					{
						send_string dvRXAll[4],CHRISTIE_INPUT_HDMI
					}
				}
				case 5:
				{
					cancel_wait 'proj5mute'
					wait nProjMuteWait 'proj5mute'
					{
						send_string dvRXAll[5],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj5input'
					wait nProjInputWait 'proj5input'
					{
						send_string dvRXAll[5],CHRISTIE_INPUT_HDMI
					}
				}
				case 6:
				{
					cancel_wait 'proj6mute'
					wait nProjMuteWait 'proj6mute'
					{
						send_string dvRXAll[6],CHRISTIE_MUTE_OFF
					}
					cancel_wait 'proj6input'
					wait nProjInputWait 'proj6input'
					{
						send_string dvRXAll[6],CHRISTIE_INPUT_HDMI
					}
				}
			}
		}
		case PWR_OFF:
		{
			send_string 0,"'proj ',itoa(nDisplayNum),' off'"
			send_string dvRXAll[nDisplayNum],CHRISTIE_POWER_OFF
			
			switch(nDisplayNum)
			{
				case 1: { wait 60 {send_string dvRXAll[1],CHRISTIE_POWER_OFF}}
				case 2: { wait 60 {send_string dvRXAll[2],CHRISTIE_POWER_OFF}}
				case 3: { wait 60 {send_string dvRXAll[3],CHRISTIE_POWER_OFF}}
				case 4: { wait 60 {send_string dvRXAll[4],CHRISTIE_POWER_OFF}}
				case 5: { wait 60 {send_string dvRXAll[5],CHRISTIE_POWER_OFF}}
				case 6: { wait 60 {send_string dvRXAll[6],CHRISTIE_POWER_OFF}}
			}
//			wait 60
//			{
//				send_string dvRXAll[nDisplayNum],CHRISTIE_POWER_OFF
//			}
			//pulse[rel_137_W_UP]
		}
	}
}

DEFINE_FUNCTION integer			fnProgramAudio(dev nPanel)
{
	
}
DEFINE_FUNCTION integer			DSP_GET_LEVEL_FBNUM(integer nInput,integer nMixerNum, char cHiQAddr[], integer nFaderNum)
{
    select
	{
		active(nMixerNum==1) :
		{
			cHiQAddr=DSP_COMBINE_PROG
			nFaderNum=nInput
			return nInput*2-1
		}
		active(nMixerNum==2) :
		{
			cHiQAddr=DSP_VC_GAIN
			nFaderNum=4
			return (nInput*2-1)+6
		}
		active(nMixerNum==3) :
		{
			cHiQAddr=DSP_MICS_TO_VC_GAIN
			nFaderNum=5
			return (nInput*2-1)+8
		}
		active(nMixerNum==4) :
		{
			cHiQAddr=DSP_AUTOMIX
			nFaderNum=nInput+5
			return (nInput*2-1)+18
		}
		
		
		active(nMixerNum==5):
		{
			cHiQAddr=DSP_VC_GAIN_137
			nFaderNum=12
			return(26)
		}
		active(nMixerNum==6):
		{
			cHiQAddr=DSP_MICS_TO_VC_GAIN_137
			nFaderNum=13
			return(28)
		}
		active(nMixerNum==7):
		{
			cHiQAddr=DSP_MIC_AUTOMIX_137
			nFaderNum=14
			return(30)
		}
		active(nMixerNum==8):
		{
			cHiQAddr=DSP_MIC_AUTOMIX_137
			nFaderNum=15
			return(32)
		}
		
		active(nMixerNum==9):
		{
			cHiQAddr=DSP_VC_GAIN_139
			nFaderNum=16
			return(34)
		}
		active(nMixerNum==10):
		{
			cHiQAddr=DSP_MICS_TO_VC_GAIN_139
			nFaderNum=17
			return(36)
		}
		active(nMixerNum==11):
		{
			cHiQAddr=DSP_MIC_AUTOMIX_139
			nFaderNum=18
			return(38)
		}
		active(nMixerNum==12):
		{
			cHiQAddr=DSP_MIC_AUTOMIX_139
			nFaderNum=19
			return(40)
		}
    }
	send_string 0, "'nFaderNum = ', itoa(nFaderNum)"
}

DEFINE_FUNCTION					NAV_popUpBottomMenu()
{  
    select
	{
		active(nCombinedMode==1 and nLastPanel<3) :  send_command dvTpAll[nLastPanel],"'PPON-0101 Menu Combined'"
		active(nCombinedMode==1 and nLastPanel>2) :  send_command dvTPAll[nLastPanel],"'PPON-0102 Menu Separated'"
		active(nCombinedMode==2 and nLastPanel<2) :  send_command dvTPAll[nLastPanel],"'PPON-0102 Menu Separated'"
		active(nCombinedMode==2 and nLastPanel>1) :  send_command dvTpAll[nLastPanel],"'PPON-0101 Menu Combined'"
		active(nCombinedMode==3) :                   send_command dvTpAll[nLastPanel],"'PPON-0101 Menu Combined'"
		active(nCombinedMode==4 and nLastPanel==1) : send_command dvTPAll[nLastPanel],"'PPON-0102 Menu Separated'"
		active(nCombinedMode==4 and nLastPanel==2) : send_command dvTpAll[nLastPanel],"'PPON-0101 Menu Combined'"
		active(nCombinedMode==4 and nLastPanel==3) : send_command dvTPAll[nLastPanel],"'PPON-0102 Menu Separated'"
		
    }
	if(nLastPanel == 1 or nLastPanel == 3)
	{
		send_command data.device,"'^SHO-100,0'";	//hides combine button in menu for 137 and 139
	}
}

DEFINE_FUNCTION integer			NAV_populate_menu_bar(dev dvTP) {
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
    select {
	active(nCombinedMode==1) : { //AB
	    select {
		active(dvTP.NUMBER==10001 or dvTP.Number==10002) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,00,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,01,0'"
		    send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
		    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
		} active(dvTP.NUMBER==10003) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,10,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,11,0'"
		    //send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,12,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,13,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,14,0'"
		    //send_command dvTP,"'^SSH-41,Menu 06-IPTV,15,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,16,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,17,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,18,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,19,0'"
		}
	    }
	} active(nCombinedMode==2) : { //BC
	    select {
		active(dvTP.NUMBER==10002 or dvTP.NUMBER==10003) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,00,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,01,0'"
		    send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
		    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
		} active(dvTP.NUMBER==10001) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,10,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,11,0'"
		    //send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,12,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,13,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,14,0'"
		    //send_command dvTP,"'^SSH-41,Menu 06-IPTV,15,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,16,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,17,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,18,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,19,0'"
		}
	    }
	} active(nCombinedMode==3) : { //All Combine
	    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,00,0'"
	    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,01,0'"
	    send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
	    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
	    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
	    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
	    //send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
	    //send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
	    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
	    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
	} active(nCombinedMode==4) : { //Separated
	    select {
		active(dvTP.NUMBER==10001) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,10,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,11,0'"
		    //send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,12,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,13,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,14,0'"
		    //send_command dvTP,"'^SSH-41,Menu 06-IPTV,15,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,16,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,17,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,18,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,19,0'"
		} active(dvTP.NUMBER==10002) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,00,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,01,0'"
		    send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
		    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
		} active(dvTP.NUMBER==10003) : {
		    send_command dvTP,"'^SSH-41,Menu 01-Set Combine Mode,10,0'"
		    send_command dvTP,"'^SSH-41,Menu 02-Video Selection,11,0'"
		    //send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,12,0'"
		    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,13,0'"
		    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,14,0'"
		    //send_command dvTP,"'^SSH-41,Menu 06-IPTV,15,0'"
		    //send_command dvTP,"'^SSH-41,Menu 07-Lights,16,0'"
		    //send_command dvTP,"'^SSH-41,Menu 08-Shades,17,0'"
		    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,18,0'"
		    send_command dvTP,"'^SSH-41,Menu 10-Help,19,0'"
		}
	    }
	}
    }
}

DEFINE_FUNCTION integer			xxxNAV_populate_sources(dev dvTP) {
    local_var integer x
    local_var integer y
    #warn 'can delete this select statement- used for debugging'
    select {
	active(nCombinedMode==1) : {
	    if(dvTP.Number==10001) {
		send_command dvTP1,"'^BMF-101,0,%SW1'"
		send_command dvTP1,"'^BMF-201,0,%SW1'"
		send_command dvTP1,"'^BMF-301,0,%SW1'"
		send_command dvTP1,"'^BMF-401,0,%SW1'"
		send_command dvTP1,"'^BMF-501,0,%SW0'"
		send_command dvTP1,"'^BMF-601,0,%SW0'"
	    }
	    if(dvTP.Number==10002) {
		send_command dvTP2,"'^BMF-101,0,%SW1'"
		send_command dvTP2,"'^BMF-201,0,%SW1'"
		send_command dvTP2,"'^BMF-301,0,%SW1'"
		send_command dvTP2,"'^BMF-401,0,%SW1'"
		send_command dvTP2,"'^BMF-501,0,%SW0'"
		send_command dvTP2,"'^BMF-601,0,%SW0'"
	    }
	    if(dvTP.Number==10003) {
		send_command dvTP3,"'^BMF-101,0,%SW0'"
		send_command dvTP3,"'^BMF-201,0,%SW0'"
		send_command dvTP3,"'^BMF-301,0,%SW0'"
		send_command dvTP3,"'^BMF-401,0,%SW0'"
		send_command dvTP3,"'^BMF-501,0,%SW1'"
		send_command dvTP3,"'^BMF-601,0,%SW1'"
	    }
	} active(nCombinedMode==2) : {
	    if(dvTP.Number==10001) {
		send_command dvTP1,"'^BMF-101,0,%SW1'"
		send_command dvTP1,"'^BMF-201,0,%SW1'"
		send_command dvTP1,"'^BMF-301,0,%SW0'"
		send_command dvTP1,"'^BMF-401,0,%SW0'"
		send_command dvTP1,"'^BMF-501,0,%SW0'"
		send_command dvTP1,"'^BMF-601,0,%SW0'"
	    }
	    if(dvTP.Number==10002) {
		send_command dvTP2,"'^BMF-101,0,%SW0'"
		send_command dvTP2,"'^BMF-201,0,%SW0'"
		send_command dvTP2,"'^BMF-301,0,%SW1'"
		send_command dvTP2,"'^BMF-401,0,%SW1'"
		send_command dvTP2,"'^BMF-501,0,%SW1'"
		send_command dvTP2,"'^BMF-601,0,%SW1'"
	    }
	    if(dvTP.Number==10003) {
		send_command dvTP3,"'^BMF-101,0,%SW0'"
		send_command dvTP3,"'^BMF-201,0,%SW0'"
		send_command dvTP3,"'^BMF-301,0,%SW1'"
		send_command dvTP3,"'^BMF-401,0,%SW1'"
		send_command dvTP3,"'^BMF-501,0,%SW1'"
		send_command dvTP3,"'^BMF-601,0,%SW1'"
	    }
	} active(nCombinedMode==3) : {  //all combined
	    if(dvTP.Number==10001) {
		send_command dvTP1,"'^BMF-101,0,%SW1'"
		send_command dvTP1,"'^BMF-201,0,%SW1'"
		send_command dvTP1,"'^BMF-301,0,%SW1'"
		send_command dvTP1,"'^BMF-401,0,%SW1'"
		send_command dvTP1,"'^BMF-501,0,%SW1'"
		send_command dvTP1,"'^BMF-601,0,%SW1'"
	    }
	    if(dvTP.Number==10002) {
		send_command dvTP2,"'^BMF-101,0,%SW1'"
		send_command dvTP2,"'^BMF-201,0,%SW1'"
		send_command dvTP2,"'^BMF-301,0,%SW1'"
		send_command dvTP2,"'^BMF-401,0,%SW1'"
		send_command dvTP2,"'^BMF-501,0,%SW1'"
		send_command dvTP2,"'^BMF-601,0,%SW1'"
	    }
	    if(dvTP.Number==10003) {
		send_command dvTP3,"'^BMF-101,0,%SW1'"
		send_command dvTP3,"'^BMF-201,0,%SW1'"
		send_command dvTP3,"'^BMF-301,0,%SW1'"
		send_command dvTP3,"'^BMF-401,0,%SW1'"
		send_command dvTP3,"'^BMF-501,0,%SW1'"
		send_command dvTP3,"'^BMF-601,0,%SW1'"
	    }
	} active(nCombinedMode==4) : {  //all separate
	    if(dvTP.Number==10001) {
		send_command dvTP1,"'^BMF-101,0,%SW1'"
		send_command dvTP1,"'^BMF-201,0,%SW1'"
		send_command dvTP1,"'^BMF-301,0,%SW0'"
		send_command dvTP1,"'^BMF-401,0,%SW0'"
		send_command dvTP1,"'^BMF-501,0,%SW0'"
		send_command dvTP1,"'^BMF-601,0,%SW0'"
	    } 
	    if(dvTP.Number==10002) {
		send_command dvTP2,"'^BMF-101,0,%SW0'"
		send_command dvTP2,"'^BMF-201,0,%SW0'"
		send_command dvTP2,"'^BMF-301,0,%SW1'"
		send_command dvTP2,"'^BMF-401,0,%SW1'"
		send_command dvTP2,"'^BMF-501,0,%SW0'"
		send_command dvTP2,"'^BMF-601,0,%SW0'"
	    } 
	    if(dvTP.Number==10003) {
		send_command dvTP3,"'^BMF-101,0,%SW0'"
		send_command dvTP3,"'^BMF-201,0,%SW0'"
		send_command dvTP3,"'^BMF-301,0,%SW0'"
		send_command dvTP3,"'^BMF-401,0,%SW0'"
		send_command dvTP3,"'^BMF-501,0,%SW1'"
		send_command dvTP3,"'^BMF-601,0,%SW1'"
	    }
	}
    }

    select {
	active(nCombinedMode==1) : {   //AB Combined
	    select {
		active(dvTP.NUMBER==10001 or dvTP.Number==10002) : {
		    for(x=100;x<=400;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END),   ',02,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT),   ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),            ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),   ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA),    ',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),   ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA),    ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),   ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA),    ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),   ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA),    ',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI), ',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA),  ',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CAMERA),          ',15,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT),   ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		    }
		} active(dvTP.NUMBER==10003) : {
		    for(x=500;x<=600;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END)"// ',02,10'" 
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT)"// ',03,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_IPTV)"         // ',04,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI)"// ',05,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA)" // ',06,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI)"// ',07,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA)" // ',08,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI)"// ',09,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA)" // ',10,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI)"// ',11,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA)" // ',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),   ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA),    ',14,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CAMERA)"       // ',15,10'"
			//send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT)"// ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
		    }
		}
	    }
	} active(nCombinedMode==2) : {   //BC Combined
	    select {
		active(dvTP.NUMBER==10002 or dvTP.Number==10003) : {
		    for(x=300;x<=600;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END),   ',02,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT),   ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),            ',04,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI)"// ',05,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA)" // ',06,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI)"// ',07,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA)"//  ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),   ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA),    ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),   ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA),    ',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),   ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA),    ',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CAMERA),          ',15,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT),   ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		    }
		} active(dvTP.NUMBER==10001) : {
		    for(x=100;x<=200;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END)"// ',02,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT)"// ',03,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_IPTV)"         // ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),   ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA),    ',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),   ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA),    ',08,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI)"// ',09,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA)" // ',10,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI)"// ',11,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA)" // ',12,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI)"// ',13,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA)" // ',14,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CAMERA)"       // ',15,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT)"// ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
		    }
		}
	    }
	} active(nCombinedMode==3) : { //all combined
	    for(x=100;x<=600;x=x+100) {
		for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),    ',00,10'" 
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),   ',01,10'" 
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END),',02,10'" 
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT),',03,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',04,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CAMERA),       ',15,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT),',16,10'"
	    }
	    for(x=700;x<=900;x=x+100) {
		for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
	    } 
	    for(x=1000;x<=1000;x=x+100) {
		for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
		send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
	    }
	} active(nCombinedMode==4) : {   //all separate
	    select {
		active(dvTP.NUMBER==10001) : {
		    for(x=100;x<=200;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END)"// ',02,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT)"// ',03,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_IPTV)"         // ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),   ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA),    ',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),   ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA),    ',08,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI)"// ',09,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA)" // ',10,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI)"// ',11,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA)" // ',12,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI)"// ',13,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA)" // ',14,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CAMERA)"       // ',15,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT)"// ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		    }
		} active(dvTP.NUMBER==10002) : {
		    for(x=300;x<=400;x=x+100) {
			for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END),   ',02,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT),   ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),            ',04,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI)"// ',05,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA)" // ',06,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI)"// ',07,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA)"//  ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),   ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA),    ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),   ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA),    ',12,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI)"// ',13,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA)"//  ',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CAMERA),          ',15,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT),   ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		    }
		} active(dvTP.NUMBER==10003) : {
		    for(x=500;x<=600;x=x+100) {
		        for(y=0;y<=16;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),       ',00,10'" 
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VIDEO_MUTE),      ',01,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_FAR_END)"// ',02,10'" 
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_CONTENT)"// ',03,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_IPTV)"         // ',04,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI)"// ',05,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA)" // ',06,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI)"// ',07,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA)" // ',08,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI)"// ',09,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA)" // ',10,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI)"// ',11,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA)" // ',12,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),   ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA),    ',14,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CAMERA)"       // ',15,10'"
			send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+SRC_CODEC_DVI_OUT)"// ',16,10'"
		    }
		    for(x=700;x<=900;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MUTE_ALL),     ',00,10'"  //mute all 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_VID_CONF_AUD), ',01,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),         ',02,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_1),        ',03,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_2),        ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_MIC_3),        ',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_HDMI),',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_W_VGA), ',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_HDMI),',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_137_N_VGA), ',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_HDMI),',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_N_VGA), ',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_HDMI),',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_138_E_VGA), ',13,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_HDMI),',14,10'"
			send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_RM_139_N_VGA), ',15,10'"
		    } 
		    for(x=1000;x<=1000;x=x+100) {
			for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',',itoa(x+y)"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_NO_CONTENT),   ',00,10'" 
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_IPTV),         ',04,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_HDMI),',05,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_W_VGA), ',06,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_HDMI),',07,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_137_N_VGA), ',08,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_HDMI),',09,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_N_VGA), ',10,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_HDMI),',11,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_138_E_VGA), ',12,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_HDMI),',13,10'"
			//send_command dvTP,"'^SSH-',itoa(x+1),',',itoa(x+SRC_RM_139_N_VGA), ',14,10'"
		    }
		}
	    }
	}
    }
}

DEFINE_FUNCTION                   NAV_populate_display_pagexxx(dev dvTP) {
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

define_function char[200]			NAV_replaceLineFeed(char textString[200]) {  //we need a linefeed for the vartext on display buttons, 
								   //it wont fit on vartext 1, so we remove it
    stack_var integer x
    stack_var char newTextString[200]
    newTextString=textString
    for (x=1;x<200;x++) {
	if (newTextString[x]==$0A) newTextString[x]=' '
    }
    return newTextString
}

DEFINE_FUNCTION                   NAV_select_vid_page()
{
    send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
    send_command dvTPAll[nLastPanel],"'@PPX'"
    NAV_popUpBottomMenu()
    
    nTabSelected[nLastPanel]=3
    select
	{
		active(nCombinedMode==1 and nLastPanel<3) :	// Mode AB, In AB
		{
			send_command dvTPAll[nLastPanel],"'PPON-0001 Switching-AB'"
		}
		active(nCombinedMode==1 and nLastPanel>2) :	// Mode AB, in C
		{
			send_command dvTPAll[nLastPanel],"'PPON-0006 Switching-C'"
		}
		active(nCombinedMode==2 and nLastPanel<2) :	// Mode BC, in A
		{
			send_command dvTPAll[nLastPanel],"'PPON-0004 Switching-A'"
		}
		active(nCombinedMode==2 and nLastPanel>1) :	// Mode BC, In BC
		{
			send_command dvTPAll[nLastPanel],"'PPON-0002 Switching-BC'"
		}
		active(nCombinedMode==3) :						// Mode ABC
		{
			send_command dvTPAll[nLastPanel],"'PPON-0003 Switching-Combined'"
		}
		active(nCombinedMode==4 and nLastPanel==1) :	// Mode Separate, in A
		{
			send_command dvTPAll[nLastPanel],"'PPON-0004 Switching-A'"
		}
		active(nCombinedMode==4 and nLastPanel==2) :	// Mode Separate, in B
		{
			send_command dvTPAll[nLastPanel],"'PPON-0005 Switching-B'"
		}
		active(nCombinedMode==4 and nLastPanel==3) :	// Mode Separate, in C
		{
			send_command dvTPAll[nLastPanel],"'PPON-0006 Switching-C'"
		}
    }
}

DEFINE_FUNCTION					SUBSCRIBE_ALL()
{
    local_var integer I
    local_var integer J
    subscribed = 1;
    CALL 'SUBSCRIBE%'(DSP_COMBINE_PROG,ROOM_COMBINE,1,0,SOURCE_GAIN)//FB[1][12]
    CALL 'SUBSCRIBE'(DSP_COMBINE_PROG,ROOM_COMBINE,1,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_COMBINE_PROG,ROOM_COMBINE,2,0,SOURCE_GAIN)
    CALL 'SUBSCRIBE'(DSP_COMBINE_PROG,ROOM_COMBINE,2,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_COMBINE_PROG,ROOM_COMBINE,3,0,SOURCE_GAIN)
    CALL 'SUBSCRIBE'(DSP_COMBINE_PROG,ROOM_COMBINE,3,0,SOURCE_MUTE)
    CALL 'SUBSCRIBE%'(DSP_VC_GAIN,GAIN,1,0,GAIN)
    CALL 'SUBSCRIBE'(DSP_VC_GAIN,GAIN,1,0,MUTE)
    CALL 'SUBSCRIBE%'(DSP_MICS_TO_VC_GAIN,GAIN,1,0,GAIN)
    CALL 'SUBSCRIBE'(DSP_MICS_TO_VC_GAIN,GAIN,1,0,MUTE)      ////FB[10]
    
    FOR(I=1;I<=3;I++) //FB[11-16] MATRIX ROUTER
    {
		FOR(J=1;J<=2;J++)
		{
			CALL 'SUBSCRIBE'(DSP_ROUTER,ROUTER,J,I,ROUTE) 
		}
    }
    CALL 'SUBSCRIBE'(DSP_COMBINE_PROG,ROOM_COMBINE,1,0,PARTITION)//FB[17][12]	//PARTITION #1
    CALL 'SUBSCRIBE'(DSP_COMBINE_PROG,ROOM_COMBINE,2,0,PARTITION)//FB[18][12]	//PARTITION #2
    
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,1,0,GAIN)//FB[19]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,1,0,MUTE) 
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,2,0,GAIN)//FB[21]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,2,0,MUTE) 
    CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,3,0,GAIN)//FB[23]
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,3,0,MUTE) 
    CALL 'SUBSCRIBE' (DSP_CONTENT_TO_VC_GAIN,N_GAIN,6,0,MUTE) ///FB[25]
	
	
	CALL 'SUBSCRIBE%'	(DSP_VC_GAIN_137,GAIN,1,0,GAIN)				//FB[26]
    CALL 'SUBSCRIBE'	(DSP_VC_GAIN_137,GAIN,1,0,MUTE)				//FB[27]		
	CALL 'SUBSCRIBE%'	(DSP_MICS_TO_VC_GAIN_137,GAIN,1,0,GAIN)		//FB[28]
	CALL 'SUBSCRIBE'	(DSP_MICS_TO_VC_GAIN_137,GAIN,1,0,MUTE)		//FB[29]
	CALL 'SUBSCRIBE%'	(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,GAIN)	//FB[30]
	CALL 'SUBSCRIBE'	(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE)	//FB[31]
	CALL 'SUBSCRIBE%'	(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,GAIN)	//FB[32]
	CALL 'SUBSCRIBE'	(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE)	//FB[33]
	
	CALL 'SUBSCRIBE%'	(DSP_VC_GAIN_139,GAIN,1,0,GAIN)				//FB[34]
    CALL 'SUBSCRIBE'	(DSP_VC_GAIN_139,GAIN,1,0,MUTE)				//FB[35]
	CALL 'SUBSCRIBE%'	(DSP_MICS_TO_VC_GAIN_139,GAIN,1,0,GAIN)		//FB[36]
	CALL 'SUBSCRIBE'	(DSP_MICS_TO_VC_GAIN_139,GAIN,1,0,MUTE)		//FB[37]
	CALL 'SUBSCRIBE%'	(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,GAIN)	//FB[38]
	CALL 'SUBSCRIBE'	(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE)	//FB[39]
	CALL 'SUBSCRIBE%'	(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,GAIN)	//FB[40]
	CALL 'SUBSCRIBE'	(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE)	//FB[41]
	
	CALL 'SUBSCRIBE'	(DSP_CONTENT_TO_VC_GAIN_137,GAIN,1,0,MUTE)	//FB[42]
	CALL 'SUBSCRIBE'	(DSP_CONTENT_TO_VC_GAIN_139,GAIN,1,0,MUTE)	//FB[43]
	
	CALL 'SUBSCRIBE'	(DSP_SIDE_MICS_TO_138,AUTOMIXER,5,0,MUTE);	//FB[44]
	CALL 'SUBSCRIBE'	(DSP_SIDE_MICS_TO_138,AUTOMIXER,6,0,MUTE);	//FB[45]
	
	CALL 'SUBSCRIBE'	(DSP_137_PROGRAM,GAIN,1,0,MUTE)				//FB[46]
	CALL 'SUBSCRIBE'	(DSP_139_PROGRAM,GAIN,1,0,MUTE)				//FB[47]
	
	CALL 'SUBSCRIBE%'(DSP_AUTOMIX,AUTOMIXER,4,0,GAIN)				//FB[48]	// 
    CALL 'SUBSCRIBE' (DSP_AUTOMIX,AUTOMIXER,4,0,MUTE) 
	
	CALL 'SUBSCRIBE'(DSP_COMBINE_MICS,ROOM_COMBINE,1,0,PARTITION)//FB[50][12]	//PARTITION #1
    CALL 'SUBSCRIBE'(DSP_COMBINE_MICS,ROOM_COMBINE,2,0,PARTITION)//FB[51][12]	//PARTITION #2
    CALL 'SUBSCRIBE'(DSP_COMBINE_VTC,ROOM_COMBINE,1,0,PARTITION)//FB[52][12]	//PARTITION #1
    CALL 'SUBSCRIBE'(DSP_COMBINE_VTC,ROOM_COMBINE,2,0,PARTITION)//FB[53][12]	//PARTITION #2

}

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
//cSourceNames[01]="'Video Conference'"      //11
//cSourceNames[02]="'Far Side Video'"      //12
//cSourceNames[03]="'IPTV'"                             //15
//cSourceNames[04]="'Room 137 Front',$0A,'Floorbox VGA'"  //4
//cSourceNames[05]="'Room 137 Front',$0A,'Floorbox HDMI'" //3
//cSourceNames[06]="'Room 138 Front',$0A,'Floorbox HDMI'" //5
//cSourceNames[07]="'Room 139 Front',$0A,'Floorbox HDMI'" //9
//cSourceNames[08]="'Room 138 Right',$0A,'Floorbox HDMI'"  //7
//cSourceNames[09]="'Room 138 Front',$0A,'Floorbox VGA'"  //6
//cSourceNames[10]="'Room 139 Front',$0A,'Floorbox VGA'"  //10
//cSourceNames[11]="'Room 138 Right',$0A,'Floorbox VGA'"   //8
//cSourceNames[12]="'Room 137 Left',$0A,'Wallplate VGA'"   //2
//cSourceNames[13]="'Room 137 Left',$0A,'Wallplate HDMI'"  //1
//cSourceNames[14]="'Cisco Camera',$0A,'From D/A'"      //13
//cSourceNames[15]="'Video Conference',$0A,'DVI Out'"   //14
//cSourceNames[17]="'Video',$0A,'Conference'"           //17
//cSourceNames[18]="'Wireless',$0A,'Mic 1'"             //18
//cSourceNames[19]="'Wireless',$0A,'Mic 2'"             //19
//cSourceNames[20]="'Wireless',$0A,'Mic 3'"             //20
//cSourceNames[25]="'OFF'"                        //25
//cSourceNames[26]="'MUTE'"                       //26
//cSourceNames[27]="'Mute All'"                         //27
//cSourceNames[28]="'No Content'"                       //28

cSourceNames[01]="'Video Conference',$0A,'Room 137'"
cSourceNames[02]="'Far Side Video',$0A,'Room 137'"
cSourceNames[03]="'Video Conference',$0A,'Room 138'"
cSourceNames[04]="'Far Side Video',$0A,'Room 138'"
cSourceNames[05]="'Video Conference',$0A,'DVI Out'"
cSourceNames[06]="'Cisco Camera',$0A,'From D/A'"
cSourceNames[07]="'Video Conference',$0A,'Room 139'"
cSourceNames[08]="'Far Side Video',$0A,'Room 139'"
cSourceNames[09]="'IPTV'"
cSourceNames[10]="'Room 137 Front',$0A,'Floorbox VGA'"
cSourceNames[11]="'Room 138 Front',$0A,'Floorbox VGA'"
cSourceNames[12]="'Room 139 Front',$0A,'Floorbox VGA'"
cSourceNames[13]="'Room 137 Front',$0A,'Floorbox HDMI'"
cSourceNames[14]="'Room 138 Front',$0A,'Floorbox HDMI'"
cSourceNames[15]="'Room 139 Front',$0A,'Floorbox HDMI'"
cSourceNames[16]="'Room 138 Right',$0A,'Floorbox HDMI'"
cSourceNames[17]="'Room 138 Right',$0A,'Floorbox VGA'"
cSourceNames[18]="'Room 137 Left',$0A,'Wallplate HDMI'"
cSourceNames[19]="'Room 137 Left',$0A,'Wallplate VGA'"

cSourceNames[21]="'Video Conference'"                        //25


cSourceNames[25]="'OFF'"                        //25
cSourceNames[26]="'MUTE'"                       //26
cSourceNames[27]="'Mute All'"                         //27
cSourceNames[28]="'No Content'"                       //28



nDisplayPollEnable = 1

TIMELINE_CREATE(1,nTimeFeedbackQry,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //TV power query timeline
TIMELINE_CREATE(2,nTimeDisplayQry,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //TV power query timeline

//BSS
REPEAT_TIME[1] = 300; //300ms TO UPDATE FEEDBACK
CHECK_REPEAT_TIME[1] = 5000; //check to see if we are connected every 5 seconds
TIMELINE_CREATE(3, REPEAT_TIME, 1, TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//FEEDBACK TIMELINE;
TIMELINE_CREATE(4,CHECK_REPEAT_TIME, 1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//Resubscribe timeline. 




IF(nInitialized==0) cContactInfo="'Use Button below to change Custom Help Message...'"
nInitialized=1

DEFINE_MODULE  'Cisco_SX80_CE_Comm_dr1_0_0' comm(vdvCISCOSX80_137, dvCISCOSX80_137)
DEFINE_MODULE  'Cisco_SX80_CE_Comm_dr1_0_0' comm(vdvCISCOSX80_138, dvCiscoSX80_138)
DEFINE_MODULE  'Cisco_SX80_CE_Comm_dr1_0_0' comm(vdvCISCOSX80_139, dvCISCOSX80_139)
DEFINE_MODULE  'Surgex_iControl2_dr1_0_0'  modPowerController(vdvPowerController, dvPowerController);
(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

LEVEL_EVENT[dvMatrixOutAll,50]
{
    local_var integer nLastOut
    nLastOut=get_last(dvMatrixOutAll)
    nSourceRouted[nLastOut]=level.value
    if(nLastOut==01) send_command dvTpAll,"'^txt-1501,0,',cSourceNames[level.value]"
    if(nLastOut==02) send_command dvTpAll,"'^txt-1502,0,',cSourceNames[level.value]"
    if(nLastOut==03) send_command dvTpAll,"'^txt-1503,0,',cSourceNames[level.value]"
    if(nLastOut==04) send_command dvTpAll,"'^txt-1504,0,',cSourceNames[level.value]"
    if(nLastOut==05) send_command dvTpAll,"'^txt-1505,0,',cSourceNames[level.value]"
    if(nLastOut==06) send_command dvTpAll,"'^txt-1506,0,',cSourceNames[level.value]"

    if(nLastOut==12) send_command dvTpAll,"'^txt-31,0,',cSourceNames[level.value]"
    if(nLastOut==13) send_command dvTpAll,"'^txt-32,0,',cSourceNames[level.value]"
    if(nLastOut==14) send_command dvTpAll,"'^txt-33,0,',cSourceNames[level.value]"
}




TIMELINE_EVENT[1]//Feedback timeline
{
    local_var integer nCount
    local_var integer x
    local_var integer nTest
    for(nCount=1;nCount<=6;nCount++) {}
    send_level dvTPAll,10,nCombinedMode

    for(x=1;x<=8;x++) [dvTp1,x]=nTabSelected[1]==x
    for(x=1;x<=8;x++) [dvTp2,x]=nTabSelected[2]==x
    for(x=1;x<=8;x++) [dvTp3,x]=nTabSelected[3]==x
        
    
    for(nCount=1;nCount<=4;nCount++)
	{
		[dvTpAll,nCount+10]=nCombinedMode==nCount
    }

    for(x=101;x<=115;x++) [dvTpAll,x]=(nSourceRouted[1]==x-100 and nDisplayPower[1] and !nDisplayMute[1])
    [dvTpAll,125]=!nDisplayPower[1]
    [dvTpAll,126]=nDisplayMute[1]
    for(x=201;x<=215;x++) [dvTpAll,x]=(nSourceRouted[2]==x-200 and nDisplayPower[2] and !nDisplayMute[2])
    [dvTpAll,225]=!nDisplayPower[2]
    [dvTpAll,226]=nDisplayMute[2]
    for(x=301;x<=315;x++) [dvTpAll,x]=(nSourceRouted[3]==x-300 and nDisplayPower[3] and !nDisplayMute[3])
    [dvTpAll,325]=!nDisplayPower[3]
    [dvTpAll,326]=nDisplayMute[3]
    for(x=401;x<=415;x++) [dvTpAll,x]=(nSourceRouted[4]==x-400 and nDisplayPower[4] and !nDisplayMute[4])
    [dvTpAll,425]=!nDisplayPower[4]
    [dvTpAll,426]=nDisplayMute[4]
    for(x=501;x<=515;x++) [dvTpAll,x]=(nSourceRouted[5]==x-500 and nDisplayPower[5] and !nDisplayMute[5])
    [dvTpAll,525]=!nDisplayPower[5]
    [dvTpAll,526]=nDisplayMute[5]
    for(x=601;x<=615;x++) [dvTpAll,x]=(nSourceRouted[6]==x-600 and nDisplayPower[6] and !nDisplayMute[6])
    [dvTpAll,625]=!nDisplayPower[6]
    [dvTpAll,626]=nDisplayMute[6]
	
	for(x=1;x<=6;x++)
	{
		[dvTPAll,nBtnsDisplayMute[x]] = nDisplayMute[x];
	}
    
    for(x=1001;x<=1020;x++) [dvTpAll,x]=(nSourceRouted[10]==x-1000)		// VTC Content FB
    [dvTPAll,1028]=(nSourceRouted[10]==0 and FB[25][12])
	
    for(x=1031;x<=1050;x++) [dvTpAll[1],x]=(nSourceRouted[9]==x-1030)	// VTC Content FB
    [dvTpAll[1],1058]=(nSourceRouted[9]==0 and FB[42][12])
	
    for(x=1061;x<=1080;x++) [dvTpAll[3],x]=(nSourceRouted[11]==x-1060)	// VTC Content FB
    [dvTpAll[3],1088]=(nSourceRouted[11]==0 and FB[43][12])
	
	
	
    for(nCount=1;nCount<=6;nCount++) {
		[dvTPAll,1400+nCount]=!nDisplayPower[nCount] 
		[dvTPAll,1410+nCount]=nDisplayPower[nCount]
    }
    [dvTPAll,1421]=[rel_137_W_UP]
    [dvTPAll,1422]=[rel_137_N_UP]
    [dvTPAll,1423]=[rel_138_N_UP]
    [dvTPAll,1424]=[rel_138_E_UP]
    [dvTPAll,1425]=[rel_139_L_UP]
    [dvTPAll,1426]=[rel_139_R_UP]
    
    [dvTPAll,1431]=[rel_137_W_DN]
    [dvTPAll,1432]=[rel_137_N_DN]
    [dvTPAll,1433]=[rel_138_N_DN]
    [dvTPAll,1434]=[rel_138_E_DN]
    [dvTPAll,1435]=[rel_139_L_DN]
    [dvTPAll,1436]=[rel_139_R_DN]
    
    for(nCount=1;nCount<=5;nCount++)
	{
		[dvTPAll,1520+nCount]=nSourceRoutedSDX==nCount
    }
	
	for(x=1;x<=32;x++)		// source selected feedback
	{
		[dvTPAll[1],2000 + x] = nSourceSelect[1] == x;
		[dvTPAll[2],2000 + x] = nSourceSelect[2] == x;
		[dvTPAll[3],2000 + x] = nSourceSelect[3] == x;
	}
		
	for(x=1;x<=16;x++)		// audio select speaker icons
	{
		[dvTPAll[1],2200 + x] = nSourceRouted[MODE_AUDIO_OUTPUT[nCombinedMode][1]] <> nSourceRouted[x];
		[dvTPAll[2],2200 + x] = nSourceRouted[MODE_AUDIO_OUTPUT[nCombinedMode][2]] <> nSourceRouted[x];
		[dvTPAll[3],2200 + x] = nSourceRouted[MODE_AUDIO_OUTPUT[nCombinedMode][3]] <> nSourceRouted[x];
	}
    
    [dvTPAll,1601]=[vdvCiscoSX80_138,146]
    
    // auto shutdown if current time matches auto shutdown time
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE))
    {
	if(!nAutoShutdownFlag)	// check flag to make sure it only fires once
	{
	    switch(nCombinedMode)
	    {
		case 1:		// AB
		{
//		    do_push(dvTP1, 17)
		    do_push(dvTP2, 17)
		    do_push(dvTP3, 17)
		}
		case 2:		// BC
		{
		    do_push(dvTP1, 17)
		    do_push(dvTP2, 17)
//		    do_push(dvTP3, 17)
		}
		case 3:		// ABC
		{
//		    do_push(dvTP1, 17)
		    do_push(dvTP2, 17)
//		    do_push(dvTP3, 17)
		}
		case 4:		// Separate
		{
		    do_push(dvTP1, 17)
		    do_push(dvTP2, 17)
		    do_push(dvTP3, 17)
		}
	    }
	    nAutoShutdownFlag = 1
	}
    }
    // reset auto shutdown flag after a minute
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE + 1))
    {
	nAutoShutdownFlag = 0
    }

}

TIMELINE_EVENT[2]//Display status timeline
{
    local_var integer n
    if(nDisplayPollEnable)
    {
	for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_STATUS
	wait 3 for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_INPUT_STATUS
	wait 6 for(n=01;n<=06;n++) send_string dvRXAll[n],CHRISTIE_GET_MUTE_STATUS
    }
}

TIMELINE_EVENT[3]//BSS FEEDBACK TIMELINE
{
    //FOR ALL DISCRETE SV'S (MUTES, ROUTES, ETC) THE 12TH BYTE <FB[][12]> HOLDS THE ZERO OR ONE (MUTE OR UNMUTE) STATE OF STATE VARIABLE
    //FOR ALL GAIN% SV'S THE 10TH BYTE <FB[][10]> WILL HOLD THE VALUE OF THE FADER IN PERCENT <0-100>. THE 11TH AND 12TH ELEMENT IS THE FRACTIONAL (DECIMAL) VALUE (IE 67.003%) USED ONLY FOR ROUNDING TO THE NEAREST INTEGER FOR THIS SAMPLE PROGAM. THE PROGRAMMER CAN MODIFY TO USE THIS EXTRA RESOLUTION IF DESIRED
    //SEE HELP FILE FOR COMPLETE FB[][] STRUCTURE
    local_var integer x
    MASTEROUT_VOL[01] = TYPE_CAST(MID_STRING(FB[01],10,1)); //FB[01] IS THE POSITION IN STARTUP THAT I SUBSCRIBED TO
    SEND_LEVEL dvTPAll,01,MASTEROUT_VOL[01];
    [dvTPAll,1103] = FB[02][12];//ROOM_COMBINE SOURCE_MUTE
    MASTEROUT_VOL[02] = TYPE_CAST(MID_STRING(FB[03],10,1)); 
    SEND_LEVEL dvTPAll,02,MASTEROUT_VOL[02];
    [dvTPAll,1106] = FB[04][12];//ROOM_COMBINE SOURCE_MUTE
    MASTEROUT_VOL[03] = TYPE_CAST(MID_STRING(FB[05],10,1)); 
    SEND_LEVEL dvTPAll,03,MASTEROUT_VOL[03];
    [dvTPAll,1109] = FB[06][12];//ROOM_COMBINE SOURCE_MUTE
    MASTEROUT_VOL[04] = TYPE_CAST(MID_STRING(FB[07],10,1)); 
    SEND_LEVEL dvTPAll,04,MASTEROUT_VOL[04];
    [dvTPAll,1112] = FB[08][12];//VC GAIN MUTE
    MASTEROUT_VOL[05] = TYPE_CAST(MID_STRING(FB[09],10,1)); 
    SEND_LEVEL dvTPAll,05,MASTEROUT_VOL[05];
    [dvTPAll,1115] = FB[10][12];//MICS TO VC
	
	

	//137 VTC
	MASTEROUT_VOL[12] = TYPE_CAST(MID_STRING(FB[26],10,1));
	SEND_LEVEL dvTPAll,12,MASTEROUT_VOL[12];
	[dvTPAll,1127] = FB[27][12];
	
	//137 Mic1
	MASTEROUT_VOL[14] = TYPE_CAST(MID_STRING(FB[30],10,1));
	SEND_LEVEL dvTPAll,14,MASTEROUT_VOL[14];
	[dvTPAll,1133] = FB[31][12];
	
	//137 Mic2
	MASTEROUT_VOL[15] = TYPE_CAST(MID_STRING(FB[32],10,1));
	SEND_LEVEL dvTPAll,15,MASTEROUT_VOL[15];
	[dvTPAll,1136] = FB[33][12];


	//139 VTC
	MASTEROUT_VOL[16] = TYPE_CAST(MID_STRING(FB[34],10,1));
	SEND_LEVEL dvTPAll,16,MASTEROUT_VOL[16];
	[dvTPAll,1139] = FB[35][12];
	
	//139 Mic1
	MASTEROUT_VOL[18] = TYPE_CAST(MID_STRING(FB[38],10,1));
	SEND_LEVEL dvTPAll,18,MASTEROUT_VOL[18];
	[dvTPAll,1145] = FB[39][12];
	
	//139 Mic2
	MASTEROUT_VOL[19] = TYPE_CAST(MID_STRING(FB[40],10,1));
	SEND_LEVEL dvTPAll,19,MASTEROUT_VOL[19];
	[dvTPAll,1148] = FB[41][12];

	
	
    
    nDSP_Router[1][1]=FB[11][12]
    nDSP_Router[2][1]=FB[12][12]
    nDSP_Router[1][2]=FB[13][12]
    nDSP_Router[2][2]=FB[14][12]
    nDSP_Router[1][3]=FB[15][12]
    nDSP_Router[2][3]=FB[16][12]
    
    nDSP_Partitions[1]=FB[17][12]
    nDSP_Partitions[2]=FB[18][12]
    
    if(nDSP_Partitions[1]<>nDSP_Partitions_Old[1] or nDSP_Partitions[2]<>nDSP_Partitions_Old[2])
	{
		select
		{
			active(nDSP_Partitions[1]==1 and nDSP_Partitions[2]==0) :		//AB
			{
				nCombinedMode=1
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,5,0,MUTE,0)
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,6,0,MUTE,1)
				CALL 'SET_VAL'(DSP_137_PROGRAM,GAIN,1,0,MUTE,1);
				CALL 'SET_VAL'(DSP_139_PROGRAM,GAIN,1,0,MUTE,0);
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,1,ROUTE,1)	// mics on
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,1,ROUTE,1)	// codec on
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,2,ROUTE,1)	// mics on
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,2,ROUTE,1)	// codec on
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,3,ROUTE,0)	// mics off
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,3,ROUTE,0)	// codec off
			}
			active(nDSP_Partitions[1]==0 and nDSP_Partitions[2]==1) :	//BC
			{
				nCombinedMode=2
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,5,0,MUTE,1)
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,6,0,MUTE,0)
				CALL 'SET_VAL'(DSP_137_PROGRAM,GAIN,1,0,MUTE,0);
				CALL 'SET_VAL'(DSP_139_PROGRAM,GAIN,1,0,MUTE,1);
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,1,ROUTE,0)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,1,ROUTE,0)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,3,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,3,ROUTE,1)
			}
			active(nDSP_Partitions[1]==1 and nDSP_Partitions[2]==1) :	//combined
			{
				nCombinedMode=3
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,5,0,MUTE,0)
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,6,0,MUTE,0)
				CALL 'SET_VAL'(DSP_137_PROGRAM,GAIN,1,0,MUTE,1);
				CALL 'SET_VAL'(DSP_139_PROGRAM,GAIN,1,0,MUTE,1);
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,1,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,1,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,3,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,3,ROUTE,1)
			}
			active(nDSP_Partitions[1]==0 and nDSP_Partitions[2]==0) :	//separate
			{
				nCombinedMode=4
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,5,0,MUTE,1)
				CALL 'SET_VAL'(DSP_SIDE_MICS_TO_138,AUTOMIXER,6,0,MUTE,1)
				CALL 'SET_VAL'(DSP_137_PROGRAM,GAIN,1,0,MUTE,0);
				CALL 'SET_VAL'(DSP_139_PROGRAM,GAIN,1,0,MUTE,0);
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,1,ROUTE,0)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,1,ROUTE,0)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,2,ROUTE,1)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,1,3,ROUTE,0)
//				CALL 'SET_VAL'(DSP_ROUTER,ROUTER,2,3,ROUTE,0)
			}
		}
//		send_command dvTPAll,"'@PPX'"
//		send_command dvTPAll,"'PAGE-005 Blank'"
		//NAV_populate_menu_bar(dvTP1)
		//NAV_populate_menu_bar(dvTP2)
		//NAV_populate_menu_bar(dvTP3)
		//NAV_populate_sources(dvTP1)
		//NAV_populate_sources(dvTP2)
		//NAV_populate_sources(dvTP3)
//		send_command dvTPAll,"'PAGE-002 Main Page'"
		
		
		select
		{
			active(nCombinedMode==0) :
			{
				send_command dvTpAll,"'PPON-0101 Menu Combined'"
			}
			active(nCombinedMode==1) :
			{
				send_command dvTP1,"'PPON-0101 Menu Combined;002 Main Page'"
				send_command dvTP2,"'PPON-0101 Menu Combined;002 Main Page'"
				send_command dvTP3,"'PPON-0102 Menu Separated;002 Main Page'"
			}
			active(nCombinedMode==2) :
			{
				send_command dvTP1,"'PPON-0102 Menu Separated;002 Main Page'"
				send_command dvTP2,"'PPON-0101 Menu Combined;002 Main Page'"
				send_command dvTP3,"'PPON-0101 Menu Combined;002 Main Page'"
			}
			active(nCombinedMode==3) :
			{
				send_command dvTpAll,"'PPON-0101 Menu Combined;002 Main Page'"
			}
			active(nCombinedMode==4) : 
			{
				send_command dvTP1,"'PPON-0102 Menu Separated;002 Main Page'"
				send_command dvTP2,"'PPON-0101 Menu Combined;002 Main Page'"
				send_command dvTP3,"'PPON-0102 Menu Separated;002 Main Page'"
			} 
		}
		
		send_command dvTPAll[2],"'PPON-0201 View Combine Mode;002 Main Page'"
		nTabSelected[1]=2
		nTabSelected[2]=1
		nTabSelected[3]=2
		for(x=1;x<=6;x++) nMatrixMoreSources[x]=0
    }
	
    nDSP_Partitions_Old[1]=nDSP_Partitions[1]
    nDSP_Partitions_Old[2]=nDSP_Partitions[2]
    
    MASTEROUT_VOL[06] = TYPE_CAST(MID_STRING(FB[19],10,1)); 
    SEND_LEVEL dvTPAll,06,MASTEROUT_VOL[06];
    [dvTPAll,1118] = FB[20][12];
    MASTEROUT_VOL[07] = TYPE_CAST(MID_STRING(FB[21],10,1)); 
    SEND_LEVEL dvTPAll,07,MASTEROUT_VOL[07];
    [dvTPAll,1121] = FB[22][12];
    MASTEROUT_VOL[08] = TYPE_CAST(MID_STRING(FB[23],10,1)); 
    SEND_LEVEL dvTPAll,08,MASTEROUT_VOL[08];
    [dvTPAll,1124] = FB[24][12];
	
    MASTEROUT_VOL[09] = TYPE_CAST(MID_STRING(FB[48],10,1)); 
    SEND_LEVEL dvTPAll,09,MASTEROUT_VOL[09];
    [dvTPAll,1130] = FB[49][12];
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
	//send_string 0,data.text
	if(find_string(data.text,'login:',1)) {
	    send_string data.device,"'ctrl',$0D"
	}
	if(find_string(data.text,'Password:',1)) {
	    send_string data.device,"'labrador',$0D"
	}
    }
}


DATA_EVENT   [dvMatrixSDX] {  //not used this room
    online :  {
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
	   // send_string 0,"cDataTxt[1]"
	   // send_string 0,"cDataTxt[2]"
	   // send_string 0,cDataTxt
	    cTrash=REMOVE_STRING(cDataTxt,"'O'",1)
	    if(length_string(cDataTxt)>1)
		nMtxOutput=atoi("cDataTxt[1],cDataTxt[2]")
	    else 
		nMtxOutput=atoi("cDataTxt[1]")
	   // send_string 0,"cDataTxt[1]"
	   // send_string 0,"cDataTxt[2]"
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
	/*local_var char cDataTxt[50]
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
	    if(nMtxOutput==01) send_command dvTpAll,"'^txt-1501,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==02) send_command dvTpAll,"'^txt-1502,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==03) send_command dvTpAll,"'^txt-1503,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==04) send_command dvTpAll,"'^txt-1504,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==05) send_command dvTpAll,"'^txt-1505,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==06) send_command dvTpAll,"'^txt-1506,0,',cSourceNames[nMtxInput]"
	    

	    if(nMtxOutput==10) send_command dvTpAll,"'^txt-31,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==11) send_command dvTpAll,"'^txt-32,0,',cSourceNames[nMtxInput]"
	    if(nMtxOutput==12) send_command dvTpAll,"'^txt-33,0,',cSourceNames[nMtxInput]"
	}
	*/
    }
}

DATA_EVENT   [dvTPALL]
{
    online :
	{
		local_var integer x
		nLastPanel=get_last(dvTPAll)
		for(x=1;x<=28;x++)
		{
			send_command data.device,"'^txt-',itoa(x),',0,',cSourceNames[x]"    //source names
			send_command data.device,"'^txt-',itoa(2000+x),',0,',cSourceNames[x]"    //source names
		}
		nTabSelected[nLastPanel]=0
		
		send_command data.device,"'ADBEEP'";
		send_command dvTPAll,"'TPAGEON'"	// page tracking
		send_command data.device,"'PAGE-001 Splash'"
		nRoomOnSplashPage[nLastPanel] = 1
		
		send_level data.device,11,data.device.number-9999
		send_command data.device,"'^txt-1501,0,',cSourceNames[nSourceRouted[1]]"
		send_command data.device,"'^txt-1502,0,',cSourceNames[nSourceRouted[2]]"
		send_command data.device,"'^txt-1503,0,',cSourceNames[nSourceRouted[3]]"
		send_command data.device,"'^txt-1504,0,',cSourceNames[nSourceRouted[4]]"
		send_command data.device,"'^txt-1505,0,',cSourceNames[nSourceRouted[5]]"
		send_command data.device,"'^txt-1506,0,',cSourceNames[nSourceRouted[6]]"
		send_command data.device,"'^txt-31,0,',cSourceNames[nSourceRouted[10]]"
		send_command data.device,"'^txt-32,0,',cSourceNames[nSourceRouted[11]]"
		send_command data.device,"'^txt-33,0,',cSourceNames[nSourceRouted[12]]"
		send_command data.device,"'^txt-60,1,',cContactInfo"
		send_command data.device,"'ADBEEP'"
		
		if(nLastPanel == 1 || nLastPanel == 3)
		{
			send_command data.device,"'^SHO-100,0'"	// hide combine button in menu bar for 137 and 139
			send_command data.device,"'^SHO-70,0'"		// hide town hall button for 137 and 139			
			send_command data.device,"'^SHO-71,0'"		// hide town hall button for 137 and 139			
		}
		
		send_command dvTPAll,"'TPAGEON'"
    }
	string :
	{
		local_var char cTrash[100]
		cTrash=REMOVE_STRING(data.text,"'KEYB-'",1)
		if(data.text<>'ABORT' and cTrash<>'')
		{
			cContactInfo=data.text
			send_command dvTPAll,"'^txt-60,1,',cContactInfo"
		}
		
		switch(data.device.number)
		{
			case 10001:
			{
				if(FIND_STRING(data.text,"'PAGE-'",1))
				{
					if(FIND_STRING(data.text,"'PAGE-001 Splash'",1))
					{
						nRoomOnSplashPage[1] = 1
						
						send_command dvTP2,"'^ENA-101,1'"	// enable combine button
						send_command dvTP2,"'^SHO-111,0'"	// hide lockout instructions
							
						if(nRoomOnSplashPage[3] = 1)		// hide lockout if other room is on splash
						{
							send_command dvTP2,"'^ENA-103,1'"	// enable combine button
							send_command dvTP2,"'^SHO-113,0'"	// hide lockout instructions
							
							send_command dvTP2,"'^ENA-70,1'"	// enable town hall button
							send_command dvTP2,"'^SHO-71,0'"	// hide lockout instructions
						}
					}
					else
					{
						nRoomOnSplashPage[1] = 0
						if(nCombinedMode == 2 or nCombinedMode == 4)	// if not in the combine
						{
							send_command dvTP2,"'^ENA-101,0'"	// disable combine button
							send_command dvTP2,"'^SHO-111,1'"	// show lockout instructions
							send_command dvTP2,"'^ENA-103,0'"	// disable combine button
							send_command dvTP2,"'^SHO-113,1'"
						}
						send_command dvTP2,"'^ENA-70,0'"	// disable town hall button
						send_command dvTP2,"'^SHO-71,1'"	// show lockout instructions
					}
				}
			}
			case 10003:
			{
				if(FIND_STRING(data.text,"'PAGE-'",1))
				{
					if(FIND_STRING(data.text,"'PAGE-001 Splash'",1))
					{
						nRoomOnSplashPage[3] = 1
						
						send_command dvTP2,"'^ENA-102,1'"	// enable combine button
						send_command dvTP2,"'^SHO-112,0'"	// hide lockout instructions
						
						if(nRoomOnSplashPage[1] = 1)		// hide lockout if other room is on splash
						{
							send_command dvTP2,"'^ENA-103,1'"	// enable combine button
							send_command dvTP2,"'^SHO-113,0'"	// hide lockout instructions
							
							send_command dvTP2,"'^ENA-70,1'"	// enable town hall button
							send_command dvTP2,"'^SHO-71,0'"	// hide lockout instructions
						}
					}
					else
					{
						nRoomOnSplashPage[3] = 0
						if(nCombinedMode == 1 or nCombinedMode == 4)	// if not in the combine
						{
							send_command dvTP2,"'^ENA-102,0'"	// disable combine button
							send_command dvTP2,"'^SHO-112,1'"	// show lockout instructions
							send_command dvTP2,"'^ENA-103,0'"	// disable combine button
							send_command dvTP2,"'^SHO-113,1'"
						}
						send_command dvTP2,"'^ENA-70,0'"	// disable town hall button
						send_command dvTP2,"'^SHO-71,1'"	// show lockout instructions
					}
				}
			}
		}
    }
}

DATA_EVENT   [dvRXALL]
{
    online :
	{
		send_command data.device,'SET BAUD 38400,N,8,1 DISABLE 485'
    }
    string :
	{
		// send_string 0,"'data ',itoa(get_last(dvRXAll))"
		select
		{
			active(find_string(data.text,CHRISTIE_RESP_POWER_OFF,1))      : nDisplayPower[get_last(dvRXAll)]=0
			active(find_string(data.text,CHRISTIE_RESP_POWER_COOLING,1))  : nDisplayPower[get_last(dvRXAll)]=0
			active(find_string(data.text,CHRISTIE_RESP_POWER_ON,1))       : nDisplayPower[get_last(dvRXAll)]=1
			active(find_string(data.text,CHRISTIE_RESP_POWER_WARMING,1))  : nDisplayPower[get_last(dvRXAll)]=1
			active(find_string(data.text,CHRISTIE_RESP_MUTE_OFF,1))       : nDisplayMute[get_last(dvRXAll)]=0
			active(find_string(data.text,CHRISTIE_RESP_MUTE_ON,1))        : nDisplayMute[get_last(dvRXAll)]=1
			active(find_string(data.text,CHRISTIE_RESP_INPUT_HDMI,1))     : nDisplayInput[get_last(dvRXAll)]=0
			active(find_string(data.text,CHRISTIE_RESP_INPUT_VGA,1))      : nDisplayInput[get_last(dvRXAll)]=1
		}
		
		select
		{
			active(find_string(data.text,CHRISTIE_RESP_POWER_OFF,1) or find_string(data.text,CHRISTIE_RESP_POWER_COOLING,1)):
			{
				send_command dvTpAll,"'^txt-150',itoa(get_last(dvRXAll)),',0, PROJECTOR OFF'"
			}
			active(find_string(data.text,CHRISTIE_RESP_POWER_ON,1) or find_string(data.text,CHRISTIE_RESP_POWER_WARMING,1)):
			{
				send_command dvTpAll,"'^txt-150',itoa(get_last(dvRXAll)),',0, ', cSourceNames[nSourceRouted[get_last(dvRXAll)]]"
			}
		}
    }
}

DATA_EVENT   [vdvCiscoSX80_137]
{
    ONLINE:
    {
		SEND_COMMAND data.device,"'PROPERTY-IP_Address,',cCodecIPAddress137"
		//SEND_COMMAND data.device,"'PROPERTY-Port,23'" // TELNET PORT
		SEND_COMMAND data.device,"'PROPERTY-Port,22'" // SSH PORT
		SEND_COMMAND data.device,"'PROPERTY-User_Name,',cCodecUserName" // 
		SEND_COMMAND data.device,"'PROPERTY-Password,',cCodecPassword" // 
		SEND_COMMAND data.device,"'REINIT'"
		//SEND_COMMAND data.device,"'debug-4'" // use only when debugging project.
    }
}
DATA_EVENT   [vdvCiscoSX80_138]
{
    ONLINE:
    {
		SEND_COMMAND data.device,"'PROPERTY-IP_Address,',cCodecIPAddress138"
		//SEND_COMMAND data.device,"'PROPERTY-Port,23'" // TELNET PORT
		SEND_COMMAND data.device,"'PROPERTY-Port,22'" // SSH PORT
		SEND_COMMAND data.device,"'PROPERTY-User_Name,',cCodecUserName" // 
		SEND_COMMAND data.device,"'PROPERTY-Password,',cCodecPassword" // 
		SEND_COMMAND data.device,"'REINIT'"
		//SEND_COMMAND data.device,"'debug-4'" // use only when debugging project.
    }
}
DATA_EVENT   [vdvCiscoSX80_139]
{
    ONLINE:
    {
		SEND_COMMAND data.device,"'PROPERTY-IP_Address,',cCodecIPAddress139"
		//SEND_COMMAND data.device,"'PROPERTY-Port,23'" // TELNET PORT
		SEND_COMMAND data.device,"'PROPERTY-Port,22'" // SSH PORT
		SEND_COMMAND data.device,"'PROPERTY-User_Name,',cCodecUserName" // 
		SEND_COMMAND data.device,"'PROPERTY-Password,',cCodecPassword" // 
		SEND_COMMAND data.device,"'REINIT'"
		//SEND_COMMAND data.device,"'debug-4'" // use only when debugging project.
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


CHANNEL_EVENT [vdvCiscoSX80_138,255]
{
    on :
	{
	#warn 'not specified if power should be applied to projectors when codec wakes up'
	/*
	send_string dvRXAll[3],CHRISTIE_POWER_ON
	send_string dvRXAll[4],CHRISTIE_POWER_ON
	send_level dvMatrixOutAll[3],50,1  //route VC
	send_level dvMatrixOutAll[4],50,2  //route VC
	ON[rel_138_E_DN]
	on[rel_138_N_DN]
	CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
	CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	*/
    }
}

BUTTON_EVENT[dvTPAll,nBtnsSource]		//
{
	PUSH:
	{
		integer nPanel;
		integer nInput;
		
		nPanel = get_last(dvTPAll);
		nInput = get_last(nBtnsSource);
		
		nSourceSelect[nPanel] = nInput;
	}
}
BUTTON_EVENT[dvTPAll,nBtnsDest]
{
	PUSH:
	{
		integer nPanel;
		integer nDest;
		integer nActiveAudOut;
		
		nPanel = get_last(dvTPAll);
		nDest = get_last(nBtnsDest);
		
		
		
		
		send_string 0,"'route ',itoa(nSourceSelect[nPanel]),' to ', itoa(button.input.channel-2000)"
		send_level dvMatrixOutAll[nDest],50,nSourceSelect[nPanel]			// actually route
		
		if(nDest <= 6)
		{
			if(nDisplayPower[nDest] == 0)
			{
				fnDisplayCmd(nDest, PWR_ON);
			}
			pulse[rel_Output_DN[nDest]]										// lower the screen
		}
			
//		nActiveAudOut = MODE_AUDIO_OUTPUT[nCombinedMode][nPanel];
//		if(nSourceRouted[nActiveAudOut] <> nSourceSelect[nPanel])
//		{
//			nSourceRoutedTemp[nActiveAudOut] = nSourceSelect[nPanel];
//			send_command dvTPAll[nPanel],"'PAGE-003 Audio Confirm'"
//			send_command dvTPAll[nPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
//		}
	}	
}

BUTTON_EVENT[dvTPAll,nBtnsDisplayMute]
{
	PUSH:
	{
		integer nActiveProj;
		
		nActiveProj = get_last(nBtnsDisplayMute);
		
		if(nDisplayMute[nActiveProj])
		{
			send_string dvRXAll[nActiveProj], CHRISTIE_MUTE_OFF;
		}
		else
		{
			send_string dvRXAll[nActiveProj], CHRISTIE_MUTE_ON;
		}
	}
}
BUTTON_EVENT [dvTPAll,0] {
    push : {
	nLastPanel=get_last(dvTPAll)
	select {
	    active(nCombinedMode==1) : { //AB combined
		select {
		    active(nLastPanel==1 or nLastPanel==2) : {
			dvTPLastSet[1]=dvTP1
			dvTPLastSet[2]=dvTP2
			dvTPLastSet[3]=vdvTPDummy
		    } active(nLastPanel==3) : {
			dvTPLastSet[1]=dvTP3
			dvTPLastSet[2]=vdvTPDummy
			dvTPLastSet[3]=vdvTPDummy
		    }
		}
	    } active(nCombinedMode==2) : { //BC combined
		select {
		    active(nLastPanel==2 or nLastPanel==3) : {
			dvTPLastSet[1]=dvTP2
			dvTPLastSet[2]=dvTP3
			dvTPLastSet[3]=vdvTPDummy
		    } active(nLastPanel==1) : {
			dvTPLastSet[1]=dvTP1
			dvTPLastSet[2]=vdvTPDummy
			dvTPLastSet[3]=vdvTPDummy
		    }
		}
	    } active(nCombinedMode==3) : { //all combined
		dvTPLastSet[1]=dvTP1
		dvTPLastSet[2]=dvTP2
		dvTPLastSet[3]=dvTP3
	    }  active(nCombinedMode==4) : { //all separate
		select {
		    active(nLastPanel==1) : dvTPLastSet[1]=dvTP1
		    active(nLastPanel==2) : dvTPLastSet[1]=dvTP2
		    active(nLastPanel==3) : dvTPLastSet[1]=dvTP3
		}
		dvTPLastSet[2]=vdvTPDummy
		dvTPLastSet[3]=vdvTPDummy
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,1]    //NAV - Begin (go to combine page)
{
	PUSH:
	{
		send_command dvTPAll[nLastPanel],"'PAGE-005 Blank'"
		//NAV_populate_menu_bar(dvTPAll[nLastPanel])
		//NAV_populate_sources(dvTPAll[nLastPanel])
		//NAV_populate_display_page(dvTPAll[nLastPanel])
		send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
		send_command dvTPAll[nLastPanel],"'@PPX'"
		NAV_popUpBottomMenu()
		if(nLastPanel == 2)
		{
			send_command dvTPAll[nLastPanel],"'PPON-0201 View Combine Mode'"
			nTabSelected[nLastPanel]=1
		}
		else
		{
			NAV_select_vid_page()
			nTabSelected[nLastPanel]=2
		}
		send_command dvTPAll ,"'TPAGEON'"
		
		
		if(nLastPanel == 1 and nCombinedMode == 4)
		{
			send_level dvMatrixOutAll[1],50,18
			send_level dvMatrixOutAll[5],50,18
		}
		if(nLastPanel == 3 and nCombinedMode == 4)
		{
			send_level dvMatrixOutAll[3],50,15
			send_level dvMatrixOutAll[4],50,15
		}
		if(nLastPanel == 2)
		{
			send_level dvMatrixOutAll[2],50,14
			switch(nCombinedMode)
			{
				case 1:	
				{
					send_level dvMatrixOutAll[1],50,14
					send_level dvMatrixOutAll[5],50,14
				}
				case 2:
				{
					send_level dvMatrixOutAll[3],50,14
					send_level dvMatrixOutAll[4],50,14
				}
				case 3:
				{
					send_level dvMatrixOutAll[1],50,14
					send_level dvMatrixOutAll[5],50,14
					send_level dvMatrixOutAll[3],50,14
					send_level dvMatrixOutAll[4],50,14
				}
			}
		}
	}
}

//BUTTON_EVENT [dvTPAll,2]    //NAV - Unlock (go to combine page)
//{
//PUSH: 
//    {
//	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
//	send_command dvTPAll[nLastPanel],"'@PPX'"
//	NAV_popUpBottomMenu()
//	send_command dvTPAll[nLastPanel],"'PPON-0202 Change Combine Mode'"
//    }
//}

BUTTON_EVENT [dvTPAll,3]	//NAV - Video Routing Page
{
    PUSH: nav_select_vid_page();
}



BUTTON_EVENT [dvTPAll,4]	//NAV - VC Content Page
{
    PUSH:
	{
		send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
		send_command dvTPAll[nLastPanel],"'@PPX'"
		NAV_popUpBottomMenu()
		nTabSelected[nLastPanel]=4
		
		select
		{
			active(nCombinedMode==1 and nLastPanel<3) :  send_command dvTPAll[nLastPanel],"'PPON-0232 Select VC Content AB'"
			active(nCombinedMode==2 and nLastPanel>1) :  send_command dvTPAll[nLastPanel],"'PPON-0233 Select VC Content BC'"
			active(nCombinedMode==3) :                   send_command dvTPAll[nLastPanel],"'PPON-0231 Select VC Content Combined'"
			active(nCombinedMode==4 and nLastPanel==2) : send_command dvTPAll[nLastPanel],"'PPON-0234 Select VC Content B'"
			active(nCombinedMode==4 and nLastPanel==1) : send_command dvTPAll[nLastPanel],"'PPON-0235 Select VC Content A'"
			active(nCombinedMode==4 and nLastPanel==3) : send_command dvTPAll[nLastPanel],"'PPON-0236 Select VC Content C'"
		}
    }
}


BUTTON_EVENT [dvTPAll,5]	//NAV - Audio Routing Page
{
    PUSH:
	{
		send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
		send_command dvTPAll[nLastPanel],"'@PPX'"
		NAV_popUpBottomMenu()
		nTabSelected[nLastPanel]=5
		select
		{
			active(nCombinedMode==1 and nLastPanel<3) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0213 Select Audio Group AB'"
//				send_command dvTPAll[nLastPanel],"'PPON-0252 Select Audio AB'"
			}
			active(nCombinedMode==1 and nLastPanel>2) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0212 Select Audio Group 3'"
//				send_command dvTPAll[nLastPanel],"'PPON-0256 Select Audio C'"
			}
			active(nCombinedMode==2 and nLastPanel<2) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0210 Select Audio Group 1'"
//				send_command dvTPAll[nLastPanel],"'PPON-0254 Select Audio A'"
			}
			active(nCombinedMode==2 and nLastPanel>1) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0214 Select Audio Group BC'"
//				send_command dvTPAll[nLastPanel],"'PPON-0253 Select Audio BC'"
			}
			active(nCombinedMode==3) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0215 Select Audio Group ABC'"
//				send_command dvTPAll[nLastPanel],"'PPON-0251 Select Audio Combined'"
			}
			active(nCombinedMode==4 and nLastPanel==1) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0210 Select Audio Group 1'"
//				send_command dvTPAll[nLastPanel],"'PPON-0254 Select Audio A'"
			}
			active(nCombinedMode==4 and nLastPanel==2) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
//				send_command dvTPAll[nLastPanel],"'PPON-0255 Select Audio B'"
			}
			active(nCombinedMode==4 and nLastPanel==3) :
			{
				send_command dvTPAll[nLastPanel],"'PPON-0212 Select Audio Group 3'"
//				send_command dvTPAll[nLastPanel],"'PPON-0256 Select Audio C'"
			}
		}
    }
}

BUTTON_EVENT [dvTPAll,6] {  //NAV - IPTV PAGE
    PUSH: {
	nTabSelected[nLastPanel]=6
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	NAV_popUpBottomMenu()
	send_command dvTPAll[nLastPanel],"'PPON-0226 IPTV'"
    }
}

BUTTON_EVENT [dvTPAll,7] {  //NAV - Display Power Page
    PUSH: {
	nTabSelected[nLastPanel]=7
	/*send_string dvRXAll[1],CHRISTIE_GET_SYS_INFO //check service hours
	send_string dvRXAll[2],CHRISTIE_GET_SYS_INFO //check service hours
	send_string dvRXAll[3],CHRISTIE_GET_SYS_INFO //check service hours
	send_string dvRXAll[4],CHRISTIE_GET_SYS_INFO //check service hours
	send_string dvRXAll[5],CHRISTIE_GET_SYS_INFO //check service hours
	send_string dvRXAll[6],CHRISTIE_GET_SYS_INFO //check service hours*/
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	NAV_popUpBottomMenu()
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
	nTabSelected[nLastPanel]=8
	send_command vdvPowerController,'?UPSINPUTPROPERTY-ENERGY_USED'
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	NAV_popUpBottomMenu()
	send_command dvTPAll[nLastPanel],"'PPON-0221 Help'"
    }
}



BUTTON_EVENT [dvTPAll,011]  //combine Modes
BUTTON_EVENT [dvTPAll,012]  //combine Modes
BUTTON_EVENT [dvTPAll,013]  //combine Modes
BUTTON_EVENT [dvTPAll,014]  //combine Modes
{
	PUSH: 
    {
		local_var integer nTmpButton
		local_var integer x
		nTmpButton=button.input.channel-10
		for(x=1;x<=6;x++) nMatrixMoreSources[x]=0
		select
		{
			active(nTmpButton==1) :
			{   //AB 
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,PARTITION,0)//CLOSE PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,2,0,PARTITION,0)//CLOSE PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,2,0,PARTITION,0)//CLOSE PARTITION
			}
			active(nTmpButton==2) :
			{ //BC 
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,PARTITION,1)//OPEN PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,2,0,PARTITION,1)//OPEN PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,2,0,PARTITION,1)//OPEN PARTITION
				
				fnDisplayCmd(4, PWR_OFF);
			}
			active(nTmpButton==3) :
			{ //all combined 
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,PARTITION,1)//OPEN PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,2,0,PARTITION,1)//OPEN PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,1,0,PARTITION,1)//OPEN PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,2,0,PARTITION,1)//OPEN PARTITION
				
				fnDisplayCmd(4, PWR_OFF);
			}
			active(nTmpButton==4) :
			{ //all separate
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,PARTITION,0)//CLOSE PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,2,0,PARTITION,0)//CLOSE PARTITION
				
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,1,0,PARTITION,0)//CLOSE PARTITION
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,2,0,PARTITION,0)//CLOSE PARTITION
			}
		}
		
//		send_command dvTPAll,"'@PPX'"
//		send_command dvTPAll,"'PAGE-005 Blank'"
//		//NAV_populate_menu_bar(dvTP1)
//		//NAV_populate_menu_bar(dvTP2)
//		//NAV_populate_menu_bar(dvTP3)
//		//NAV_populate_sources(dvTP1)
//		//NAV_populate_sources(dvTP2)
//		//NAV_populate_sources(dvTP3)
//		send_command dvTPAll,"'PAGE-002 Main Page'"
//
//		nCombinedMode = nTmpButton;
//		select
//		{
//			active(nCombinedMode==0) :
//			{
//				send_command dvTpAll,"'PPON-0101 Menu Combined'"
//			}
//			active(nCombinedMode==1) :
//			{
//				send_command dvTP1,"'PPON-0101 Menu Combined'"
//				send_command dvTP2,"'PPON-0101 Menu Combined'"
//				send_command dvTP3,"'PPON-0102 Menu Separated'"
//			}
//			active(nCombinedMode==2) :
//			{
//				send_command dvTP1,"'PPON-0102 Menu Separated'"
//				send_command dvTP2,"'PPON-0101 Menu Combined'"
//				send_command dvTP3,"'PPON-0101 Menu Combined'"
//			}
//			active(nCombinedMode==3) :
//			{		
//				send_command dvTpAll,"'PPON-0101 Menu Combined'"
//			}
//			active(nCombinedMode==4) :
//			{
//				send_command dvTP1,"'PPON-0102 Menu Separated'"
//				send_command dvTP2,"'PPON-0101 Menu Combined'"
//				send_command dvTP3,"'PPON-0102 Menu Separated'"
//			} 
//		}   
//			nTabSelected[1]=1
//			nTabSelected[2]=1
//			nTabSelected[3]=1

    }
}

BUTTON_EVENT [dvTPAll,017]  //NAV - Shutdown
{
    PUSH:
	{
		local_var integer x
		select
		{
			active(nCombinedMode==1) : //AB
			{
				select
				{
					active(button.input.device.number==10001 or button.input.device.number==10002) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)
						send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
						pulse[rel_137_W_up]
						pulse[rel_137_N_up]
						pulse[rel_138_N_up]
						pulse[rel_138_E_up]
						wait 60
						{
							send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[1], "'PAGE-001 Splash'"
						send_command dvTPAll[2], "'PAGE-001 Splash'"
					}
					active(button.input.device.number==10003) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
						send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						pulse[rel_139_L_up]
						pulse[rel_139_R_up]
						wait 60
						{
							send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[3], "'PAGE-001 Splash'"
					}
				}
			}
			active(nCombinedMode==2) :  //BC
			{
				select
				{
					active(button.input.device.number==10002 or button.input.device.number==10003) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
						send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						pulse[rel_138_N_up]
						pulse[rel_138_E_up]
						pulse[rel_139_L_up]
						pulse[rel_139_R_up]
						wait 60
						{
							send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[2], "'PAGE-001 Splash'"
						send_command dvTPAll[3], "'PAGE-001 Splash'"
					}
					active(button.input.device.number==10001) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)						
						send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
						pulse[rel_137_W_up]
						pulse[rel_137_N_up]
						wait 60
						{
							send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[1], "'PAGE-001 Splash'"
					}
				}
			}
			active(nCombinedMode==3) :  //All Combine
			{
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,1)//MUTE
				CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
				send_string dvRXAll[1],CHRISTIE_POWER_OFF
				send_string dvRXAll[2],CHRISTIE_POWER_OFF
				send_string dvRXAll[3],CHRISTIE_POWER_OFF
				send_string dvRXAll[4],CHRISTIE_POWER_OFF
				send_string dvRXAll[5],CHRISTIE_POWER_OFF
				send_string dvRXAll[6],CHRISTIE_POWER_OFF
				pulse[rel_137_W_up]
				pulse[rel_137_N_up]
				pulse[rel_138_N_up]
				pulse[rel_138_E_up]
				pulse[rel_139_L_up]
				pulse[rel_139_R_up]
				wait 60
				{
					send_string dvRXAll[1],CHRISTIE_POWER_OFF
					send_string dvRXAll[2],CHRISTIE_POWER_OFF
					send_string dvRXAll[3],CHRISTIE_POWER_OFF
					send_string dvRXAll[4],CHRISTIE_POWER_OFF
					send_string dvRXAll[5],CHRISTIE_POWER_OFF
					send_string dvRXAll[6],CHRISTIE_POWER_OFF
				}
				
				send_command dvTPAll[1], "'PAGE-001 Splash'"
				send_command dvTPAll[2], "'PAGE-001 Splash'"
				send_command dvTPAll[3], "'PAGE-001 Splash'"
			}
			active(nCombinedMode==4) : //Separated
			{
				select
				{
					active(button.input.device.number==10001) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)
						send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
						pulse[rel_137_W_up]
						pulse[rel_137_N_up]
						wait 60
						{
							send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[1], "'PAGE-001 Splash'"
					}
					active(button.input.device.number==10002) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1) 
						CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1) 
						send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
						pulse[rel_138_N_up]
						pulse[rel_138_E_up]
						wait 60
						{
							send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[2], "'PAGE-001 Splash'"
					}
					active(button.input.device.number==10003) :
					{
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,1)//MUTE
						CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
						CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
						send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
						send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						pulse[rel_139_L_up]
						pulse[rel_139_R_up]
						wait 60
						{
							send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
							send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
						}
						
						send_command dvTPAll[3], "'PAGE-001 Splash'"
					}
				}
			}
		}
    }
}

BUTTON_EVENT [dvTPAll,020] { //NAV - Tech contact
    push : {
	send_command button.input.device,"'@AKB-',cContactInfo,';Please enter the contact info...'"
    }
}


BUTTON_EVENT [dvTPAll,051] { //audio confirm yes
    push :
	{
		NAV_select_vid_page()
		select
		{
			active(nCombinedMode==1) :
			{
				select
				{
					active(button.input.device==10001 or button.input.device==10002) :
					{
						send_level dvMatrixOutAll[13],50,nSourceRoutedTemp[13]
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)
					}
				}
				select
				{
					active(button.input.device==10003) :
					{
					send_level dvMatrixOutAll[14],50,nSourceRoutedTemp[14]
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,0)//UNMUTE
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_GAIN,66)
					}
				}
			}
			active(nCombinedMode==2) :
			{
				select
				{
					active(button.input.device==10002 or button.input.device==10003) :
					{
					send_level dvMatrixOutAll[13],50,nSourceRoutedTemp[13]
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)
					}
				} 
				select
				{
					active(button.input.device==10001) :
					{
					send_level dvMatrixOutAll[12],50,nSourceRoutedTemp[12]
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,0)//UNMUTE
					CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_GAIN,66)
					}
				}
			} 
			active(nCombinedMode==3) :
			{
				send_level dvMatrixOutAll[13],50,nSourceRoutedTemp[13]
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)
			} 
			active(nCombinedMode==4) :
			{
				select
				{
					active(button.input.device==10001) :
					{
						send_level dvMatrixOutAll[12],50,nSourceRoutedTemp[12]
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,0)//UNMUTE
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_GAIN,66)
					}
				}
				select
				{
					active(button.input.device==10002) :
					{
						send_level dvMatrixOutAll[13],50,nSourceRoutedTemp[13]
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)
					}
				}
				select
				{
					active(button.input.device==10003) :
					{
						send_level dvMatrixOutAll[14],50,nSourceRoutedTemp[14]
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,0)//UNMUTE
						CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_GAIN,66)
					}
				}
			}
		}
    }
}

BUTTON_EVENT [dvTPAll, nBtnsAudio]
{
	PUSH:
	{
		integer nPanel;
		integer nAudSelect;
		integer nActiveAudOut;
		
		nPanel = GET_LAST(dvTPAll);
		nAudSelect = GET_LAST(nBtnsAudio);
		nActiveAudOut = MODE_AUDIO_OUTPUT[nCombinedMode][nPanel];
		
		if(nCombinedMode < 4)
		{
			CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
		}
		else
		{
			CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,nPanel,0,SOURCE_MUTE,0)//UNMUTE
		}
		
		send_level dvMatrixOutAll[nActiveAudOut],50,nSourceRouted[nAudSelect]
		send_level dvMatrixOutAll[nActiveAudOut],51,nSourceRouted[nAudSelect]
		
		SEND_STRING 0, "'Panel ', itoa(nPanel),', Button ',itoa(nAudSelect),', nActiveAudOut ',itoa(nActiveAudOut)"
	}
}

BUTTON_EVENT [dvTPAll,052] { //audio confirm no
    push : {
	NAV_select_vid_page()
    }
}

BUTTON_EVENT [dvTPAll,70]	// Town Hall Button
{
	PUSH:
	{
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,PARTITION,1)//OPEN PARTITION
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,PARTITION,1)//OPEN PARTITION
		
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,1,0,PARTITION,1)//OPEN PARTITION
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_MICS,2,0,PARTITION,1)//OPEN PARTITION
		
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,1,0,PARTITION,1)//OPEN PARTITION
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_VTC,2,0,PARTITION,1)//OPEN PARTITION
		
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,0)//UNMUTE
		
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
		CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,1) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,0) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,0) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,0) 
		CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,0) 
		CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,0)
		CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,0)
		CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,0)
		CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,0)
		
		fnDisplayCmd(1, PWR_OFF);
		fnDisplayCmd(2, PWR_ON);
		fnDisplayCmd(3, PWR_ON);
		fnDisplayCmd(4, PWR_OFF);
		fnDisplayCmd(5, PWR_ON);
		fnDisplayCmd(6, PWR_ON);
		
		pulse[rel_Output_UP[1]];
		pulse[rel_Output_DN[2]];
		pulse[rel_Output_DN[3]];
		pulse[rel_Output_UP[4]];
		pulse[rel_Output_DN[5]];
		pulse[rel_Output_DN[6]];
		
		send_level dvMatrixOutAll[1],50,14;
		send_level dvMatrixOutAll[5],50,14;
		send_level dvMatrixOutAll[3],50,14;
		send_level dvMatrixOutAll[4],50,14;

		
		nCombinedMode = 3;	// force combined mode for proper panel function
		
		NAV_select_vid_page();
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
BUTTON_EVENT [dvTPAll,115]  //MATRIX ROUTE VIDEO
{
    PUSH:
	{
		LOCAL_VAR INTEGER nOffset
		nOffSet=100
		send_string 0,"'route ',itoa(button.input.channel-100),' to 1'"
		send_level dvMatrixOutAll[1],50,button.input.channel-100			// actually route
		send_string dvRXAll[1],CHRISTIE_POWER_ON							// turn the display on
		pulse[rel_137_W_DN]													// lower the screen
		cancel_wait 'proj1mute'
		wait nProjMuteWait 'proj1mute' send_string dvRXAll[1],CHRISTIE_MUTE_OFF
		cancel_wait 'proj1input'
		wait nProjInputWait 'proj1input' send_string dvRXAll[1],CHRISTIE_INPUT_HDMI
		
		select
		{
			active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) :
			{
				CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
				CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
			}
			active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) :		// if a button is pressed
			{ 
				select
				{
					active(nCombinedMode==1) :
					{
						select
						{
							active(button.input.device==10001 or button.input.device==10002) :
							{
								if(nSourceRouted[11]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[11]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
								}
							}
							active(button.input.device==10003) :
							{
								if(nSourceRouted[12]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[12]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
								}
							}
						}
					}
					active(nCombinedMode==2) :
					{
						select
						{
							active(button.input.device==10002 or button.input.device==10003) :
							{
								if(nSourceRouted[11]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[11]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
								}
							}
							active(button.input.device==10001) :
							{
								if(nSourceRouted[10]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[10]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
								}
							}
						}
					}
					active(nCombinedMode==3) :
					{
						if(nSourceRouted[11]<>button.input.channel-nOffset)
						{
							nSourceRoutedTemp[11]=button.input.channel-nOffset
							send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
							send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
						}
					}
					active(nCombinedMode==4) :
					{
						select
						{
							active(button.input.device==10001) :
							{
								if(nSourceRouted[10]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[10]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
								}
							}
							active(button.input.device==10002) :
							{
								if(nSourceRouted[11]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[11]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
								}
							}
							active(button.input.device==10003) :
							{
								if(nSourceRouted[12]<>button.input.channel-nOffset)
								{
									nSourceRoutedTemp[12]=button.input.channel-nOffset
									send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
									send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
								}
							} 
						}
					} 
				}
			}
		}
    }
}
BUTTON_EVENT [dvTPAll,125] { //MATRIX POWER OFF
    PUSH: {
	send_string 0,"'proj 1 off'"
	send_string dvRXAll[1],CHRISTIE_POWER_OFF
	wait 60 send_string dvRXAll[1],CHRISTIE_POWER_OFF
	pulse[rel_137_W_UP]
    }
}
BUTTON_EVENT [dvTPAll,126]  //MATRIX VID MUTE
{
PUSH: //
    {
	send_string 0,"'proj 1 mute'"
	send_string dvRXAll[1],CHRISTIE_MUTE_ON
    }
}
BUTTON_EVENT [dvTPAll,127]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=1
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
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
	send_string dvRXAll[2],CHRISTIE_POWER_ON
	pulse[rel_137_N_DN]
	cancel_wait 'proj2mute'
	wait nProjMuteWait 'proj2mute' send_string dvRXAll[2],CHRISTIE_MUTE_OFF
	cancel_wait 'proj2input'
	wait nProjInputWait 'proj2input' send_string dvRXAll[2],CHRISTIE_INPUT_HDMI
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		select {
		    active(nCombinedMode==1) : {
			select {
			    active(button.input.device==10001 or button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==2) : {
			select {
			    active(button.input.device==10002 or button.input.device==10003) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==3) : {
			if(nSourceRouted[11]<>button.input.channel-nOffset) {
			    nSourceRoutedTemp[11]=button.input.channel-nOffset
			    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
			    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
			}
		    } active(nCombinedMode==4) : {
			select {
			    active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    } 
			}
		    } 
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
	send_string dvRXAll[2],CHRISTIE_POWER_OFF
	pulse[rel_137_N_UP]
    }
}

BUTTON_EVENT [dvTPAll,226]  //MATRIX VID MUTE
{
PUSH: //
    {
	send_string 0,"'proj 2 mute'"
	send_string dvRXAll[2],CHRISTIE_MUTE_ON
    }
}
BUTTON_EVENT [dvTPAll,227]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=2
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
    }
}
BUTTON_EVENT [dvTPAll,301]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,302]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,303]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,304]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,305]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,306]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,307]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,308]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,309]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,310]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,311]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,312]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,313]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,314]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,315]  //MATRIX ROUTE VIDEO
{
PUSH: //
    {
	local_var integer nOffset
	nOffset=300
	send_level dvMatrixOutAll[3],50,button.input.channel-300
	send_string dvRXAll[3],CHRISTIE_POWER_ON
	pulse[rel_138_N_DN]
	cancel_wait 'proj3mute'
	wait nProjMuteWait 'proj3mute' send_string dvRXAll[3],CHRISTIE_MUTE_OFF
	cancel_wait 'proj3input'
	wait nProjInputWait 'proj3input' send_string dvRXAll[3],CHRISTIE_INPUT_HDMI
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		select {
		    active(nCombinedMode==1) : {
			select {
			    active(button.input.device==10001 or button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==2) : {
			select {
			    active(button.input.device==10002 or button.input.device==10003) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==3) : {
			if(nSourceRouted[11]<>button.input.channel-nOffset) {
			    nSourceRoutedTemp[11]=button.input.channel-nOffset
			    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
			    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
			}
		    } active(nCombinedMode==4) : {
			select {
			    active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    } 
			}
		    } 
		}
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,325]  //MATRIX POWER OFF
{
PUSH: //
    {
	send_string 0,"'proj 3 off'"
	send_string dvRXAll[3],CHRISTIE_POWER_OFF
	pulse[rel_138_N_UP]
    }
}

BUTTON_EVENT [dvTPAll,326]  //MATRIX VID MUTE
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 3 mute'"
	send_string dvRXAll[3],CHRISTIE_MUTE_ON
    }
}
BUTTON_EVENT [dvTPAll,327]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=3
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
    }
}

BUTTON_EVENT [dvTPAll,401]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,402]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,403]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,404]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,405]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,406]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,407]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,408]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,409]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,410]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,411]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,412]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,413]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,414]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,415]  //MATRIX ROUTE VIDEO
{
PUSH: //
    {
	local_var integer nOffset
	nOffset=400
	send_level dvMatrixOutAll[4],50,button.input.channel-400
	send_string dvRXAll[4],CHRISTIE_POWER_ON
	//pulse[rel_138_E_DN]
	cancel_wait 'proj4mute'
	wait nProjMuteWait 'proj4mute' send_string dvRXAll[4],CHRISTIE_MUTE_OFF
	cancel_wait 'proj4input'
	wait nProjInputWait 'proj4input' send_string dvRXAll[4],CHRISTIE_INPUT_HDMI
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		select {
		    active(nCombinedMode==1) : {
			select {
			    active(button.input.device==10001 or button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==2) : {
			select {
			    active(button.input.device==10002 or button.input.device==10003) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==3) : {
			if(nSourceRouted[11]<>button.input.channel-nOffset) {
			    nSourceRoutedTemp[11]=button.input.channel-nOffset
			    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
			    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
			}
		    } active(nCombinedMode==4) : {
			select {
			    active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    } 
			}
		    } 
		}
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,425]  //MATRIX POWER OFF
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 4 off'"
	send_string dvRXAll[4],CHRISTIE_POWER_OFF
	pulse[rel_138_E_UP]
    }
}

BUTTON_EVENT [dvTPAll,426]  //MATRIX VID MUTE
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 4 mute'"
	send_string dvRXAll[4],CHRISTIE_MUTE_ON
    }
}

BUTTON_EVENT [dvTPAll,427]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=4
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
    }
}
BUTTON_EVENT [dvTPAll,501]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,502]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,503]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,504]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,505]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,506]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,507]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,508]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,509]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,510]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,511]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,512]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,513]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,514]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,515]  //MATRIX ROUTE VIDEO
{
PUSH: //
    {
	local_var integer nOffset
	nOffset=500
	send_level dvMatrixOutAll[5],50,button.input.channel-500
	send_string dvRXAll[5],CHRISTIE_POWER_ON
	pulse[rel_139_L_DN]
	cancel_wait 'proj5mute'
	wait nProjMuteWait 'proj5mute' send_string dvRXAll[5],CHRISTIE_MUTE_OFF
	cancel_wait 'proj5input'
	wait nProjInputWait 'proj5input' send_string dvRXAll[5],CHRISTIE_INPUT_HDMI
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		select {
		    active(nCombinedMode==1) : {
			select {
			    active(button.input.device==10001 or button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==2) : {
			select {
			    active(button.input.device==10002 or button.input.device==10003) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==3) : {
			if(nSourceRouted[11]<>button.input.channel-nOffset) {
			    nSourceRoutedTemp[11]=button.input.channel-nOffset
			    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
			    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
			}
		    } active(nCombinedMode==4) : {
			select {
			    active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    } 
			}
		    } 
		}
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,525]  //MATRIX POWER OFF
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 5 off'"
	send_string dvRXAll[5],CHRISTIE_POWER_OFF
	pulse[rel_139_L_UP]
    }
}

BUTTON_EVENT [dvTPAll,526]  //MATRIX VID MUTE
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 5 mute'"
	send_string dvRXAll[5],CHRISTIE_MUTE_ON
    }
}

BUTTON_EVENT [dvTPAll,527]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=5
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
    }
}
BUTTON_EVENT [dvTPAll,601]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,602]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,603]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,604]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,605]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,606]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,607]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,608]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,609]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,610]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,611]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,612]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,613]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,614]  //MATRIX ROUTE VIDEO
BUTTON_EVENT [dvTPAll,615]  //MATRIX ROUTE VIDEO
{
PUSH: //RAMP UP
    {
	local_var integer nOffset
	nOffset=600
	send_level dvMatrixOutAll[6],50,button.input.channel-600
	send_string dvRXAll[6],CHRISTIE_POWER_ON
	pulse[rel_139_R_DN]
	cancel_wait 'proj6mute'
	wait nProjMuteWait 'proj6mute' send_string dvRXAll[6],CHRISTIE_MUTE_OFF
	cancel_wait 'proj6input'
	wait nProjInputWait 'proj6input' send_string dvRXAll[6],CHRISTIE_INPUT_HDMI
	select {
	    active(button.input.channel-nOffset==SRC_CODEC_FAR_END or button.input.channel-nOffset==SRC_CODEC_CONTENT or button.input.channel-nOffSet==SRC_CODEC_DVI_OUT or button.input.channel-nOffset==SRC_CAMERA) : {
		CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
		CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    } active(button.input.channel-nOffset >=1 and button.input.channel-nOffset <=16) : { 
		select {
		    active(nCombinedMode==1) : {
			select {
			    active(button.input.device==10001 or button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==2) : {
			select {
			    active(button.input.device==10002 or button.input.device==10003) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    }
			}
		    } active(nCombinedMode==3) : {
			if(nSourceRouted[11]<>button.input.channel-nOffset) {
			    nSourceRoutedTemp[11]=button.input.channel-nOffset
			    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
			    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
			}
		    } active(nCombinedMode==4) : {
			select {
			    active(button.input.device==10001) : {
				if(nSourceRouted[10]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[10]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[10]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10002) : {
				if(nSourceRouted[11]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[11]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[11]]),' in the Room Speakers?'"
				}
			    } active(button.input.device==10003) : {
				if(nSourceRouted[12]<>button.input.channel-nOffset) {
				    nSourceRoutedTemp[12]=button.input.channel-nOffset
				    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
				    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[12]]),' in the Room Speakers?'"
				}
			    } 
			}
		    } 
		}
	    }
	}
    }
}

BUTTON_EVENT [dvTPAll,625]    //MATRIX POWER OFF
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 6 off'"
	send_string dvRXAll[6],CHRISTIE_POWER_OFF
	pulse[rel_139_R_UP]
    }
}

BUTTON_EVENT [dvTPAll,626]    //MATRIX VID MUTE
{
PUSH: //RAMP UP
    {
	send_string 0,"'proj 2 mute'"
	send_string dvRXAll[6],CHRISTIE_MUTE_ON
    }
}
BUTTON_EVENT [dvTPAll,627]  //MATRIX MORE SOURCES
{
PUSH: //
    {
	local_var integer n
	n=6
	nMatrixMoreSources[n]=!nMatrixMoreSources[n]
	NAV_select_vid_page()
    }
}



BUTTON_EVENT [dvTPAll,701]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,702]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,703]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,704]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,705]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,706]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,707]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,708]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,709]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,710]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,711]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,712]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,713]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,714]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,715]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,716]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,717]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,718]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,719]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,720]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,721]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,722]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,723]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,724]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,725]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,726]    //MATRIX ROUTE AUDIO  -  Group 1 
BUTTON_EVENT [dvTPAll,727]  { //MATRIX ROUTE AUDIO  -  Group 1 
    push :
	{
		select
		{
			active(button.input.channel-700==SRC_MUTE_ALL) :
			{
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,1)//MUTE
				CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)
			}
			active(button.input.channel-700==SRC_VID_CONF_AUD) :
			{
				CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,0) 
				CALL 'SET_GAIN%'(DSP_VC_GAIN_137,GAIN,1,0,66)
			}
			active(1) :
			{
				send_level dvMatrixOutAll[12],50,button.input.channel-700
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,0)//UNMUTE
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_GAIN,66)
			}
		}
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
    push :
	{
	select
	{
	    active(button.input.channel-800==SRC_MUTE_ALL) :
		{
			CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,1)//MUTE
			CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,1) 
			CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,1,0,MUTE,1) 
			CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,2,0,MUTE,1) 
			CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,3,0,MUTE,1)
			CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,4,0,MUTE,1)
			if(nCombinedMode = 1 or nCombinedMode == 3)
			{
				CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_137,AUTOMIXER,2,0,MUTE,1)
			}
			if(nCombinedMode = 2 or nCombinedMode == 3)
			{
				CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
			}
	    }
		active(button.input.channel-800>=SRC_MIC_1 and button.input.channel-800<=SRC_MIC_3) :
		{
			CALL 'SET_VAL'(DSP_AUTOMIX,AUTOMIXER,button.input.channel-817,0,MUTE,0) 
			CALL 'SET_GAIN%'(DSP_AUTOMIX,AUTOMIXER,button.input.channel-817,0,66)
	    }
		active(button.input.channel-800==SRC_VID_CONF_AUD) :
		{
			CALL 'SET_VAL'(DSP_VC_GAIN,GAIN,1,0,MUTE,0) 
			CALL 'SET_GAIN%'(DSP_VC_GAIN,GAIN,1,0,66)
	    }
		active(1) :
		{
			send_level dvMatrixOutAll[13],50,button.input.channel-800
			CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)//UNMUTE
			CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)
	    }
	}
    }
}


BUTTON_EVENT [dvTPAll,901]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,902]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,903]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,904]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,905]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,906]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,907]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,908]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,909]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,910]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,911]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,912]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,913]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,914]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,915]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,916]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,917]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,918]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,919]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,920]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,921]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,922]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,923]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,924]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,925]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,926]    //MATRIX ROUTE AUDIO  -  Group 3 
BUTTON_EVENT [dvTPAll,927]  { //MATRIX ROUTE AUDIO  -  Group 3 
    push :
	{
		select
		{
			active(button.input.channel-900==SRC_MUTE_ALL) :
			{
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,1)//MUTE
				CALL 'SET_VAL'(DSP_VC_GAIN_137,GAIN,1,0,MUTE,1) 
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,1,0,MUTE,1)
				CALL 'SET_VAL'(DSP_MIC_AUTOMIX_139,AUTOMIXER,2,0,MUTE,1)
			}
			active(button.input.channel-900==SRC_VID_CONF_AUD) :
			{
				CALL 'SET_VAL'(DSP_VC_GAIN_139,GAIN,1,0,MUTE,0) 
				CALL 'SET_GAIN%'(DSP_VC_GAIN_139,GAIN,1,0,66)
			}
			active(1) :
			{
				send_level dvMatrixOutAll[14],50,button.input.channel-900
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,0)//UNMUTE
				CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_GAIN,66)
			}
		}
    }
}

BUTTON_EVENT [dvTPAll,nBtnsVtcContent138]  	//Select VC Content
{
    push :
	{
		integer nPanel;
		integer nBtn;
		nPanel = get_last(dvTPAll);
		nBtn = get_last(nBtnsVtcContent138);
		
		send_level dvMatrixOutAll[10],50,nBtn					//send video to Codec (DVI)
		send_level dvMatrixOutAll[13],50,nBtn					//must also change program audio because no audio de-embedder was used on output 9
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN,N_GAIN,6,0,MUTE,0)	//unmute audio to codec
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_MUTE,0)	//UNMUTE audio heard locally
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,2,0,SOURCE_GAIN,66)	//set normal volume locally
		on[vdvCiscoSX80_138,301]
		
    }
}
BUTTON_EVENT [dvTPAll,nBtnsVtcContent137]  	//Select VC Content
{
    push :
	{
		integer nPanel;
		integer nBtn;
		nPanel = get_last(dvTPAll);
		nBtn = get_last(nBtnsVtcContent137);
		
		send_level dvMatrixOutAll[9],50,nBtn						//send video to Codec (DVI)
		send_level dvMatrixOutAll[12],50,nBtn						//must also change program audio because no audio de-embedder was used on output 9
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN_137,GAIN,1,0,MUTE,0)	//unmute audio to codec
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_MUTE,0)		//UNMUTE audio heard locally
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,1,0,SOURCE_GAIN,66)		//set normal volume locally
		on[vdvCiscoSX80_137,301]
		
    }
}
BUTTON_EVENT [dvTPAll,nBtnsVtcContent139]  	//Select VC Content
{
    push :
	{
		integer nPanel;
		integer nBtn;
		nPanel = get_last(dvTPAll);
		nBtn = get_last(nBtnsVtcContent139);
		
		send_level dvMatrixOutAll[11],50,nBtn						//send video to Codec (DVI)
		send_level dvMatrixOutAll[14],50,nBtn						//must also change program audio because no audio de-embedder was used on output 9
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN_139,GAIN,1,0,MUTE,0)	//unmute audio to codec
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_MUTE,0)		//UNMUTE audio heard locally
		CALL 'SET_ROOMCOMBINE'(DSP_COMBINE_PROG,3,0,SOURCE_GAIN,66)		//set normal volume locally
		on[vdvCiscoSX80_139,301]
		
    }
}
BUTTON_EVENT [dvTPAll,1028]	//Select VC Content None
{
    push :
	{
		integer nPanel;
		nPanel = get_last(dvTPAll);
		
		send_level dvMatrixOutAll[10],50,0						//stop video to codec
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN,N_GAIN,6,0,MUTE,1)	//stop audio to codec
		off[vdvCiscoSX80_138,301]
    }
}
BUTTON_EVENT [dvTPAll,1058]	//Select VC Content None
{
    push :
	{
		integer nPanel;
		nPanel = get_last(dvTPAll);
		
		send_level dvMatrixOutAll[9],50,0							//stop video to codec
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN_137,GAIN,1,0,MUTE,1)	//stop audio to codec
		off[vdvCiscoSX80_137,301]
    }
}
BUTTON_EVENT [dvTPAll,1088]	//Select VC Content None
{
    push :
	{
		integer nPanel;
		nPanel = get_last(dvTPAll);
		
		send_level dvMatrixOutAll[11],50,0							//stop video to codec
		CALL 'SET_VAL'(DSP_CONTENT_TO_VC_GAIN_139,GAIN,1,0,MUTE,1)	//stop audio to codec
		off[vdvCiscoSX80_139,301]
    }
}


BUTTON_EVENT [dvTPAll,1101]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1102]
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)	
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
        CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	}
    }
}

BUTTON_EVENT [dvTPAll,1103]//GAIN - MUTE
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,0)
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,0)//UNMUTE
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,1) 
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,1)//MUTE
	}
    }
}

BUTTON_EVENT [dvTPAll,1104]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1105]
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
		
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    //CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
	    CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,CHIQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    //CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
	    CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1106]//GAIN - MUTE
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,0)
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,0)//UNMUTE
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,1) 
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,1)//UNMUTE
	}
    }
}

BUTTON_EVENT [dvTPAll,1107]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		//CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
		CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1108]
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
    IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	{
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    //CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
	    CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    //CALL 'SET_GAIN%'(cHIQAddr,ROOM_COMBINE,nInput,0,MasterOut_Vol[nFader])
	    CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
	    }
    }
}

BUTTON_EVENT [dvTPAll,1109]//GAIN - MUTE
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,1,cHIQAddr,nFader)
    IF(FB[nFB+1][12])
	{
	//FB[nFB+1][12]=0
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,0)
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,0)//UNMUTE
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	//CALL 'SET_VAL'(cHIQAddr,ROOM_COMBINE,nInput,0,MUTE,1) 
	CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,1)//UNMUTE
	}
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
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,0)
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,1) 
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=5
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=5
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1126]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=5
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=5
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		}
	}
}
BUTTON_EVENT [dvTPAll,1127]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=5
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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

BUTTON_EVENT [dvTPAll,1128]
{
PUSH: //RAMP UP
    {
	local_var integer nFB
	local_var integer nInput
	local_var integer nOutput
	local_var integer nFader
	local_var char cHIQAddr[20]
	nInput=4
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
	nInput=4
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

BUTTON_EVENT [dvTPAll,1129]
{
PUSH: //RAMP DN
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=4
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
	nInput=4
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



BUTTON_EVENT [dvTPAll,1130]//GAIN - MUTE
{
PUSH:
    {
    local_var integer nFB
    local_var integer nInput
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=4
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
    IF(FB[49][12])
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

BUTTON_EVENT [dvTPAll,1131]
{
	PUSH: //RAMP UP
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=7
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=7
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1132]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=7
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=7
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
	}
}
BUTTON_EVENT [dvTPAll,1133]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=7
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
BUTTON_EVENT [dvTPAll,1134]
{
	PUSH: //RAMP UP
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=8
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=8
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1135]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=8
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=8
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
	}
}
BUTTON_EVENT [dvTPAll,1136]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=8
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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




BUTTON_EVENT [dvTPAll,1137]
{
	PUSH: //RAMP UP
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=9
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=9
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1138]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=9
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=9
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		}
	}
}
BUTTON_EVENT [dvTPAll,1139]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=9
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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

BUTTON_EVENT [dvTPAll,1143]
{
	PUSH: //RAMP UP
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=11
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
		send_string 0, "'nFader = ', itoa(nFader)"
		
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=11
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1144]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=11
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		
		send_string 0, "'nFader = ', itoa(nFader)"
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=11
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
	}
}

BUTTON_EVENT [dvTPAll,1145]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=1
		nMixer=11
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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
BUTTON_EVENT [dvTPAll,1146]
{
	PUSH: //RAMP UP
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=12
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		send_string 0, "'nFader = ', itoa(nFader)"
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=12
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
    }
}

BUTTON_EVENT [dvTPAll,1147]
{
	PUSH: //RAMP DN
	{
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=12
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
		send_string 0, "'nFader = ', itoa(nFader)"
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
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=12
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHiQAddr,nFader)
		
		IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
		{
			MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
			//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
			CALL 'SET_GAIN%'(cHIQAddr,AUTOMIXER,nInput,0,MasterOut_Vol[nFader])
		}
	}
}
BUTTON_EVENT [dvTPAll,1148]//GAIN - MUTE
{
	PUSH:
    {
		local_var integer nFB
		local_var integer nInput
		local_var integer nMixer
		local_var integer nFader
		local_var char cHIQAddr[20]
		nInput=2
		nMixer=12
		nFB=DSP_GET_LEVEL_FBNUM(nInput,nMixer,cHIQAddr,nFader)
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

BUTTON_EVENT [dvTPAll,1401]   //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1402]   //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1403]   //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1404]   //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1405]   //Display Power Page - Off
BUTTON_EVENT [dvTPAll,1406] { //Display Power Page - Off
    push : {
	local_var integer nTmpChan
	nTmpChan=button.input.channel-1400
	send_string dvRXAll[button.input.channel-1400],CHRISTIE_POWER_OFF
	select {
	    active(nTmpChan==1) : pulse[rel_137_W_UP]
	    active(nTmpChan==2) : pulse[rel_137_N_UP]
	    active(nTmpChan==3) : pulse[rel_138_N_UP]
	    active(nTmpChan==4) : pulse[rel_138_E_UP]
	    active(nTmpChan==5) : pulse[rel_139_L_UP]
	    active(nTmpChan==6) : pulse[rel_139_R_UP]
	}
    }
}

BUTTON_EVENT [dvTPAll,1411]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1412]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1413]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1414]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1415]   //Display Power Page - On
BUTTON_EVENT [dvTPAll,1416] { //Display Power Page - On
    push : {
	local_var integer nTmpChan
	nTmpChan=button.input.channel-1410
	send_string dvRXAll[button.input.channel-1410],CHRISTIE_POWER_ON
	select {
	    active(nTmpChan==1) : pulse[rel_137_W_DN]
	    active(nTmpChan==2) : pulse[rel_137_N_DN]
	    active(nTmpChan==3) : pulse[rel_138_N_DN]
	    active(nTmpChan==4) : pulse[rel_138_E_DN]
	    active(nTmpChan==5) : pulse[rel_139_L_DN]
	    active(nTmpChan==6) : pulse[rel_139_R_DN]
	}
    }
}

BUTTON_EVENT [dvTPAll,1421]   //Display Power Page - Screen Up
BUTTON_EVENT [dvTPAll,1422]   //Display Power Page - Screen Up
BUTTON_EVENT [dvTPAll,1423]   //Display Power Page - Screen Up
BUTTON_EVENT [dvTPAll,1424]   //Display Power Page - Screen Up
BUTTON_EVENT [dvTPAll,1425]   //Display Power Page - Screen Up
BUTTON_EVENT [dvTPAll,1426] { //Display Power Page - Screen Up
    push : {
	local_var integer nTempChan
	nTempChan=button.input.channel-1420
	select {
	    active(nTempChan==1) : pulse[rel_137_W_up]
	    active(nTempChan==2) : pulse[rel_137_N_up]
	    active(nTempChan==3) : pulse[rel_138_N_up]
	    active(nTempChan==4) : pulse[rel_138_E_up]
	    active(nTempChan==5) : pulse[rel_139_L_up]
	    active(nTempChan==6) : pulse[rel_139_R_up]
	}
    }
}

BUTTON_EVENT [dvTPAll,1431]   //Display Power Page - Screen DN
BUTTON_EVENT [dvTPAll,1432]   //Display Power Page - Screen DN
BUTTON_EVENT [dvTPAll,1433]   //Display Power Page - Screen Dn
BUTTON_EVENT [dvTPAll,1434]   //Display Power Page - Screen Dn
BUTTON_EVENT [dvTPAll,1435]   //Display Power Page - Screen DN
BUTTON_EVENT [dvTPAll,1436] { //Display Power Page - Screen Dn
    push : {
	local_var integer nTempChan
	nTempChan=button.input.channel-1430
	select {
	    active(nTempChan==1) : pulse[rel_137_W_dn]
	    active(nTempChan==2) : pulse[rel_137_N_dn]
	    active(nTempChan==3) : pulse[rel_138_N_dn]
	    active(nTempChan==4) : pulse[rel_138_E_dn]
	    active(nTempChan==5) : pulse[rel_139_L_dn]
	    active(nTempChan==6) : pulse[rel_139_R_dn]
	}
    }
}

BUTTON_EVENT [dvTPAll,1500] { //Display Power Page - All Off
    PUSH: {
	select {
	    active(nCombinedMode==1 and nLastPanel<3) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[RM_137_W],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_137_N],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
		}
		pulse[rel_137_W_UP]
		pulse[rel_137_N_UP]
		pulse[rel_138_N_UP]
		pulse[rel_138_E_UP]
	    } active(nCombinedMode==2 and nLastPanel>1) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
		send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[RM_138_N],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_138_E],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_139_L],CHRISTIE_POWER_OFF
		    send_string dvRXAll[RM_139_R],CHRISTIE_POWER_OFF
		}
		pulse[rel_138_N_UP]
		pulse[rel_138_E_UP]
		pulse[rel_139_L_UP]
		pulse[rel_139_R_UP]
	    } active(nCombinedMode==3) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[1],CHRISTIE_POWER_OFF
		send_string dvRXAll[2],CHRISTIE_POWER_OFF
		send_string dvRXAll[3],CHRISTIE_POWER_OFF
		send_string dvRXAll[4],CHRISTIE_POWER_OFF
		send_string dvRXAll[5],CHRISTIE_POWER_OFF
		send_string dvRXAll[6],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[1],CHRISTIE_POWER_OFF
		    send_string dvRXAll[2],CHRISTIE_POWER_OFF
		    send_string dvRXAll[3],CHRISTIE_POWER_OFF
		    send_string dvRXAll[4],CHRISTIE_POWER_OFF
		    send_string dvRXAll[5],CHRISTIE_POWER_OFF
		    send_string dvRXAll[6],CHRISTIE_POWER_OFF	
		}
		pulse[rel_137_W_UP]
		pulse[rel_137_N_UP]
		pulse[rel_138_N_UP]
		pulse[rel_138_E_UP]
		pulse[rel_139_L_UP]
		pulse[rel_139_R_UP]
	    } active(nCombinedMode==4 and nLastPanel==1) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[1],CHRISTIE_POWER_OFF
		send_string dvRXAll[2],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[1],CHRISTIE_POWER_OFF
		    send_string dvRXAll[2],CHRISTIE_POWER_OFF
		}
		pulse[rel_137_W_UP]
		pulse[rel_137_N_UP]
	    } active(nCombinedMode==4 and nLastPanel==2) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[3],CHRISTIE_POWER_OFF
		send_string dvRXAll[4],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[3],CHRISTIE_POWER_OFF
		    send_string dvRXAll[4],CHRISTIE_POWER_OFF	
		}
		pulse[rel_138_N_UP]
		pulse[rel_138_E_UP]
	    } active(nCombinedMode==4 and nLastPanel==3) :  {
		send_string 0,"'ALL PROJECTORS off'"
		send_string dvRXAll[5],CHRISTIE_POWER_OFF
		send_string dvRXAll[6],CHRISTIE_POWER_OFF
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS off'"
		    send_string dvRXAll[5],CHRISTIE_POWER_OFF
		    send_string dvRXAll[6],CHRISTIE_POWER_OFF	
		}
		pulse[rel_139_L_UP]
		pulse[rel_139_R_UP]
	    }
	}
    }
}
BUTTON_EVENT [dvTPAll,1501] { //Display Power Page - All ON
    PUSH: {
	select {
	    active(nCombinedMode==1 and nLastPanel<3) :  { // AB
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[RM_137_W],CHRISTIE_POWER_ON
		send_string dvRXAll[RM_137_N],CHRISTIE_POWER_ON
		send_string dvRXAll[RM_138_N],CHRISTIE_POWER_ON
		send_string dvRXAll[RM_138_E],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[RM_137_W],CHRISTIE_POWER_ON
		    send_string dvRXAll[RM_137_N],CHRISTIE_POWER_ON
		    send_string dvRXAll[RM_138_N],CHRISTIE_POWER_ON
		    send_string dvRXAll[RM_138_E],CHRISTIE_POWER_ON
		}
		pulse[rel_137_W_DN]
		pulse[rel_137_N_DN]
		pulse[rel_138_N_DN]
//		pulse[rel_138_E_DN]
	    } active(nCombinedMode==1 and nLastPanel==3) :  { //AB
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[5],CHRISTIE_POWER_ON
		send_string dvRXAll[6],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[5],CHRISTIE_POWER_ON
		    send_string dvRXAll[6],CHRISTIE_POWER_ON	
		}
		pulse[rel_139_L_DN]
		pulse[rel_139_R_DN]
	    } active(nCombinedMode==2 and nLastPanel>1) :  { //BC
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[RM_138_N],CHRISTIE_POWER_ON
		//send_string dvRXAll[RM_138_E],CHRISTIE_POWER_ON
		send_string dvRXAll[RM_139_L],CHRISTIE_POWER_ON
		send_string dvRXAll[RM_139_R],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[RM_138_N],CHRISTIE_POWER_ON
		    //send_string dvRXAll[RM_138_E],CHRISTIE_POWER_ON
		    send_string dvRXAll[RM_139_L],CHRISTIE_POWER_ON
		    send_string dvRXAll[RM_139_R],CHRISTIE_POWER_ON
		}
		pulse[rel_138_N_DN]
		//pulse[rel_138_E_DN]
		pulse[rel_139_L_DN]
		pulse[rel_139_R_DN]
	    } active(nCombinedMode==2 and nLastPanel==1) :  { //BC 
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[1],CHRISTIE_POWER_ON
		send_string dvRXAll[2],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[1],CHRISTIE_POWER_ON
		    send_string dvRXAll[2],CHRISTIE_POWER_ON
		}
		pulse[rel_137_W_DN]
		pulse[rel_137_N_DN]
	    } active(nCombinedMode==3) :  {	// ABC
		send_string 0,"'ALL PROJECTORS ON'"
		//send_string dvRXAll[1],CHRISTIE_POWER_ON
		send_string dvRXAll[2],CHRISTIE_POWER_ON
		send_string dvRXAll[3],CHRISTIE_POWER_ON
		//send_string dvRXAll[4],CHRISTIE_POWER_ON
		send_string dvRXAll[5],CHRISTIE_POWER_ON
		send_string dvRXAll[6],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    //send_string dvRXAll[1],CHRISTIE_POWER_ON
		    send_string dvRXAll[2],CHRISTIE_POWER_ON
		    send_string dvRXAll[3],CHRISTIE_POWER_ON
		    //send_string dvRXAll[4],CHRISTIE_POWER_ON
		    send_string dvRXAll[5],CHRISTIE_POWER_ON
		    send_string dvRXAll[6],CHRISTIE_POWER_ON	
		}
		//pulse[rel_137_W_DN]
		pulse[rel_137_N_DN]
		pulse[rel_138_N_DN]
		//pulse[rel_138_E_DN]
		pulse[rel_139_L_DN]
		pulse[rel_139_R_DN]
	    }  active(nCombinedMode==4 and nLastPanel==1) :  { //A
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[1],CHRISTIE_POWER_ON
		send_string dvRXAll[2],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[1],CHRISTIE_POWER_ON
		    send_string dvRXAll[2],CHRISTIE_POWER_ON
		}
		pulse[rel_137_W_DN]
		pulse[rel_137_N_DN]
	    }  active(nCombinedMode==4 and nLastPanel==2) :  { //B
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[3],CHRISTIE_POWER_ON
		send_string dvRXAll[4],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[3],CHRISTIE_POWER_ON
		    send_string dvRXAll[4],CHRISTIE_POWER_ON
		}
		pulse[rel_138_N_DN]
		//pulse[rel_138_E_DN]
	    }  active(nCombinedMode==4 and nLastPanel==3) :  { //C
		send_string 0,"'ALL PROJECTORS ON'"
		send_string dvRXAll[5],CHRISTIE_POWER_ON
		send_string dvRXAll[6],CHRISTIE_POWER_ON
		WAIT 60 {
		    send_string 0,"'ALL PROJECTORS ON'"
		    send_string dvRXAll[5],CHRISTIE_POWER_ON
		    send_string dvRXAll[6],CHRISTIE_POWER_ON	
		}
		pulse[rel_139_L_DN]
		pulse[rel_139_R_DN]
	    }
	}
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
		[vdvCiscoSX80_138,146]=![vdvCiscoSX80_138,146]
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


