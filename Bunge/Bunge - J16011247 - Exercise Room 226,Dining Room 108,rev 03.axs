PROGRAM_NAME='Bunge - J16011247 - Exercise and Dining Rooms 226/108- PAG'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 14:51:04        *)
(***********************************************************)
#warn 'massio not tested'



DEFINE_DEVICE
dvMaster            =       0:01:0           //AMX NX-1200 Processor
dvSOUNDWEB          =       0:02:0           //BSS Blu-101 DSP
dvExterity          =       0:05:0           //Exterity AvediaPlayer R9300 Receiver    http://10.1.7.12   //Exterity r9300 default user:admin password:Labrador labrador
dvPowerController   =       0:07:0           //Surge X SX-AX20E
dvDisplays          =    5001:01:0           //2 Samsung QM85D Displays - rs-232 daisy chained 

dvKeypad            =    8001:1:0           //MKP-108

dvMatrix            =     128:01:0   	//AMX SDX-514M-DX Switcher 



dvTP1               =   10001:01:0      //AMX MSD-1001 touchpanel 10" wall mount

vdvTPDummy          =   33001:01:0      //Temporary empty touchpanel device

vdvDisplays            =   41001:01:0      //The COMM module should use this as its duet device
vdvPowerController  =   41003:01:0       //The COMM module should use this as its duet device



(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

// Shutdown at 21:00 (9 PM)
INTEGER SHUTDOWN_HOUR = 21
INTEGER SHUTDOWN_MINUTE = 0

dev dvTPAll[]={dvTP1,vdvTPDummy,vdvTPDummy}  //room can be modified to support three touchpanels for future use

LONG nTimeFeedbackQry[1]={50}    //Feedback query

char    cServerAddress[]={'10.160.208.79'} // IP Address of the BSS
char    cExterityIP[]={'10.160.204.24'}   // 
char    cPowerConditionerIPAddress[]={'10.160.208.80'}   // 
char    cPowerConditionerUsername[]={'admin'}   // 
char    cPowerConditionerPassword[]={'admin'}   // 

INTEGER nProjInputWait=100


//VID INPUTS

INTEGER SRC_WELLBEATS_PC            = 01
INTEGER SRC_HDMI_TX                 = 02
INTEGER SRC_IPTV                    = 04
INTEGER SRC_POWER_OFF               = 25



CHAR DSP_OUT_1[]={'Exercise Room 1'}
CHAR DSP_OUT_2[]={'Exercise Room 2'}
CHAR DSP_OUT_3[]={'Exercise Room 3'}
CHAR DSP_OUT_4[]={'Exercise Room 4'}
CHAR DSP_OUT_5[]={'Exercise Room ALS Antenna'}
CHAR DSP_OUT_6[]={'Dining Room 1'}
CHAR DSP_OUT_7[]={'Dining Room 2'}
CHAR DSP_OUT_8[]={'Lobby'}


//bss
CHAR DSP_EXERCISE_PROGRAM_GAIN[]       = {$00,$10,$03,$00,$01,$11};
CHAR DSP_EXERCISE_BLUETOOTH_GAIN[]     = {$00,$10,$03,$00,$01,$12};
CHAR DSP_EXERCISE_MIC_GAIN[]           = {$00,$10,$03,$00,$01,$13};
CHAR DSP_EXERCISE_PHONE_IFACE1_GAIN[]  = {$00,$10,$03,$00,$01,$14};
CHAR DSP_EXERCISE_PHONE_IFACE2_GAIN[]  = {$00,$10,$03,$00,$01,$15};

#warn 'change DINING IDs'
//CHAR DSP_DINING_WALLPLATE_GAIN[]       = {$00,$10,$03,$00,$01,$15};
//CHAR DSP_DINING_MIC_GAIN[]             = {$00,$10,$03,$00,$01,$14};
//CHAR DSP_DINING_MASTER_GAIN[]          = {$00,$10,$03,$00,$01,$13};
//CHAR DSP_DINING_SRC_SELECT[]           = {$00,$10,$03,$00,$01,$16};


CHAR DSP_DINING_MIC1_GAIN[]		= {$00,$10,$03,$00,$01,$1E}
CHAR DSP_DINING_MIC2_GAIN[]		= {$00,$10,$03,$00,$01,$1F}
CHAR DSP_DINING_WLS1_GAIN[]		= {$00,$10,$03,$00,$01,$25}
CHAR DSP_DINING_WLS2_GAIN[]		= {$00,$10,$03,$00,$01,$28}
CHAR DSP_DINING_LINE_GAIN[]		= {$00,$10,$03,$00,$01,$22}
CHAR DSP_DINING_PAGING_GAIN[]		= {$00,$10,$03,$00,$01,$2F}

 
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

volatile integer nDisplayPower[6]

INTEGER MASTEROUT_VOL[50]; //KEEP TRACK OF MASTEROUT VOLUME
integer DINING_VOL[20];	// various dining room volume levels
integer DINING_MUTE[20];	// various dining room mute states
CHAR cSourceNames[50][50]


volatile integer nIPPortConnected[50]


LONG REPEAT_TIME[1];//TIMELINE
LONG CHECK_REPEAT_TIME[1]

INTEGER RAMP_GAIN_PER; //RAMP_GAIN IN PERCENT <0-100>

INTEGER resubscribe = 0;
INTEGER SUBSCRIBED = 0;

VOLATILE integer nDSP_Connected

persistent char cContactInfo[300]
PERSISTENT integer nInitialized

PERSISTENT integer nDiningAudioSelect
char cDiningVolAddress[20][10]
integer nScaledLevel
integer nScaledLevelFB
integer nBlockLevelEventOnSwitch

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
	active(nMixerNum==1) : {
	    cHiQAddr=DSP_EXERCISE_PROGRAM_GAIN
	    nFaderNum=1
	    return nInput*2-1
	} active(nMixerNum==2) : {
	    cHiQAddr=DSP_EXERCISE_BLUETOOTH_GAIN
	    nFaderNum=2
	    return (nInput*2-1)+2
	} active(nMixerNum==3) : {
	    cHiQAddr=DSP_EXERCISE_MIC_GAIN
	    nFaderNum=3
	    return (nInput*2-1)+4
	} active(nMixerNum==4) : {
	    cHiQAddr=DSP_EXERCISE_PHONE_IFACE1_GAIN
	    nFaderNum=4
	    return (nInput*2-1)+6
	} active(nMixerNum==5) : {
	    cHiQAddr=DSP_EXERCISE_PHONE_IFACE2_GAIN
	    nFaderNum=5
	    return (nInput*2-1)+8
	} //active(nMixerNum==6) : {
//	    cHiQAddr=DSP_DINING_WALLPLATE_GAIN
//	    nFaderNum=6
//	    return (nInput*2-1)+10
//	} active(nMixerNum==7) : {
//	    cHiQAddr=DSP_DINING_MIC_GAIN
//	    nFaderNum=7
//	    return (nInput*2-1)+12
//	}  active(nMixerNum==8) : {
//	    cHiQAddr=DSP_DINING_MASTER_GAIN
//	    nFaderNum=8
//	    return (nInput*2-1)+14
//	}
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
    //send_command dvTP,"'^SSH-41,Menu 03-Select VC Content,02,0'"
    send_command dvTP,"'^SSH-41,Menu 04-Select Audio,03,0'"
    //send_command dvTP,"'^SSH-41,Menu 05-More Settings,04,0'"
    send_command dvTP,"'^SSH-41,Menu 06-IPTV,05,0'"
    //send_command dvTP,"'^SSH-41,Menu 07-Lights,06,0'"
    //send_command dvTP,"'^SSH-41,Menu 08-Shades,07,0'"
    send_command dvTP,"'^SSH-41,Menu 09-Display & Screen Control,08,0'"
    send_command dvTP,"'^SSH-41,Menu 10-Help,09,0'"
}

DEFINE_FUNCTION integer           NAV_populate_sources(dev dvTP) {
    local_var integer x
    local_var integer y
    for(x=100;x<=600;x=x+100) {
	for(y=0;y<=28;y++) send_command dvTP,"'^SHD-',itoa(x+1),',0',itoa(x+y)"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_POWER_OFF),    	',00,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_WELLBEATS_PC),	',02,10'" 
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_HDMI_TX),	        ',03,10'"
	send_command dvTP,"'^SSH-',itoa(x+1),',0',itoa(x+SRC_IPTV),           	',04,10'"
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
}
DEFINE_FUNCTION Integer           Round (Float fInput)
{

Return TYPE_CAST (fInput + 0.5);

}
DEFINE_FUNCTION                   SUBSCRIBE_ALL()
{
    local_var integer I
    local_var integer J
    subscribed = 1;
    CALL 'SUBSCRIBE%'(DSP_EXERCISE_PROGRAM_GAIN,GAIN,1,0,GAIN)		//fb 1
    CALL 'SUBSCRIBE'(DSP_EXERCISE_PROGRAM_GAIN,GAIN,1,0,MUTE)		//fb 2
    CALL 'SUBSCRIBE%'(DSP_EXERCISE_BLUETOOTH_GAIN,GAIN,1,0,GAIN)	//fb 3
    CALL 'SUBSCRIBE'(DSP_EXERCISE_BLUETOOTH_GAIN,GAIN,1,0,MUTE)		//fb 4
    CALL 'SUBSCRIBE%'(DSP_EXERCISE_MIC_GAIN,GAIN,1,0,GAIN)		//fb 5
    CALL 'SUBSCRIBE'(DSP_EXERCISE_MIC_GAIN,GAIN,1,0,MUTE)		//fb 6
    CALL 'SUBSCRIBE%'(DSP_EXERCISE_PHONE_IFACE1_GAIN,GAIN,1,0,GAIN)	//fb 7
    CALL 'SUBSCRIBE'(DSP_EXERCISE_PHONE_IFACE1_GAIN,GAIN,1,0,MUTE)	//fb 8
    CALL 'SUBSCRIBE%'(DSP_EXERCISE_PHONE_IFACE2_GAIN,GAIN,1,0,GAIN)	//fb 9
    CALL 'SUBSCRIBE'(DSP_EXERCISE_PHONE_IFACE2_GAIN,GAIN,1,0,MUTE)	//fb 10
//    CALL 'SUBSCRIBE%'(DSP_DINING_WALLPLATE_GAIN,GAIN,1,0,GAIN)
//    CALL 'SUBSCRIBE'(DSP_DINING_WALLPLATE_GAIN,GAIN,1,0,MUTE)
//    CALL 'SUBSCRIBE%'(DSP_DINING_MIC_GAIN,GAIN,1,0,GAIN)
//    CALL 'SUBSCRIBE'(DSP_DINING_MIC_GAIN,GAIN,1,0,MUTE)
//    CALL 'SUBSCRIBE%'(DSP_DINING_MASTER_GAIN,GAIN,1,0,GAIN)
//    CALL 'SUBSCRIBE'(DSP_DINING_MASTER_GAIN,GAIN,1,0,MUTE)
//    CALL 'SUBSCRIBE'(DSP_DINING_SRC_SELECT,SOURCE_SELECTOR,0,0,0)
    CALL 'SUBSCRIBE%'(DSP_DINING_MIC1_GAIN,GAIN,1,0,GAIN)		//fb 11
    CALL 'SUBSCRIBE'(DSP_DINING_MIC1_GAIN,GAIN,1,0,MUTE)		//fb 12
    CALL 'SUBSCRIBE%'(DSP_DINING_MIC2_GAIN,GAIN,1,0,GAIN)		//fb 13
    CALL 'SUBSCRIBE'(DSP_DINING_MIC2_GAIN,GAIN,1,0,MUTE)		//fb 14
    CALL 'SUBSCRIBE%'(DSP_DINING_WLS1_GAIN,GAIN,1,0,GAIN)		//fb 15
    CALL 'SUBSCRIBE'(DSP_DINING_WLS1_GAIN,GAIN,1,0,MUTE)		//fb 16
    CALL 'SUBSCRIBE%'(DSP_DINING_WLS2_GAIN,GAIN,1,0,GAIN)		//fb 17
    CALL 'SUBSCRIBE'(DSP_DINING_WLS2_GAIN,GAIN,1,0,MUTE)		//fb 18
    CALL 'SUBSCRIBE%'(DSP_DINING_LINE_GAIN,GAIN,1,0,GAIN)		//fb 19
    CALL 'SUBSCRIBE'(DSP_DINING_LINE_GAIN,GAIN,1,0,MUTE)		//fb 20
    CALL 'SUBSCRIBE%'(DSP_DINING_PAGING_GAIN,GAIN,1,0,GAIN)		//fb 21
    CALL 'SUBSCRIBE'(DSP_DINING_PAGING_GAIN,GAIN,1,0,MUTE)		//fb 22

}

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
cSourceNames[01]="'Wellbeats PC'"      
cSourceNames[02]="'HDMI',$0A,'Transmitter'"                                 
cSourceNames[04]="'IPTV'"           
cSourceNames[25]="'Power Off'"                                                                


TIMELINE_CREATE(1,nTimeFeedbackQry,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //TV power query timeline

//BSS
REPEAT_TIME[1] = 300; //300ms TO UPDATE FEEDBACK
CHECK_REPEAT_TIME[1] = 5000; //check to see if we are connected every 5 seconds
TIMELINE_CREATE(3, REPEAT_TIME, 1, TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//FEEDBACK TIMELINE;
TIMELINE_CREATE(4,CHECK_REPEAT_TIME, 1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT)//Resubscribe timeline. 





IF(nInitialized==0) cContactInfo="'Use Button below to change Custom Help Message...'"
nInitialized=1


cDiningVolAddress[1]  = "DSP_DINING_MIC1_GAIN"
cDiningVolAddress[2]  = "DSP_DINING_MIC2_GAIN"
cDiningVolAddress[3]  = "DSP_DINING_WLS1_GAIN"
cDiningVolAddress[4]  = "DSP_DINING_WLS2_GAIN"
cDiningVolAddress[5]  = "DSP_DINING_LINE_GAIN"
cDiningVolAddress[6]  = "DSP_DINING_PAGING_GAIN"

nDiningAudioSelect = 1

//#warn 'module disabled for quicker load'
DEFINE_MODULE 'Samsung_QM85D_Comm_dr1_0_0' comm(vdvDisplays, dvDisplays)
DEFINE_MODULE 'Surgex_iControl2_dr1_0_0'  modPowerController(vdvPowerController, dvPowerController);


(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

TIMELINE_EVENT[1]//Feedback timeline
{
    local_var integer nCount
    local_var integer x
    local_var integer nTest
    for(nCount=1;nCount<=2;nCount++) {}
    

    for(x=101;x<=115;x++) [dvTpAll,x]=(nSourceRouted[1]==x-100 and ([vdvDisplays,255] and ![vdvDisplays,254])) //power on and not cooling
    [dvTpAll,125]=![vdvDisplays,255] or [vdvDisplays,254]  //power off or cooling
    for(x=201;x<=215;x++) [dvTpAll,x]=(nSourceRouted[2]==x-200 and ([vdvDisplays,255] and ![vdvDisplays,254])) //power on and not cooling
    [dvTpAll,225]=![vdvDisplays,255] or [vdvDisplays,254]  //power off or cooling
   
    
    for(x=1003;x<=1013;x++) [dvTpAll,x]=(nSourceRouted[5]==x-1000)
    [dvTPAll,1028]=(nSourceRouted[5]==0 and FB[25][12])

    [dvTPAll,1401]=![vdvDisplays,255] or [vdvDisplays,254]
    [dvTPAll,1411]=[vdvDisplays,255] and ![vdvDisplays,254]
    
    for(nCount=1;nCount<=5;nCount++) {
	[dvTPAll,1520+nCount]=nSourceRouted[1]=nCount
    }
    
    nDisplayPower[1] = [vdvDisplays,255]
    
    [dvKeypad,1] = nDiningAudioSelect == 1
    [dvKeypad,2] = nDiningAudioSelect == 2
    [dvKeypad,3] = nDiningAudioSelect == 3
    [dvKeypad,4] = nDiningAudioSelect == 4
    [dvKeypad,5] = nDiningAudioSelect == 5
    [dvKeypad,6] = nDiningAudioSelect == 6
    
    [dvKeypad,7] = DINING_MUTE[nDiningAudioSelect] == 0
    [dvKeypad,8] = DINING_MUTE[nDiningAudioSelect] == 1
    
    nScaledLevelFB = DINING_VOL[nDiningAudioSelect]
    SEND_LEVEL dvKeyPad,1,(255*nScaledLevelFB)/100;
    
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
        
    
    MASTEROUT_VOL[01] = TYPE_CAST(MID_STRING(FB[01],10,1)); 	// exercise program gain
    SEND_LEVEL dvTPAll,01,MASTEROUT_VOL[01];
    [dvTPAll,1103] = FB[02][12];				// exercise program mute
    MASTEROUT_VOL[02] = TYPE_CAST(MID_STRING(FB[03],10,1)); 	// exercise bluetooth gain
    SEND_LEVEL dvTPAll,02,MASTEROUT_VOL[02];
    [dvTPAll,1106] = FB[04][12];				// exercise bluetooth mute
    MASTEROUT_VOL[03] = TYPE_CAST(MID_STRING(FB[05],10,1)); 	// exercise mic gain
    SEND_LEVEL dvTPAll,03,MASTEROUT_VOL[03];
    [dvTPAll,1109] = FB[06][12];				// exercise mic mute
    MASTEROUT_VOL[04] = TYPE_CAST(MID_STRING(FB[07],10,1)); 	// exercise iface 1 gain
    SEND_LEVEL dvTPAll,04,MASTEROUT_VOL[04];
    [dvTPAll,1112] = FB[08][12];				// exercise iface 1 mute
    MASTEROUT_VOL[05] = TYPE_CAST(MID_STRING(FB[09],10,1)); 	// exercise iface 2 gain
    SEND_LEVEL dvTPAll,05,MASTEROUT_VOL[05];
    [dvTPAll,1115] = FB[10][12];				// exercise iface 2 mute
    
    
    MASTEROUT_VOL[06] = TYPE_CAST(MID_STRING(FB[11],10,1)); 	// dining mic1 gain	
    MASTEROUT_VOL[07] = TYPE_CAST(MID_STRING(FB[13],10,1)); 	// dining mic2 gain
    MASTEROUT_VOL[08] = TYPE_CAST(MID_STRING(FB[15],10,1)); 	// dining wls1 gain
    MASTEROUT_VOL[09] = TYPE_CAST(MID_STRING(FB[17],10,1)); 	// dining wls1 gain
    MASTEROUT_VOL[10] = TYPE_CAST(MID_STRING(FB[19],10,1)); 	// dining wls1 gain
    MASTEROUT_VOL[11] = TYPE_CAST(MID_STRING(FB[21],10,1)); 	// dining wls1 gain
    
    
    DINING_VOL[01] = TYPE_CAST(MID_STRING(FB[11],10,1)); 	// dining mic1 gain	
    DINING_VOL[02] = TYPE_CAST(MID_STRING(FB[13],10,1)); 	// dining mic2 gain
    DINING_VOL[03] = TYPE_CAST(MID_STRING(FB[15],10,1)); 	// dining wls1 gain
    DINING_VOL[04] = TYPE_CAST(MID_STRING(FB[17],10,1)); 	// dining wls2 gain
    DINING_VOL[05] = TYPE_CAST(MID_STRING(FB[19],10,1)); 	// dining line gain
    DINING_VOL[06] = TYPE_CAST(MID_STRING(FB[21],10,1)); 	// dining paging gain
    
    DINING_MUTE[01] = FB[12][12];				// dining mic1 gain
    DINING_MUTE[02] = FB[14][12];				// dining mic2 gain
    DINING_MUTE[03] = FB[16][12];				// dining wls1 gain
    DINING_MUTE[04] = FB[18][12];				// dining wls2 gain
    DINING_MUTE[05] = FB[20][12];				// dining line gain
    DINING_MUTE[06] = FB[22][12];				// dining paging gain
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
}
DATA_EVENT[vdvDisplays]
{
    online:
    {
	send_command vdvDisplays,"'PROPERTY-Device_ID,1'";
	send_command vdvDisplays,"'REINIT'";
    }
}
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
DATA_EVENT   [dvKeyPad] {
    online : {
	send_command data.device,"'@BRT-32,0'"
	
	nDiningAudioSelect = 1
//	send_level dvKeypad,2, DINING_VOL[nDiningAudioSelect]
	nScaledLevelFB = DINING_VOL[nDiningAudioSelect]
	SEND_LEVEL dvKeyPad,1,(255*nScaledLevelFB)/100;
    }
}


DATA_EVENT   [dvMatrix] {
    online :  {
	
	SEND_COMMAND data.device,"'VIDIN_AUTO_SELECT-DISABLE'"
	#warn 'if problems getting certain resolutions, may need to use EDID commands'
	//SEND_COMMAND data.device, "'VIDIN_EDID-MIRROR OUT 1'"
/*	
VIDIN_EDID Sets the EDID Mode for the specified video input port addressed by D:P:S. The EDID mode is the desired
EDID information to be sent to the selected video source.
Syntax:
SEND_COMMAND <DEV>,"'VIDIN_EDID-<source>'"
Variables:
The source variable includes the following options:
All Resolutions - uses the pre-loaded EDID for the switcher
Mirror Out 1 - uses the EDID from DXLink (display on DX-RX, DVX input, or DGX input)
Mirror Out Local - uses the EDID of the local display
Mirror Out 1 HDMI - uses the EDID of the local display
Mirror Out 1 DXLINK - uses the EDID from DXLink (display on DX-RX, DVX input, or DGX input)
User EDID 1 - uses a custom VGA-only EDID, loaded onto the switcher from an outside source (see
Appendix C for more information.)
NOTE: User EDID 1 is only available for VGA. Mirror is only applicable to HDMI.
NOTE: Mirror Out 1 is interchangeable with Mirror Out 1 DXLINK, and Mirror Out Local is
interchangeable with Mirror Out 1 HDMI. Use the argument which is compatible with your video input
device.
CAUTION: If you are using the VIDIN_EDID command to mirror the DXLink or HDMI port and the
sink (TV) is not plugged into the output port, the switcher may receive an invalid EDID. Be sure to
issue the command when the sink is plugged into the output port.
Example:
SEND_COMMAND data.device, "'VIDIN_EDID-MIRROR OUT 1'"
*/

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
	    nSourceRouted[1]=nMtxInput
	    Send_command dvTpAll,"'^txt-32,0,',cSourceNames[nMtxInput]"
	}
    }
}



DATA_EVENT   [dvTPALL] {
    online : {
	local_var integer x
	nLastPanel=get_last(dvTPAll)
	for(x=1;x<=28;x++) {
	    send_command data.device,"'^txt-',itoa(x),',0,',cSourceNames[x]"    //source names
	}
	send_command data.device,"'PAGE-001 Splash'"
	send_level data.device,11,data.device.number-9999
	send_command data.device,"'^txt-32,0,',cSourceNames[nSourceRouted[1]]"
	send_command data.device,"'^txt-60,1,',cContactInfo"
	NAV_populate_menu_bar(data.device)
	NAV_populate_sources(data.device)
    } string : {
        local_var char cTrash[100]
	cTrash=REMOVE_STRING(data.text,"'KEYB-'",1)
	if(data.text<>'ABORT' and cTrash<>'') {
	    cContactInfo=data.text
	    send_command dvTPAll,"'^txt-60,1,',cContactInfo"
	}
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

LEVEL_EVENT[dvKeypad,2]	// Dining room Keypad knob
{
    local_var integer nInput
    nInput = 1
    
    if(nBlockLevelEventOnSwitch == 0)
    {
	nScaledLevel = level.value
	nScaledLevel = (100*nScaledLevel)/255
	send_string 0,"'Scaled Vol: ',itoa(nScaledLevel)"
	
	CALL 'SET_GAIN%'(cDiningVolAddress[nDiningAudioSelect],GAIN,nInput,0,nScaledLevel)
    }
    nBlockLevelEventOnSwitch = 0
}

BUTTON_EVENT[dvKeypad,1]
BUTTON_EVENT[dvKeypad,2]
BUTTON_EVENT[dvKeypad,3]
BUTTON_EVENT[dvKeypad,4]
BUTTON_EVENT[dvKeypad,5]
BUTTON_EVENT[dvKeypad,6]	// audio channel select
{
    PUSH:
    {
	nDiningAudioSelect = button.input.channel
	nBlockLevelEventOnSwitch = 1
	
	send_level dvKeypad,2,(255*DINING_VOL[nDiningAudioSelect])/100;
	send_level dvKeyPad,1,(255*DINING_VOL[nDiningAudioSelect])/100;
    }
}

BUTTON_EVENT[dvKeypad,7]	// unmute
{
    PUSH:
    {
        local_var integer nInput
	nInput = 1
	
	CALL 'SET_VAL'(cDiningVolAddress[nDiningAudioSelect],GAIN,nInput,0,MUTE,0)
    }
}
BUTTON_EVENT[dvKeypad,8]	// mute
{
    PUSH:
    {
        local_var integer nInput
	nInput = 1
	
	CALL 'SET_VAL'(cDiningVolAddress[nDiningAudioSelect],GAIN,nInput,0,MUTE,1)
    }
}
BUTTON_EVENT[dvKeypad,11]	// mute toggle
{
    PUSH:
    {
        local_var integer nInput
	nInput = 1
	
	if(DINING_MUTE[nDiningAudioSelect])
	{
	    CALL 'SET_VAL'(cDiningVolAddress[nDiningAudioSelect],GAIN,nInput,0,MUTE,0)
	}
	else
	{
	    CALL 'SET_VAL'(cDiningVolAddress[nDiningAudioSelect],GAIN,nInput,0,MUTE,1)
	}
    }
}



BUTTON_EVENT [dvTPAll,0] {
    push : {
	nLastPanel=get_last(dvTPAll)
	dvTPLastSet[1]=dvTP1
	dvTPLastSet[2]=vdvTPDummy
	dvTPLastSet[3]=vdvTPDummy
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
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	send_command dvTPAll[nLastPanel],"'PPON-0209 Select VC Content'"
    }
}

BUTTON_EVENT [dvTPAll,5] {  //NAV - Audio Routing Page
    PUSH: {
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	send_command dvTPAll[nLastPanel],"'PPON-0211 Select Audio Group 2'"
    }
}
BUTTON_EVENT [dvTPAll,7] {  //NAV - Display Power Page
    PUSH: {
	send_command dvTPAll[nLastPanel],"'PAGE-002 Main Page'"
	send_command dvTPAll[nLastPanel],"'@PPX'"
	send_command dvTPAll[nLastPanel],"'PPON-0703 Display Power ABC'"
    }
}

BUTTON_EVENT [dvTPAll,8] {  //NAV - HELP PAGE
    PUSH: {
	send_command vdvPowerController,'?UPSINPUTPROPERTY-ENERGY_USED'
    }
}



BUTTON_EVENT [dvTPAll,017] { //NAV - Shutdown
    PUSH: {

//	CALL 'SET_VAL'(DSP_EXERCISE_PROGRAM_GAIN,GAIN,1,0,MUTE,1) 
//	CALL 'SET_VAL'(DSP_EXERCISE_BLUETOOTH_GAIN,GAIN,1,0,MUTE,1) 
//    	CALL 'SET_VAL'(DSP_EXERCISE_MIC_GAIN,GAIN,1,0,MUTE,1) 
//    	CALL 'SET_VAL'(DSP_EXERCISE_PHONE_IFACE1_GAIN,GAIN,1,0,MUTE,1) 
//	CALL 'SET_VAL'(DSP_EXERCISE_PHONE_IFACE2_GAIN,GAIN,1,0,MUTE,1) 
	off[vdvDisplays,255]
	wait 60 {
	    off[vdvDisplays,255]
	}
    }
}

BUTTON_EVENT [dvTPAll,020] { //NAV - Tech contact
    push : {
	send_command button.input.device,"'@AKB-',cContactInfo,';Please enter the contact info...'"
    }
}


BUTTON_EVENT [dvTPAll,051] { //audio confirm yes
    push : {
	NAV_select_vid_page()
	CALL 'SET_VAL'(DSP_EXERCISE_PROGRAM_GAIN,GAIN,1,0,MUTE,0) 
	CALL 'SET_GAIN%'(DSP_EXERCISE_PROGRAM_GAIN,GAIN,1,0,66)
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
	
	SEND_COMMAND dvMatrix, "'VI',itoa(button.input.channel-100),'O1'"
	
    
	on[vdvDisplays,255]
	cancel_wait 'proj1input'
	wait nProjInputWait 'proj1input'
	{
	    send_command vdvDisplays,"'INPUT-HDMI'"
	}
	
	if(FB[6][12]) {
	    nSourceRoutedTemp[1]=button.input.channel-nOffset
	    send_command dvTPAll[nLastPanel],"'PAGE-003 Audio Confirm'"
	    send_command dvTPAll[nLastPanel],"'^txt-51,0,Do you want to listen to',$0A,Nav_ReplaceLIneFeed(cSourceNames[nSourceRoutedTemp[1]]),' in the Room Speakers?'"
	}

    }
}
BUTTON_EVENT [dvTPAll,125] { //MATRIX POWER OFF
    PUSH: {
	send_string 0,"'proj 1 off'"
	off[vdvDisplays,255]
	wait 50
	{
	    off[vdvDisplays,255]
	}
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
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
        //CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
	//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,0)
	//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,0)//UNMUTE
	}
    ELSE
	{
	//FB[nFB+1][12]=1
	CALL 'SET_VAL'(cHIQAddr,GAIN,nInput,0,MUTE,1) 
	//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_MUTE,1)//MUTE
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
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
		//CALL 'SET_ROOMCOMBINE'(cHIQAddr,nInput,0,SOURCE_GAIN,MasterOut_Vol[nFader])
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

BUTTON_EVENT [dvTPAll,1105]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,2,CHIQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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

BUTTON_EVENT [dvTPAll,1107]
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

BUTTON_EVENT [dvTPAll,1108]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,3,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
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
	local_var char    cHIQAddr[20]
	nInput=1
	nOutput=0
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
		
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHiQAddr,nFader)
		    
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,4,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHiQAddr,nFader)
		    
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,5,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,6,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,6,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
    nFB=DSP_GET_LEVEL_FBNUM(nInput,6,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,6,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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

BUTTON_EVENT [dvTPAll,1119]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,7,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,7,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,7,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,7,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,7,cHIQAddr,nFader)
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


BUTTON_EVENT [dvTPAll,1122]
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,8,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,8,cHIQAddr,nFader)
	IF (MasterOut_Vol[nFader] < (MAX_RAMPGAIN_PER-GAIN_STEP_PER))
	    {
		MasterOut_Vol[nFader] = MasterOut_Vol[nFader] + GAIN_STEP_PER;
		//FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
		CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,8,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,8,cHiQAddr,nFader)
		    
	IF (MasterOut_Vol[nFader] > (MIN_RAMPGAIN_PER+GAIN_STEP_PER))
	    {
	    MasterOut_Vol[nFader] = MasterOut_Vol[nFader] - GAIN_STEP_PER;
	    //FB[nFB][10] = TYPE_CAST(MasterOut_Vol[nFader]);
	    CALL 'SET_GAIN%'(cHIQAddr,GAIN,nInput,0,MasterOut_Vol[nFader])
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
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,8,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,9,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,9,cHIQAddr,nFader)
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
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,9,cHIQAddr,nFader)
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
	nFB=DSP_GET_LEVEL_FBNUM(nInput,9,cHiQAddr,nFader)
		    
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
    local_var integer nOutput
    local_var integer nFader
    local_var char cHIQAddr[20]
    nInput=1
    nOutput=0
    nFB=DSP_GET_LEVEL_FBNUM(nInput,9,cHIQAddr,nFader)
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
		off[vdvDisplays,255] 
		wait 50
		{
		    off[vdvDisplays,255]
		}
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
		on[vdvDisplays,255] 
		wait 50
		{
		    on[vdvDisplays,255]
		}
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
	SEND_COMMAND dvMatrix, "'VI',itoa(button.input.channel-1520),'O1'"
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


