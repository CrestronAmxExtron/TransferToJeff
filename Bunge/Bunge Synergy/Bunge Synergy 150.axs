PROGRAM_NAME='Bunge Synergy 150'
#DISABLE_WARNING 10571

//MIC 1 is the master mic


(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/10/2022  AT: 15:36:18        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    but they like the panel and functionality so modified.
    For Now commented out mic control so they have choice
    to control mics in the future like the boardroom.
    JACOB EMGE, TSI Global.  Systems Engineer.
*)
(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

dvMaster 	=	0:1:0
dvSwitcher	=	5002:01:151

dvDSP		=	0:2:150					//QSC


dvIpad		=	10001:1:150				//MSD-1001I

//OUTPUTS
dvDisplayLeft	=	5001:1:150				//Left Display
dvDisplayRight	=	5001:2:150				//Right Display

//INPUTS
dv_NorthFloorbox 	=	8001:1:0
dv_CenterFloorbox	=	8002:1:0
dv_SouthFloorbox	=	8003:1:0
dv_LecternFloorbox	=	8004:1:0

//OUTPUTS

//VIRTUAL DEVICES
vdvRX1              =   41002:01:0      //The COMM module should use this as its duet device
vdvRX2              =   41003:01:0      //The COMM module should use this as its duet device


//Receivers
dvReceiver1		=	46001:1:129;
dvReceiver2		=	46002:1:129;
dvReceiver3		=	46003:1:129;	
(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

    INTEGER	MicChangeLevel		=	3;
    SINTEGER 	MaxLevelForIncrease	=	9;
    SINTEGER	MinLevelForDecrease	=	-96;
    Long 	TLFEEDBACK 		= 	1
    Long 	FEEDBACK_TIMES[] 	= 	{300}
    Char	VProgramAudioLevel[]	=	"PRGM.Gain";
    Char	VProgramAudioMute[]	=	"PRGM.Mute";
    Char	VInvoundAudioLevel[]	=	"USB.Gain";
    Char	VInboudAudioMute[]	=	"USB.Mute";
    Char	VLapelMicLevel[]	=	"WL1.Gain";
    Char	VLapelMicMute[]		=	"WL1.Mute";
    Char	VHandHeldMicLevel[]	=	"WL2.Gain";
    Char	VHandHeldMicMute[]	=	"WL2.Mute";
    Char	vPresentationMute[]	=	"Presentation.Mute";
    Char	vConferenceMute[]	=	"Conference.Mute";
    INTEGER	Multiplication		=	2.2767857143;
(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

INTEGER LastRoutedVTCAudio			=		0;
INTEGER LastRoutedProgramAudio			=		0;
//For Mic Parsing
CHAR sFromMic1[300]			
CHAR sFromMic16[300]
INTEGER	DoNotParseMic1				=		0;
INTEGER DoNotParseMic16				=		0;
CHAR sFromMic4[300]
INTEGER Mic4					=		0;

//HeaderFB
INTEGER	SelectedHeader				=		0;


INTEGER TryingToConnectToDSP			=		0;
INTEGER RoutedBasic				=		0;
Integer CurrentlySelectedSource 		=		0;
Integer RoutedToLeftDisplay			=		0;
INTEGER RoutedToRightDisplay			=		0;
INTEGER RoutedToVTC				=		0;
INTEGER ShowVGA					=		0;
INTEGER SelectedAudioScreen			=		0;
//AUDIO
SINTEGER ProgramAudioLevel			=		0;
SINTEGER ProgramAudioMute			=		0;
SINTEGER InboundAudioLevel			=		0;
SINTEGER InboundAudioMute			=		0;
SINTEGER LapelMicLevel				=		0;
SINTEGER LapelMicMute				=		0;
SINTEGER HandHeldMicLevel			=		0;
SINTEGER HandHeldMicMute			=		0;
//AUDIO FOR VOLUME FEEDBACK
FLOAT ProgramAudioLevelBar			=		0;
FLOAT InboundAudioLevelBar			=		0;
FLOAT LapelMicLevelBar			=		0;
FLOAT HandHeldMicLevelBar 			=		0;


INTEGER ShowAdvanced 				=		0;
INTEGER CurrentMicMute				=		0;
//Display Power FB
INTEGER	VLeftDisplayPower			=		0;
INTEGER VRightDisplayPower			=		0;

VOLATILE_CHAR TempString[30]

//For tracking if video is plugged in
INTEGER NorthFloorBoxVideo			=		0;
INTEGER CenterFloorBoxVideo			=		0;
INTEGER SouthFloorBloxVideo			=		0;
INTEGER LecternFloorBoxVideo			=		0;
INTEGER LastVideoPluggedIn			=		0;

//For button presses
INTEGER VTCSources[]				=		{700,701,702,703,704,705,706,707,708,709}
INTEGER	PresentationSources[]			=		{100,101,102,103,104,105,106,107,108,109}
INTEGER BasicSources[]				=		{600,601,602,603,604,605,606,607,608,609}


//NETWORK STUFF
    VOLATILE INTEGER nLocalPort	
    VOLATILE CHAR LocalPort[15]
    VOLATILE CHAR IPAddress[15]			=		'10.160.208.52'
    //VOLATILE CHAR IPAddress[15]			=		'10.160.112.27'
    VOLATILE char IPPort[4]			=		'1702';
    VOLATILE CHAR nProtocol			=		'1';
    


(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE
//DEFINE_MODULE 'Samsung_DM82D_Comm_dr1_0_0' comm(vdvRX1, dvDisplayLeft)
//DEFINE_MODULE 'Samsung_DM82D_Comm_dr1_0_0' comm(vdvRX2, dvDisplayRight)
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)
DEFINE_FUNCTION System_On_Presentation
{
    on[vdvRX1,255]
    on[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,SHOW VGA'";
    SEND_STRING dvDSP,"'csp ',vPresentationMute,' 0',$0A";
    SEND_STRING dvDSP,"'csp ',VConferenceMute,' 1',$0A";
    SelectedHeader = 1;
/*    IF(LastVideoPluggedIn > 0)
    {
	IF(NorthFloorBoxVideo = 1 & LastVideoPluggedIn = 1)
	{
	    SEND_COMMAND dvSWITCHER,"'VI9O2'";RoutedToRightDisplay = 9;SEND_COMMAND dvSwitcher,"'VI9O6'";
	    SEND_COMMAND dvSWITCHER,"'VI9O1'";RoutedToLeftDisplay = 9;
	}
	ELSE IF(CenterFloorBoxVideo = 1 & LastVideoPluggedIn = 2)
	{
	    SEND_COMMAND dvSWITCHER,"'VI10O2'";RoutedToRightDisplay = 10;SEND_COMMAND dvSwitcher,"'VI10O6'";
	    SEND_COMMAND dvSWITCHER,"'VI10O2'";RoutedToLeftDisplay = 10;
	}
	ELSE IF(SouthFloorBloxVideo = 1 & LastVideoPluggedIn = 3)
	{
	    SEND_COMMAND dvSWITCHER,"'VI11O2'";RoutedToRightDisplay = 11;SEND_COMMAND dvSwitcher,"'VI11O6'";
	    SEND_COMMAND dvSWITCHER,"'VI11O2'";RoutedToLeftDisplay = 11;
	}
	ELSE IF(LecternFloorBoxVideo = 1 & LastVideoPluggedIn = 4)
	{
	    SEND_COMMAND dvSWITCHER,"'VI12O2'";RoutedToRightDisplay = 11;SEND_COMMAND dvSwitcher,"'VI12O6'";
	    SEND_COMMAND dvSWITCHER,"'VI12O2'";RoutedToLeftDisplay = 12;
	}
    }
    ELSE
    {*/
	SEND_COMMAND dvSWITCHER,"'VI8O2'";RoutedToRightDisplay = 8;Send_COMMAND dvSwitcher,"'VI8O1'";RoutedToLeftDisplay = 8;SEND_COMMAND dvSwitcher,"'VI8O6'";//Route Clickahre Video to right display
  //  }
    ShowAdvanced = 0;
    SEND_COMMAND dvIpad,"'PAGE-Presentation_Basic'";
    
 }

DEFINE_FUNCTION System_On_Video_Conf
{
    on[vdvRX1,255]
    on[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,HIDE VGA'";
    ShowAdvanced = 0;
    SelectedHeader = 2;
    SEND_COMMAND dvIpad,"'PAGE-Conference'";
    SEND_COMMAND dvSwitcher,"'VI1O1'";
    SEND_COMMAND dvSwitcher,"'VI2O2'";
    SEND_STRING dvDSP,"'csp ',vPresentationMute,' 1',$0A";
    SEND_STRING dvDSP,"'csp ',VConferenceMute,' 0',$0A";
}
DEFINE_FUNCTION System_Off
{
    
    off[vdvRX1,255]
    off[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,HIDE VGA'";
    SEND_COMMAND dvIpad,"'PAGE-Begin'";
    
    //Clears Routing and FB
    SEND_COMMAND dvSwitcher,"'VI0O1'";
    SEND_COMMAND dvSwitcher,"'VI0O2'";
    SEND_COMMAND dvSwitcher,"'VI0O6'";
    SEND_COMMAND dvSwitcher,"'VI0O3'";
    SEND_COMMAND dvSwitcher,"'VI0O4'";
    SEND_COMMAND dvSwitcher,"'VI0O5'";
    RoutedToVTC = 0;
    RoutedBasic = 0;
    RoutedToLeftDisplay = 0;
    RoutedToRightDisplay = 0;
}

DEFINE_FUNCTION ParseVideoSwitcher(sFromVideoSwitcher[300])
{

}
DEFINE_FUNCTION ParseLeft(CHAR sFromLeftDisplay[100])
{
    INTEGER P20;
    INTEGER P21;
    P20 = FIND_STRING(sFromLeftDisplay,'01,$30,$30,$2A,$42,$31,$32,$02,$30,$32,$30,$30,$44,$36,$30,$30,$30,$30,$30,$34,$30,$30,$30,$31,$03',1);		//POWER ON
    P21 = FIND_STRING(sFromLeftDisplay,'01,$30,$30,$2A,$42,$31,$32,$02,$30,$32,$30,$30,$44,$36,$30,$30,$30,$30,$30,$34,$30,$30,$30,$34,$03',1);		//POWER OFF
    
    IF(P20 > 0)
    {
	VLeftDisplayPower = 1;
    }
    IF(P21 > 0)
    {
	VRightDisplayPower = 0;
    }
    
}
DEFINE_FUNCTION ParseRight(CHAR sFromRightDisplay[100])
{
    INTEGER P20;
    INTEGER P21;
    P20 = FIND_STRING(sFromRightDisplay,'01,$30,$30,$2A,$42,$31,$32,$02,$30,$32,$30,$30,$44,$36,$30,$30,$30,$30,$30,$34,$30,$30,$30,$31,$03',1);		//POWER ON
    P21 = FIND_STRING(sFromRightDisplay,'01,$30,$30,$2A,$42,$31,$32,$02,$30,$32,$30,$30,$44,$36,$30,$30,$30,$30,$30,$34,$30,$30,$30,$34,$03',1);		//POWER OFF
    
    IF(P20 > 0)
    {
	VRightDisplayPower = 1;
    }
    IF(P21 > 0)
    {
	VRightDisplayPower = 0;
    }
}
DEFINE_FUNCTION ParseDSP(CHAR sParseDSP[80])
{
    INTEGER P1;
    INTEGER P2;
    INTEGER P3;
    INTEGER P4;
    INTEGER P5;
    INTEGER P6;
    INTEGER P7;
    INTEGER P8;
    INTEGER P9;
    INTEGER P10;
    
   P1 = FIND_STRING(sParseDSP,VProgramAudioLevel,1);
   P2 = FIND_STRING(sParseDSP,VProgramAudioMute,1);
   P3 = FIND_STRING(sParseDSP,VInvoundAudioLevel,1);
   P4 = FIND_STRING(sParseDSP,VInboudAudioMute,1);
   P5 = FIND_STRING(sParseDSP,VLapelMicLevel,1);
   P6 = FIND_STRING(sParseDSP,VLapelMicMute,1);
   P7 = FIND_STRING(sParseDSP,VHandHeldMicLevel,1);
   P8 = FIND_STRING(sParseDSP,VHandHeldMicMute,1);
   
   IF(P1 > 0)		//	Found VProgramAudioLevel
   {
	//cv "VProgramAudioLevel" "-20.0dB" 020 0.35\x0D\x0A
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'.',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	//Temp string = -20
	ProgramAudioLevel = ATOI(TempString);			//Converts Temp String to integer 
	//Program audio now = -20
   }
   IF(P2 > 0)	
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to First "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'"',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	P10 = Find_String(TempString,'unmuted',1);	//Checks to see if it says unmuted
	IF(P10 > 0)
	{
	    ProgramAudioMute = 0;
	}
	ELSE
	{
	    ProgramAudioMute = 1;
	}
   }
   IF(P3 > 0)			//Found VInvoundAudioLevel
   {
	
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'.',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	InboundAudioLevel = ATOI(TempString);			//Converts Temp String to integer 
   }
   IF(P4 > 0)	
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to First "
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'"',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	P10 = Find_String(TempString,'unmuted',1);	//Checks to see if it says unmuted
	IF(P10 > 0)
	{
	    InboundAudioMute = 0;
	}
	ELSE
	{
	    InboundAudioMute = 1;
	}
   }
   IF(P5 > 0)		//	Found VLapelMicLevel
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'.',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	LapelMicLevel = ATOI(TempString);			//Converts Temp String to integer 
   }
   IF(P6 > 0)	
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to First "
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'"',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	P10 = Find_String(TempString,'unmuted',1);	//Checks to see if it says unmuted
	IF(P10 > 0)
	{
	    LapelMicMute = 0;
	}
	ELSE
	{
	    LapelMicMute = 1;
	}
   }
    IF(P7 > 0)		//	Found VHandHeldMicLevel
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'.',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	HandHeldMicLevel = ATOI(TempString);			//Converts Temp String to integer 
   }
   IF(P8 > 0)	
   {
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to First "
	P1 = Find_String(sParseDSP,'"',P1+1);			//Changes Position to Second "
	P1 = FIND_STRING(sParseDSP,'"',P1+1);			//Changes Position to Third "
	P9 = FIND_STRING(SParseDSP,'"',P1+1);			//Makes marker P9 for the .
	TempString = MID_STRING(sParseDSP,P1+1,P9-P1-1);	//Takes two positions and makes them into a string of just the number
	P10 = Find_String(TempString,'unmuted',1);	//Checks to see if it says unmuted
	IF(P10 > 0)
	{
	    HandHeldMicMute = 0;
	}
	ELSE
	{
	    HandHeldMicMute = 1;
	}
   }

}

DEFINE_FUNCTION ParseNorth(CHAR sFromNorthFloorbox)
{
    INTEGER P30;
    P30 = FIND_STRING(sFromNorthFloorbox,'LVIDEOI8O6',1);
    IF(P30 > 0)
    {
	NorthFloorBoxVideo = 1;
	LastVideoPluggedIn = 1;
    }
}
DEFINE_FUNCTION ParseCenter(CHAR sFromNCenterFloorbox)
{
    INTEGER P31;
    P31 = FIND_STRING(sFromNCenterFloorbox,'LVIDEOI8O6',1);
    IF(P31 > 0)
    {
	CenterFloorBoxVideo = 1;
	LastVideoPluggedIn = 2;
    }
}
DEFINE_FUNCTION ParseSouth(CHAR sFromSouthFloorbox)
{
    INTEGER P32;
    P32 = FIND_STRING(sFromSouthFloorbox,'LVIDEOI8O6',1);
    IF(P32 > 0)
    {
	SouthFloorBloxVideo = 1;
	LastVideoPluggedIn = 3;
    }
}
DEFINE_FUNCTION ParseLectern(CHAR sFromLecternFloorbox)
{
    INTEGER P32;
    P32 = FIND_STRING(sFromLecternFloorbox,'LVIDEOI8O6',1);
    IF(P32 > 0)
    {
	sFromLecternFloorbox = 1;
	LastVideoPluggedIn = 4;
    }
}

DEFINE_FUNCTION fnOpenTCPConnect() 
{
    IP_CLIENT_OPEN (dvDSP.PORT, IPADDRESS,1702, 1)
}

DEFINE_MODULE 'Samsung_DM82D_Comm_dr1_0_0' comm(vdvRX1,dvDisplayLeft)
DEFINE_MODULE 'Samsung_DM82D_Comm_dr1_0_0' comm(vdvRX2,dvDisplayRight)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)



DEFINE_START

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT
data_event[dvMaster]
{
    online:
    {
	timeline_create(TLFEEDBACK,FEEDBACK_TIMES,length_array(FEEDBACK_TIMES),timeline_relative,timeline_repeat)
	
	WAIT 300;
	fnOpenTCPConnect()	//DSP
	
    }
}

data_event[dvSwitcher]
{
    online:
    {
	//send_command dvDisplayLeft,"'RXON'";
	//send_command dvDisplayLeft,"'SET BAUD 9600,N,8,1'";
	//send_command dvDisplayRight,"'RXON'";
	//send_command dvDisplayRight,"'SET BAUD 9600,N,8,1'";
	SEND_COMMAND dvSwitcher,"'AI0O3'";
	SEND_COMMAND dvSwitcher,"'AIOO4'";
    
    }
    string:
    {
	LOCAL_VAR CHAR sFromVideoSwitcher[200];
	sFromVideoSwitcher = DATA.TEXT;
	ParseVideoSwitcher(sFromVideoSwitcher);
    }
}
DATA_EVENT[dvReceiver1]
{
    ONLINE:
    {
	SEND_COMMAND dvReceiver1,"'AUDOUT_MUTE-ENABLE'";
    }
}
DATA_EVENT[dvReceiver2]
{
    ONLINE:
    {
	SEND_COMMAND dvReceiver2,"'AUDOUT_MUTE-ENABLE'";
    }
}
DATA_EVENT[dvReceiver3]
{
    ONLINE:
    {
	SEND_COMMAND dvReceiver3,"'AUDOUT_MUTE-ENABLE'";
    }
}
DATA_EVENT[dvDisplayLeft]
{
    ONLINE:
    {
	SEND_COMMAND dvDisplayLeft,"'SET BAUD 9600,N,8,1'";
	SEND_COMMAND dvDisplayLeft,"'RXON'"
	
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromLeftDisplay[100];
	sFromLeftDisplay = DATA.TEXT;
	ParseLeft(sFromLeftDisplay);
    }
}
DATA_EVENT[dvDisplayRight]
{
    ONLINE:
    {
	SEND_COMMAND dvDisplayRight,"'SET BAUD 9600,N,8,1'";
	SEND_COMMAND dvDisplayRight,"'RXON'"
	
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromRightDisplay[100];
	sFromRightDisplay = DATA.TEXT;
	ParseRight(sFromRightDisplay);
    }
}
DATA_EVENT[dvDSP]
{
    ONLINE:
    {
	//Polls for levels and mutes
	TryingToConnectToDSP = 1;
	SEND_STRING dvDSP,"'cg ',VProgramAudioLevel,$0A";
	SEND_STRING dvDSP,"'cg ',VInvoundAudioLevel,$0A";
	SEND_STRING dvDSP,"'cg ',VLapelMicLevel,$0A";
	SEND_STRING dvDSP,"'cg ',VHandHeldMicLevel,$0A";
	SEND_STRING dvDSP,"'cg ',VProgramAudioMute,$0A";
	SEND_STRING dvDSP,"'cg ',VInboudAudioMute,$0A";
	SEND_STRING dvDSP,"'cg ',VLapelMicMute,$0A";
	SEND_STRING dvDSP,"'cg ',VHandHeldMicMute,$0A";
	
	//Sends to bars
	ProgramAudioLevelBar = ((ProgramAudioLevel + 100)* 2.2767857143);
	InboundAudioLevelBar = ((InboundAudioLevel + 100)* 2.2767857143);
	LapelMicLevelBar = ((LapelMicLevel + 100)* 2.2767857143);
	HandHeldMicLevelBar = ((HandHeldMicLevel + 100)* 2.2767857143);
    }
    OFFLINE:
    {
	fnOpenTCPConnect()
	TryingToConnectToDSP = 2;
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromDSP[40];
	sFromDSP = DATA.TEXT;
	ParseDSP(sFromDSP);
    }
    ONERROR:
    {
	TryingToConnectToDSP = 3;
    }
}
DATA_EVENT[dv_NorthFloorbox]
{
    ONLINE:
    {
    
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromNorthFloobox[90];
	sFromNorthFloobox = DATA.TEXT;
	ParseNorth(sFromNorthFloobox);
    }
}
DATA_EVENT[dv_CenterFloorbox]
{
    ONLINE:
    {
    
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromCenterFloobox[90];
	sFromCenterFloobox = DATA.TEXT;
	ParseCenter(sFromCenterFloobox);
    }
}
DATA_EVENT[dv_SouthFloorbox]
{
    ONLINE:
    {
    
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromSouthFloobox[90];
	sFromSouthFloobox = DATA.TEXT;
	ParseSouth(sFromSouthFloobox);
    }
}
DATA_EVENT[dv_LecternFloorbox]
{
    ONLINE:
    {
    
    }
    STRING:
    {
	LOCAL_VAR CHAR sFromLecternFloobox[90];
	sFromLecternFloobox = DATA.TEXT;
	ParseLectern(sFromLecternFloobox);
    }
}


BUTTON_EVENT[dvIpad,1]									//Presentation On Button
{
    PUSH:
    {
	System_On_Presentation();
    }
}
BUTTON_EVENT[dvIpad,2]									//Video Conference On Button
{
    PUSH:
    {
	System_On_Video_Conf();
    }
}
BUTTON_EVENT[dvIpad,3]									//Power Off Button
{
    PUSH:
    {
	SEND_COMMAND dvIpad,"'PAGE-ShutdownConfirm'";
    }
}
BUTTON_EVENT[dvIpad,4]									//Source Button
{
    PUSH:
    {
	SelectedHeader = 1;
	ShowAdvanced = 0;
	SEND_COMMAND dvIpad,"'PAGE-Presentation_Basic'";
	SEND_COMMAND dvSwitcher,"'VI0O1'";
	SEND_COMMAND dvSwitcher,"'VI0O2'";
	RoutedBasic = 0;
	RoutedToLeftDisplay = 0;
	RoutedToRightDisplay = 0;
	SEND_STRING dvDSP,"'csp ',vPresentationMute,' 0',$0A";
	SEND_STRING dvDSP,"'csp ',VConferenceMute,' 1',$0A";
	
    }
}
BUTTON_EVENT[dvIpad,5]									//Conference Button
{
    PUSH:
    {
	SelectedHeader = 2;
	SEND_COMMAND dvIpad,"'PAGE-Conference'";
	SEND_COMMAND dvSwitcher,"'VI1O1'";
	SEND_COMMAND dvSwitcher,"'VI2O2'";
	SEND_STRING dvDSP,"'csp ',vPresentationMute,' 1',$0A";
	SEND_STRING dvDSP,"'csp ',VConferenceMute,' 0',$0A";
    }
}
BUTTON_EVENT[dvIpad,6]									//Room Control Button
{
    PUSH:
    {
	SelectedHeader = 3;
	SEND_COMMAND dvIpad,"'PAGE-Room_Control'";
    }
}
BUTTON_EVENT[dvIpad,7]									//Audio Control Button
{
    PUSH:
    {
	SelectedHeader = 4;
	SEND_COMMAND dvIpad,"'PAGE-Audio'";
    }
}

BUTTON_EVENT[dvIpad,10]									//Power Off Confirm
{
    PUSH:
    {
	System_Off();
	SEND_COMMAND dvIpad,"'PAGE-Begin'";
	LastRoutedProgramAudio = 0;
	LastRoutedVTCAudio = 0;
	CurrentlySelectedSource = 0;
	RoutedBasic = 0;
	RoutedToLeftDisplay = 0;
	RoutedToRightDisplay = 0;
	RoutedToVTC = 0;
	SEND_COMMAND dvSwitcher,"'VI0O1'";
	SEND_COMMAND dvSwitcher,"'VI0O2'";
	SEND_COMMAND dvSwitcher,"'VI0O3'";
	SEND_COMMAND dvSwitcher,"'VI0O4'";
	SEND_COMMAND dvSwitcher,"'AI0O4'";
	SEND_COMMAND dvSwitcher,"'AI0O5'";
	SEND_COMMAND dvSwitcher,"'AI0O6'";
    }
}
BUTTON_EVENT[dvIpad,11]									//Power Off Cancel
{
    PUSH:
    {
	//SEND_COMMAND dvIpad,"'^PGE-'";							//Should Be a back command
	SEND_COMMAND dvIpad,"'PAGE-ShutdownConfirm'";
    }
}

BUTTON_EVENT[dvIpad,20]
{
    PUSH:
    {
	IF(ShowAdvanced = 1)
	{
	    ShowAdvanced = 0;
	    SEND_COMMAND dvIpad,"'PAGE-Presentation_Basic'";
	}
	ELSE IF(ShowAdvanced = 0)
	{
	    ShowAdvanced = 1;
	    SEND_COMMAND dvIpad,"'PAGE-Presentation_Advanced'";
	}
    }
}
BUTTON_EVENT[dvIpad,50]									//Show VGA Sources
{
    PUSH:
    {
	IF(ShowVGA = 1)
	{
	    SHOWVGA = 0;
	    SEND_COMMAND dvIpad,"'@SHO-106.109,0'";
	    SEND_COMMAND dvIpad,"'@SHO-706.709,0'";
	    SEND_COMMAND dvIpad,"'@TXT-1,0,HIDE VGA'";
	}
	ELSE IF(ShowVGA = 0)
	{
	    ShowVGA = 1;
	    SEND_COMMAND dvIPad,"'@SHO-106.109,1'";
	    SEND_COMMAND dvIpad,"'@SHO-706.709,1'";
	    SEND_COMMAND dvIpad,"'@TXT-1,0,SHOW VGA'";
	}
    }
}
BUTTON_EVENT[dvIpad,PresentationSources]
{
    PUSH:
    {
	SWITCH(Button.INPUT.CHANNEL)
	{
	    CASE 100:CurrentlySelectedSource = 1;					//North Floorbox HDMI
	    CASE 101:CurrentlySelectedSource = 2;					//Center Floorbox HDMI
	    CASE 102:CurrentlySelectedSource = 3;					//South Floorbox HDMI
	    CASE 103:CurrentlySelectedSource = 4;					//Lectern HDMI
	    CASE 104:CurrentlySelectedSource = 5;					//Cable
	    CASE 105:CurrentlySelectedSource = 6;					//
	    CASE 106:CurrentlySelectedSource = 7;					//Clickshare 1
	    CASE 107:CurrentlySelectedSource = 8;					//Clickshare 2
	    CASE 108:CurrentlySelectedSource = 9;					//SOuth Floorbox VGA
	    CASE 109:CurrentlySelectedSource = 10;					//Lectern VGA
	}
    }
}
BUTTON_EVENT[dvIpad,VTCSources]
{
    PUSH:
    {
	SWITCH(BUTTON.INPUT.CHANNEL)
	{
	    CASE 700:SEND_COMMAND dvSwitcher,"'VI4O5'";		RoutedToVTC = 9;	//SEND_COMMAND dvSwitcher,"'VI4O6'";  	
	    CASE 701:SEND_COMMAND dvSwitcher,"'VI5O5'";		RoutedToVTC = 10;	//SEND_COMMAND dvSwitcher,"'VI5O6'";	
	    CASE 702:SEND_COMMAND dvSwitcher,"'VI6O5'";		RoutedToVTC = 11;	//SEND_COMMAND dvSwitcher,"'VI6O6'";	
	    CASE 703:SEND_COMMAND dvSwitcher,"'VI7O5'";		RoutedToVTC = 12;	//SEND_COMMAND dvSwitcher,"'VI7O6'";	
	    CASE 704:SEND_COMMAND dvSwitcher,"'VI3O5'";		RoutedToVTC = 3;	//SEND_COMMAND dvSwitcher,"'VI3O6'";		
	    CASE 705:SEND_COMMAND dvSwitcher,"'VI8O5'";		RoutedToVTC = 8;	//SEND_COMMAND dvSwitcher,"'VI8O6'";	
	    CASE 706:SEND_COMMAND dvSwitcher,"'VI4O5'";		RoutedToVTC = 4;	//SEND_COMMAND dvSwitcher,"'VI4O6'";	
	    CASE 707:SEND_COMMAND dvSwitcher,"'VI5O5'";		RoutedToVTC = 5;	//SEND_COMMAND dvSwitcher,"'VI5O6'";	
	    CASE 708:SEND_COMMAND dvSwitcher,"'VI6O5'";		RoutedToVTC = 6;	//SEND_COMMAND dvSwitcher,"'VI6O6'";		
	    CASE 709:SEND_COMMAND dvSwitcher,"'VI7O5'";		RoutedToVTC = 7;	//SEND_COMMAND dvSwitcher,"'VI7O6'";	
	}
    }
}
BUTTON_EVENT[dvIpad,BasicSources]
{
    PUSH:
    {
	SWITCH(BUTTON.INPUT.CHANNEL)
	{
	    CASE 600:SEND_COMMAND dvSWITCHER,"'VI4O1'";SEND_COMMAND dvSWITCHER,"'VI4O2'";RoutedToLeftDisplay = 1;RoutedToRightDisplay = 1;RoutedBasic = 9; SEND_COMMAND dvSwitcher,"'VI4O6'";		LastRoutedProgramAudio = 9;//Route North HDMI Video to Both displays
	    CASE 601:SEND_COMMAND dvSWITCHER,"'VI5O1'";SEND_COMMAND dvSWITCHER,"'VI5O2'";RoutedToLeftDisplay = 2;RoutedToRightDisplay = 2;;RoutedBasic = 10; SEND_COMMAND dvSwitcher,"'VI5O6'";		LastRoutedProgramAudio = 10;//Route Center HDMI Video to Both displays
	    CASE 602:SEND_COMMAND dvSWITCHER,"'VI6O1'";SEND_COMMAND dvSWITCHER,"'VI6O2'";RoutedToLeftDisplay = 3;RoutedToRightDisplay = 3;;RoutedBasic = 11; SEND_COMMAND dvSwitcher,"'VI6O6'";		LastRoutedProgramAudio = 11;//Route South HDMI Video to Both displays
	    CASE 603:SEND_COMMAND dvSWITCHER,"'VI7O1'";SEND_COMMAND dvSWITCHER,"'VI7O2'";RoutedToLeftDisplay = 4;RoutedToRightDisplay = 4;;RoutedBasic = 12; SEND_COMMAND dvSwitcher,"'VI7O6'";		LastRoutedProgramAudio = 12;//Route Lectern HDMI Video to Both displays
	    CASE 604:SEND_COMMAND dvSWITCHER,"'VI3O1'";SEND_COMMAND dvSWITCHER,"'VI3O2'";RoutedToLeftDisplay = 5;RoutedToRightDisplay = 5;;RoutedBasic = 3; SEND_COMMAND dvSwitcher,"'VI3O6'";		LastRoutedProgramAudio = 3;//Route Cable Video to Both displays
	    CASE 605:SEND_COMMAND dvSWITCHER,"'VI8O1'";SEND_COMMAND dvSWITCHER,"'VI8O2'";RoutedToLeftDisplay = 6;RoutedToRightDisplay = 6;RoutedBasic = 8; SEND_COMMAND dvSwitcher,"'VI8O6'";		LastRoutedProgramAudio = 8;//
	    CASE 606:SEND_COMMAND dvSwitcher,"'VI4O1'";SEND_COMMAND dvSwitcher,"'VI4O2'";RoutedToLeftDisplay = 8;RoutedToRightDisplay = 8;RoutedBasic = 4; SEND_COMMAND dvSwitcher,"'VI4O6'";		LastRoutedProgramAudio = 4;//Clickshare 1
	    CASE 607:SEND_COMMAND dvSwitcher,"'VI5O1'";SEND_COMMAND dvSwitcher,"'VI5O2'";RoutedToLeftDisplay = 9;RoutedToRightDisplay = 9;RoutedBasic = 5; SEND_COMMAND dvSwitcher,"'VI5O6'";		LastRoutedProgramAudio = 5;//Clickshare 2
	    CASE 608:SEND_COMMAND dvSwitcher,"'VI6O1'";SEND_COMMAND dvSwitcher,"'VI6O2'";RoutedToLeftDisplay = 10;RoutedToRightDisplay = 10;RoutedBasic = 6; SEND_COMMAND dvSwitcher,"'VI6O6'";		LastRoutedProgramAudio = 6;//ROutes VGA South to Both displays
	    CASE 609:SEND_COMMAND dvSwitcher,"'VI7O1'";SEND_COMMAND dvSwitcher,"'VI7O2'";RoutedToLeftDisplay = 11;RoutedToRightDisplay = 11;RoutedBasic = 7; SEND_COMMAND dvSwitcher,"'VI7O6'";		LastRoutedProgramAudio = 7;//ROutes VGA Lectern to Both displays
	}
    }
}
BUTTON_EVENT[dvIpad,233]								//Left Display
{
    PUSH:
    {
	RoutedBasic = 0;
	IF     (CurrentlySelectedSource = 1) {SEND_COMMAND dvSWITCHER,"'VI4O1'";RoutedToLeftDisplay = 1;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI4O6'";	LastRoutedProgramAudio = 9;}}//Route North HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 2) {SEND_COMMAND dvSWITCHER,"'VI5O1'";RoutedToLeftDisplay = 2;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI5O6'";	LastRoutedProgramAudio = 10;}}//Route Center HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 3) {SEND_COMMAND dvSWITCHER,"'VI6O1'";RoutedToLeftDisplay = 3;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI6O6'";	LastRoutedProgramAudio = 11;}}//Route South HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 4) {SEND_COMMAND dvSWITCHER,"'VI7O1'";RoutedToLeftDisplay = 4;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI7O6'";	LastRoutedProgramAudio = 12;}}//Route Lectern HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 5) {SEND_COMMAND dvSWITCHER,"'VI3O1'";RoutedToLeftDisplay = 5;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI3O6'";	LastRoutedProgramAudio = 3;}}//Route Cable Video to left display
	ELSE IF(CurrentlySelectedSource = 6) {SEND_COMMAND dvSWITCHER,"'VI8O1'";RoutedToLeftDisplay = 6;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI8O6'";	LastRoutedProgramAudio = 8;}}//
	ELSE IF(CurrentlySelectedSource = 7) {SEND_COMMAND dvSwitcher,"'VI4O1'";RoutedToLeftDisplay = 8;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI4O6'";	LastRoutedProgramAudio = 4;}}//Clickshare 1
	ELSE IF(CurrentlySelectedSource = 8) {SEND_COMMAND dvSwitcher,"'VI5O1'";RoutedToLeftDisplay = 9;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI5O6'";	LastRoutedProgramAudio = 5;}}//Clickshare 2
	ELSE IF(CurrentlySelectedSource = 9) {SEND_COMMAND dvSwitcher,"'VI6O1'";RoutedToLeftDisplay = 10;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI6O6'";	LastRoutedProgramAudio = 6;}}//ROutes VGA South to left Display
	ELSE IF(CurrentlySelectedSource = 10) {SEND_COMMAND dvSwitcher,"'VI7O1'";RoutedToLeftDisplay = 11;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI7O6'";	LastRoutedProgramAudio = 7;}}//ROutes VGA Lectern to left Display
	
    }
}
BUTTON_EVENT[dvIpad,234]								//Right Display
{
    PUSH:
    {
	RoutedBasic = 0;
	IF(CurrentlySelectedSource = 1)	     {SEND_COMMAND dvSWITCHER,"'VI4O2'";RoutedToRightDisplay = 1;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI4O6'";	LastRoutedProgramAudio = 9;}}//Route North HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 2) {SEND_COMMAND dvSWITCHER,"'VI5O2'";RoutedToRightDisplay = 2;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI5O6'";	LastRoutedProgramAudio = 10;}}//Route Center HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 3) {SEND_COMMAND dvSWITCHER,"'VI6O2'";RoutedToRightDisplay = 3;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI6O6'";	LastRoutedProgramAudio = 11;}}//Route South HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 4) {SEND_COMMAND dvSWITCHER,"'VI7O2'";RoutedToRightDisplay = 4;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI7O6'";	LastRoutedProgramAudio = 12;}}//Route Lectern HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 5) {SEND_COMMAND dvSWITCHER,"'VI3O2'";RoutedToRightDisplay = 5;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI3O6'";	LastRoutedProgramAudio = 3;}}//Route Cable Video to right display
	ELSE IF(CurrentlySelectedSource = 6) {SEND_COMMAND dvSWITCHER,"'VI8O2'";RoutedToRightDisplay = 6;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI8O6'";	LastRoutedProgramAudio = 8;}}//
	ELSE IF(CurrentlySelectedSource = 7) {SEND_COMMAND dvSwitcher,"'VI4O2'";RoutedToRightDisplay = 8;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI4O6'";	LastRoutedProgramAudio = 4;}}//Clickshare 1
	ELSE IF(CurrentlySelectedSource = 8) {SEND_COMMAND dvSwitcher,"'VI5O2'";RoutedToRightDisplay = 9;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI5O6'";	LastRoutedProgramAudio = 5;}}//Clickshare 2
	ELSE IF(CurrentlySelectedSource = 9) {SEND_COMMAND dvSwitcher,"'VI6O2'";RoutedToRightDisplay = 10;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI6O6'";	LastRoutedProgramAudio = 6;}}//ROutes VGA South to Right Display
	ELSE IF(CurrentlySelectedSource = 10) {SEND_COMMAND dvSwitcher,"'VI7O2'";RoutedToRightDisplay = 11;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI7O6'";	LastRoutedProgramAudio = 7;}} //ROutes VGA Lectern to Right Display
    }
}


BUTTON_EVENT[dvIpad,240]								//LeftDisplay Audio
{
    PUSH:
    {
	SelectedAudioScreen =1;	
	IF(RoutedToLeftDisplay = 1)		Send_Command dvSwitcher,"'VI4O6'";
	IF(RoutedToLeftDisplay = 2)		SEND_COMMAND dvSwitcher,"'VI5O6'";
	IF(RoutedToLeftDisplay = 3)		Send_Command dvSwitcher,"'VI6O6'";
	IF(RoutedToLeftDisplay = 4)		SEND_COMMAND dvSwitcher,"'VI7O6'";
	IF(RoutedToLeftDisplay = 5)		Send_Command dvSwitcher,"'VI3O6'";
	IF(RoutedToLeftDisplay = 6)		SEND_COMMAND dvSwitcher,"'VI8O6'";
	IF(RoutedToLeftDisplay = 8)		Send_Command dvSwitcher,"'VI4O6'";
	IF(RoutedToLeftDisplay = 9)		SEND_COMMAND dvSwitcher,"'VI5O6'";
	IF(RoutedToLeftDisplay = 10)		Send_Command dvSwitcher,"'VI6O6'";
	IF(RoutedToLeftDisplay = 11)		SEND_COMMAND dvSwitcher,"'VI7O6'";
    }
}
BUTTON_EVENT[dvIpad,241]								//Right Display Audio
{
    PUSH:
    {
	SelectedAudioScreen = 2;
	IF(RoutedToRightDisplay = 1)		Send_Command dvSwitcher,"'V4O6'";
	IF(RoutedToRightDisplay = 2)		SEND_COMMAND dvSwitcher,"'VI5O6'";
	IF(RoutedToRightDisplay = 3)		Send_Command dvSwitcher,"'VI6O6'";
	IF(RoutedToRightDisplay = 4)		SEND_COMMAND dvSwitcher,"'VI7O6'";
	IF(RoutedToRightDisplay = 5)		Send_Command dvSwitcher,"'VI3O6'";
	IF(RoutedToRightDisplay = 6)		SEND_COMMAND dvSwitcher,"'VI8O6'";
	IF(RoutedToRightDisplay = 8)		Send_Command dvSwitcher,"'VI4O6'";
	IF(RoutedToRightDisplay = 9)		SEND_COMMAND dvSwitcher,"'VI5O6'";
	IF(RoutedToRightDisplay = 10)		Send_Command dvSwitcher,"'VI6O6'";
	IF(RoutedToRightDisplay = 11)		SEND_COMMAND dvSwitcher,"'VI7O6'";
    }
}

BUTTON_EVENT[dvIpad,300]								//Program Audio Up
{
    PUSH:
    {
	IF(ProgramAudioLevel <= MaxLevelForIncrease)
	{
	    ProgramAudioLevel = ProgramAudioLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VProgramAudioLevel,' ',ITOA(ProgramAudioLevel),$0A";
	}
	ProgramAudioLevelBar = ((ProgramAudioLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(ProgramAudioLevel <= MaxLevelForIncrease)
	{
	    ProgramAudioLevel = ProgramAudioLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VProgramAudioLevel,' ',ITOA(ProgramAudioLevel),$0A";
	}
	ProgramAudioLevelBar = ((ProgramAudioLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,301]								//Program Audio Down
{
    PUSH:
    {
	IF(ProgramAudioLevel >= MinLevelForDecrease)
	{
	    ProgramAudioLevel = ProgramAudioLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VProgramAudioLevel,' ',ITOA(ProgramAudioLevel),$0A";
	}
	ProgramAudioLevelBar = ((ProgramAudioLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(ProgramAudioLevel >= MinLevelForDecrease)
	{
	    ProgramAudioLevel = ProgramAudioLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VProgramAudioLevel,' ',ITOA(ProgramAudioLevel),$0A";
	}
	ProgramAudioLevelBar = ((ProgramAudioLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,302]								//Program Audio Mute
{
    PUSH:
    {
	IF(ProgramAudioMute = 1)
	{
	    //SEND_STRING dvDSP,'csp VHandHeldMicMute 0\x0A';
	    SEND_STRING dvDSP,"'csp ',VProgramAudioMute,' 0',$0A";
	}
	ELSE IF(ProgramAudioMute = 0)
	{
	     //SEND_STRING dvDSP,'csp VHandHeldMicMute 1\x0A'
	    SEND_STRING dvDSP,"'csp ',VProgramAudioMute,' 1',$0A";
	   
	}
    }
}
BUTTON_EVENT[dvIpad,305]								//Inbound Audio Up
{
    PUSH:
    {
	IF(InboundAudioLevel <= MaxLevelForIncrease)
	{
	    InboundAudioLevel = InboundAudioLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VInvoundAudioLevel,' ',ITOA(InboundAudioLevel),$0A";
	}
	InboundAudioLevelBar = ((InboundAudioLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(InboundAudioLevel <= MaxLevelForIncrease)
	{
	    InboundAudioLevel = InboundAudioLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VInvoundAudioLevel,' ',ITOA(InboundAudioLevel),$0A";
	}
	InboundAudioLevelBar = ((InboundAudioLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,306]								//Inbound Audio Down
{
    PUSH:
    {
	IF(InboundAudioLevel >= MinLevelForDecrease)
	{
	    InboundAudioLevel = InboundAudioLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VInvoundAudioLevel,' ',ITOA(InboundAudioLevel),$0A";
	}
	InboundAudioLevelBar = ((InboundAudioLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(InboundAudioLevel >= MinLevelForDecrease)
	{
	    InboundAudioLevel = InboundAudioLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VInvoundAudioLevel,' ',ITOA(InboundAudioLevel),$0A";
	}
	InboundAudioLevelBar = ((InboundAudioLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,307]								//Inbound Audio Mute
{
    PUSH:
    {
	IF(InboundAudioMute = 1)
	{
	    //SEND_STRING dvDSP,'csp VHandHeldMicMute 0\x0A';
	    SEND_STRING dvDSP,"'csp ',VInboudAudioMute,' 0',$0A";
	}
	ELSE IF(InboundAudioMute = 0)
	{
	     //SEND_STRING dvDSP,'csp VHandHeldMicMute 1\x0A'
	     SEND_STRING dvDSP,"'csp ',VInboudAudioMute,' 1',$0A";
	     
	}
    }
}
BUTTON_EVENT[dvIpad,310]								//LapelMic Audio Up
{
    PUSH:
    {
	IF(LapelMicLevel <= MaxLevelForIncrease)
	{
	    LapelMicLevel = LapelMicLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VLapelMicLevel,' ',ITOA(LapelMicLevel),$0A";
	}
	LapelMicLevelBar = ((LapelMicLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(LapelMicLevel <= MaxLevelForIncrease)
	{
	    LapelMicLevel = LapelMicLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VLapelMicLevel,' ',ITOA(LapelMicLevel),$0A";
	}
	LapelMicLevelBar = ((LapelMicLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,311]								//LapelMic Audio Down
{
    PUSH:
    {
	IF(LapelMicLevel >= MinLevelForDecrease)
	{
	    LapelMicLevel = LapelMicLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VLapelMicLevel,' ',ITOA(LapelMicLevel),$0A";
	}
	LapelMicLevelBar = ((LapelMicLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(LapelMicLevel >= MinLevelForDecrease)
	{
	    LapelMicLevel = LapelMicLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VLapelMicLevel,' ',ITOA(LapelMicLevel),$0A";
	}
	LapelMicLevelBar = ((LapelMicLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,312]								//LapelMic Audio Mute
{
     PUSH:
    {
	IF(LapelMicMute = 1)
	{
	    //SEND_STRING dvDSP,'csp VHandHeldMicMute 0\x0A';
	    SEND_STRING dvDSP,"'csp ',VLapelMicMute,' 0',$0A";
	}
	ELSE IF(LapelMicMute = 0)
	{
	     //SEND_STRING dvDSP,'csp VHandHeldMicMute 1\x0A'
	     SEND_STRING dvDSP,"'csp ',VLapelMicMute,' 1',$0A";
	     
	}
    }
}
BUTTON_EVENT[dvIpad,315]								//HH Audio Up
{
    PUSH:
    {
	IF(HandHeldMicLevel <= MaxLevelForIncrease)
	{
	    HandHeldMicLevel = HandHeldMicLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VHandHeldMicLevel,' ',ITOA(HandHeldMicLevel),$0A";
	}
	HandHeldMicLevelBar = ((HandHeldMicLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(HandHeldMicLevel <= MaxLevelForIncrease)
	{
	    HandHeldMicLevel = HandHeldMicLevel + MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VHandHeldMicLevel,' ',ITOA(HandHeldMicLevel),$0A";
	}
	HandHeldMicLevelBar = ((HandHeldMicLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,316]								//HH Audio Down
{
    PUSH:
    {
	IF(HandHeldMicLevel >= MinLevelForDecrease)
	{
	    HandHeldMicLevel = HandHeldMicLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VHandHeldMicLevel,' ',ITOA(HandHeldMicLevel),$0A";
	}
	HandHeldMicLevelBar = ((HandHeldMicLevel + 100)* 2.2767857143);
    }
    HOLD[5,REPEAT]:
    {
	IF(HandHeldMicLevel >= MinLevelForDecrease)
	{
	    HandHeldMicLevel = HandHeldMicLevel - MicChangeLevel;
	    //SEND_STRING dvDSP,'csv VHandHeldMicLevel HandHeldMicLevel\x0A';
	    SEND_STRING dvDSP,"'csv ',VHandHeldMicLevel,' ',ITOA(HandHeldMicLevel),$0A";
	}
	HandHeldMicLevelBar = ((HandHeldMicLevel + 100)* 2.2767857143);
    }
}
BUTTON_EVENT[dvIpad,317]								//HH Audio Mute
{
    PUSH:
    {
	IF(HandHeldMicMute = 1)
	{
	    //SEND_STRING dvDSP,'csp VHandHeldMicMute 0\x0A';
	    SEND_STRING dvDSP,"'csp ',VHandHeldMicMute,' 0',$0A";
	}
	ELSE IF(HandHeldMicMute = 0)
	{
	     //SEND_STRING dvDSP,'csp VHandHeldMicMute 1\x0A'
	     SEND_STRING dvDSP,"'csp ',VHandHeldMicMute,' 1',$0A";
	     
	}
    }
}
BUTTON_EVENT[dvIpad,400]														//Left Display On
{		
    PUSH:
    {
	on[vdvRX1,255]
	
    }
}
BUTTON_EVENT[dvIpad,401]														//Left Display Off
{		
    PUSH:
    {
	off[vdvRX1,255]
    }
}
BUTTON_EVENT[dvIpad,402]														//Right Display On
{		
    PUSH:
    {
	on[vdvRX2,255]
    }
}
BUTTON_EVENT[dvIpad,403]														//Right Display Off
{		
    PUSH:
    {
	off[vdvRX2,255]
    }
}
//FEEDBACK
timeline_event[TLFEEDBACK]
{

    send_level dvIpad,233,RoutedToLeftDisplay+1;
    send_level dvIpad,234,RoutedToRightDisplay+1;
    
    //VOLUME MUTES
    [dvIpad,302]	    	=		(ProgramAudioMute = 1)
    [dvIpad,307]		=		(InboundAudioMute = 1)
    [dvIpad,312]		=		(LapelMicMute = 1)
    [dvIpad,317]		=		(HandHeldMicMute = 1)
    
    //VOLUME LEVELS 0-255								ALL VOLUME IS 0-255	
    SEND_LEVEL dvIpad,304,ProgramAudioLevelBar;
    SEND_LEVEL dvIPad,309,InboundAUdioLevelBar;
    SEND_LEVEL dvIpad,314,LapelMicLevelBar;
    SEND_LEVEL dvIpad,319,HandHeldMicLevelBar;  
    
    //Selected Source for Advanced
    [dvIpad,100]		=		(CurrentlySelectedSource = 1)
    [dvIpad,101]		=		(CurrentlySelectedSource = 2)
    [dvIpad,102] 		=		(CurrentlySelectedSource = 3)
    [dvIpad,103]		=		(CurrentlySelectedSource = 4)
    [dvIpad,104] 		=		(CurrentlySelectedSource = 5)
    [dvIpad,105]		=		(CurrentlySelectedSource = 6) 
    [dvIpad,106]		=		(CurrentlySelectedSource = 7)
    [dvIpad,107]		=		(CurrentlySelectedSource = 8)
    [dvIpad,108]		=		(CurrentlySelectedSource = 9)
    [dvIpad,109]		=		(CurrentlySelectedSource = 10)
    
    //VTC Routed Source FB
    [dvIpad,700]		=		(RoutedToVTC = 9)
    [dvIpad,701]		=		(RoutedToVTC = 10)
    [dvIpad,702] 		=		(RoutedToVTC = 11)
    [dvIpad,703]		=		(RoutedToVTC = 12)
    [dvIpad,704] 		=		(RoutedToVTC = 3)
    [dvIpad,705]		=		(RoutedToVTC = 8) 
    [dvIpad,706]		=		(RoutedToVTC = 4)
    [dvIpad,707]		=		(RoutedToVTC = 5)
    [dvIpad,708]		=		(RoutedToVTC = 6)
    [dvIpad,709]		=		(RoutedToVTC = 7)
    
    //Basic Routing FB
    [dvIpad,600]		=		(RoutedBasic = 9)
    [dvIpad,601]		=		(RoutedBasic = 10)
    [dvIpad,602] 		=		(RoutedBasic = 11)
    [dvIpad,603]		=		(RoutedBasic = 12)
    [dvIpad,604] 		=		(RoutedBasic = 3)
    [dvIpad,605]		=		(RoutedBasic = 8) 
    [dvIpad,606]		=		(RoutedBasic = 4)
    [dvIpad,607]		=		(RoutedBasic = 5)
    [dvIpad,608]		=		(RoutedBasic = 6)
    [dvIpad,609]		=		(RoutedBasic = 7)
    
    //Show VGA FB
    [dvIpad,50]			=		(ShowVGA = 1)

    //HEader FB
    [dvIpad,4]			=		(SelectedHeader = 1)
    [dvIpad,5]			=		(SelectedHeader = 2)
    [dvIpad,6]			=		(SelectedHeader = 3)
    [dvIpad,7]			=		(SelectedHeader = 4)
    
    //Selected Audio Screen FB
    [dvIpad,240]		=		(SelectedAudioScreen = 1)
    [dvIpad,241]		=		(SelectedAudioScreen = 2)
}


(*****************************************************************)
(*                                                               *)
(*                      !!!! WARNING !!!!                        *)
(*                                                               *)
(* Due to differences in the underlying architecture of the      *)
(* X-Series masters, changing variables in the DEFINE_PROGRAM    *)
(* section of code can negatively impact program performance.    *)
(*                                                               *)
(* See �Differences in DEFINE_PROGRAM Program Execution� section *)
(* of the NX-Series Controllers WebConsole & Programming Guide   *)
(* for additional and alternate coding methodologies.            *)
(*****************************************************************)

DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)



