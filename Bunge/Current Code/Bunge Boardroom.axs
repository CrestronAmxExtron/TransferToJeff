PROGRAM_NAME='Bunge Boardroom'
#DISABLE_WARNING 10571

//MIC 1 is the master mic


(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 04/05/2006  AT: 09:00:25        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $
*)

(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

dvMaster 	=	0:1:0
dvSwitcher	=	5002:1:129

dvDSP		=	0:30:0					//QSC
dvMic1		=	0:3:0					//Mic 1
dvMic2		=	0:4:0					//Mic 2
dvMic3		=	0:5:0					//Mic 3
dvMic4		=	0:6:0					//Mic 4
dvMic5		=	0:7:0					//Mic 5
dvMic6		=	0:8:0					//Mic 6
dvMic7		=	0:9:0					//Mic 7
dvMic8		=	0:10:0					//Mic 8
dvMic9		=	0:11:0					//Mic 9
dvMic10		=	0:12:0					//Mic 10
dvMic11		=	0:13:0					//Mic 11
dvMic12		=	0:14:0					//Mic 12
dvMic13		=	0:15:0					//Mic 13
dvMic14		=	0:16:0					//Mic 14
dvMic15		=	0:17:0					//Mic 15
dvMic16		=	0:18:0					//Mic 16


dvIpad		=	10001:1:1				//Ipad Apple Air 2 running Touchpanel Control.  Use TP Transfer or TP Cloud to load files.	

dvDisplayLeft	=	5001:7:1				//Left Display
dvDisplayRight	=	5001:8:1				//Right Display

//INPUTS
dv_NorthFloorbox 	=	8001:1:0
dv_CenterFloorbox	=	8002:1:0
dv_SouthFloorbox	=	8003:1:0
dv_LecternFloorbox	=	8004:1:0

//VIRTUAL DEVICES
vdvRX1              =   41002:01:0      //The COMM module should use this as its duet device
vdvRX2              =   41003:01:0      //The COMM module should use this as its duet device
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
    INTEGER	Multiplication		=	2.2767857143;
(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

//BUFFERS FOR MICS
VOLATILE CHAR	Mic1Buffer[80]
VOLATILE CHAR 	Mic2Buffer[80]
VOLATILE CHAR   Mic3Buffer[80]
VOLATILE CHAR   Mic4Buffer[80]
VOLATILE CHAR   Mic5Buffer[80]
VOLATILE CHAR   Mic6Buffer[80]
VOLATILE CHAR   Mic7Buffer[80]
VOLATILE CHAR   Mic8Buffer[80]
VOLATILE CHAR   Mic9Buffer[80]
VOLATILE CHAR   Mic10Buffer[80]
VOLATILE CHAR   Mic11Buffer[80]
VOLATILE CHAR   Mic12Buffer[80]
VOLATILE CHAR   Mic13Buffer[80]
VOLATILE CHAR   Mic14Buffer[80]
VOLATILE CHAR   Mic15Buffer[80]
VOLATILE CHAR   Mic16Buffer[80]


INTEGER SystemPowerStatus			=		0;
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
    VOLATILE CHAR IPAddress[15]			=		'10.160.208.74'
    //VOLATILE CHAR IPAddress[15]			=		'10.160.112.27'
    VOLATILE char IPPort[4]			=		'1702';
    VOLATILE CHAR nProtocol			=		'1';
    
//Network For Mics
//Mic 1
VOLATILE CHAR	M1LocalPort[15]			
VOLATILE CHAR 	M1IPAddress[15]			=		'192.168.1.34'
VOLATILE CHAR 	M1IPPort[4]			=		'2202'

//Mic 2
VOLATILE CHAR	M2LocalPort[15]			
VOLATILE CHAR 	M2IPAddress[15]			=		'192.168.1.22'
VOLATILE CHAR 	M2IPPort[4]			=		'2202'

//Mic 3
VOLATILE CHAR	M3LocalPort[15]			
VOLATILE CHAR 	M3IPAddress[15]			=		'192.168.1.24'
VOLATILE CHAR 	M3IPPort[4]			=		'2202'

//Mic 4
VOLATILE CHAR	M4LocalPort[15]			
VOLATILE CHAR 	M4IPAddress[15]			=		'192.168.1.26'
VOLATILE CHAR 	M4IPPort[4]			=		'2202'

//Mic 5
VOLATILE CHAR	M5LocalPort[15]			
VOLATILE CHAR 	M5IPAddress[15]			=		'192.168.1.28'
VOLATILE CHAR 	M5IPPort[4]			=		'2202'

//Mic 6
VOLATILE CHAR	M6LocalPort[15]			
VOLATILE CHAR 	M6IPAddress[15]			=		'192.168.1.30'
VOLATILE CHAR 	M6IPPort[4]			=		'2202'

//Mic 7
VOLATILE CHAR	M7LocalPort[15]			
VOLATILE CHAR 	M7IPAddress[15]			=		'192.168.1.32'
VOLATILE CHAR 	M7IPPort[4]			=		'2202'

//Mic 8
VOLATILE CHAR	M8LocalPort[15]			
VOLATILE CHAR 	M8IPAddress[15]			=		'192.168.1.20'
VOLATILE CHAR 	M8IPPort[4]			=		'2202'

//Mic 9
VOLATILE CHAR	M9LocalPort[15]			
VOLATILE CHAR 	M9IPAddress[15]			=		'192.168.1.36'
VOLATILE CHAR 	M9IPPort[4]			=		'2202'

//Mic 10
VOLATILE CHAR	M10LocalPort[15]			
VOLATILE CHAR 	M10IPAddress[15]		=		'192.168.1.38'
VOLATILE CHAR 	M10IPPort[4]			=		'2202'

//Mic 11
VOLATILE CHAR	M11LocalPort[15]			
VOLATILE CHAR 	M11IPAddress[15]		=		'192.168.1.40'
VOLATILE CHAR 	M11IPPort[4]			=		'2202'

//Mic 12
VOLATILE CHAR	M12LocalPort[15]			
VOLATILE CHAR 	M12IPAddress[15]		=		'192.168.1.42'
VOLATILE CHAR 	M12IPPort[4]			=		'2202'

//Mic 13
VOLATILE CHAR	M13LocalPort[15]			
VOLATILE CHAR 	M13IPAddress[15]		=		'192.168.1.44'
VOLATILE CHAR 	M13IPPort[4]			=		'2202'

//Mic 14
VOLATILE CHAR	M14LocalPort[15]			
VOLATILE CHAR 	M14IPAddress[15]		=		'192.168.1.46'
VOLATILE CHAR 	M14IPPort[4]			=		'2202'

//Mic 15
VOLATILE CHAR	M15LocalPort[15]			
VOLATILE CHAR 	M15IPAddress[15]		=		'192.168.1.48'
VOLATILE CHAR 	M15IPPort[4]			=		'2202'

//Mic 16
VOLATILE CHAR	M16LocalPort[15]			
VOLATILE CHAR 	M16IPAddress[15]		=		'192.168.1.50'
VOLATILE CHAR 	M16IPPort[4]			=		'2202'

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE
DEFINE_MODULE 'NEC_E905_Comm_dr1_0_0' comm(vdvRX1, dvDisplayLeft)
DEFINE_MODULE 'NEC_E905_Comm_dr1_0_0' comm(vdvRX2, dvDisplayRight)
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)
DEFINE_FUNCTION System_On_Presentation
{
    fnOpenTCPConnectM1(dvMic1,M1IPAddress, ATOI(M1IPPort),nProtocol)						//Mic 1
    fnOpenTCPConnectM16(dvMic16,M16IPAddress, ATOI(M16IPPort),nProtocol)						//Mic 16
    SystemPowerStatus = 1;
    on[vdvRX1,255]
    on[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,SHOW VGA'";
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
    SEND_COMMAND dvIpad,"'^PGE-Presentation_Basic'";
    
 }

DEFINE_FUNCTION System_On_Video_Conf
{
    fnOpenTCPConnectM1(dvMic1,M1IPAddress, ATOI(M1IPPort),nProtocol)						//Mic 1
    fnOpenTCPConnectM16(dvMic16,M16IPAddress, ATOI(M16IPPort),nProtocol)						//Mic 16
    SystemPowerStatus = 1;
    on[vdvRX1,255]
    on[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,HIDE VGA'";
    ShowAdvanced = 0;
    SelectedHeader = 2;
    SEND_COMMAND dvIpad,"'^PGE-Conference'";
    SEND_COMMAND dvSwitcher,"'VI1O1'";
    SEND_COMMAND dvSwitcher,"'VI2O2'";
}
DEFINE_FUNCTION System_Off
{
    fnCloseTCPConnectM1()
    fnCloseTCPConnectM16()
    SystemPowerStatus = 0;
    off[vdvRX1,255]
    off[vdvRX2,255]
    //Puts VGA's Hidden
    SHOWVGA = 0;
    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
    SEND_COMMAND dvIpad,"'^TXT-1,0,HIDE VGA'";
    SEND_COMMAND dvIpad,"'^PGE-Begin'";
    
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
DEFINE_FUNCTION ParseMic1()
{
    LOCAL_VAR INTEGER MuteOffTriggered;
    LOCAL_VAR INTEGER MuteOnTriggered;
    MuteOffTriggered = FIND_STRING(SFromMic1,'REP DEVICE_AUDIO_MUTE OFF',1);
    MuteOnTriggered = FIND_STRING(SFromMic1,'REP DEVICE_AUDIO_MUTE ON',1);
    IF(MuteOffTriggered > 0)
    {
	
	CurrentMicMute = 0;
	WAIT(20)
	{
	    set_length_string(sFromMic1,0);
	    fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)
	    fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)
	    fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)
	    fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)
	    fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)
	    fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)
	    fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)
	    fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)
	    fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)
	    fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)
	    fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)
	    fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)
	    fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)
	    fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)
	    //fnOpenTCPConnectM1(dvMic16,M1IPAddress, ATOI(M1IPPort),nProtocol)
	    UnmuteAllMicsExcept1()
	    DoNotParseMic16	=	1;
	}
	
	
    }
    ELSE IF(MuteOnTriggered > 0 )
    {
	
	CurrentMicMute = 1;
	WAIT(20)
	{
	    fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)
	    fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)
	    fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)
	    fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)
	    fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)
	    fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)
	    fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)
	    fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)
	    fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)
	    fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)
	    fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)
	    fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)
	    fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)
	    fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)
	    //fnOpenTCPConnectM1(dvMic16,M1IPAddress, ATOI(M1IPPort),nProtocol)
	    set_length_string(sFromMic1,0);
	    MuteAllMicsExcept1();
	    DoNotParseMic16 =1
	}
	
	
    }/*
    IF(sFromMic1 = 'REP DEVICE_AUDIO_MUTE OFF')
    {
	UnmuteAllMics();
	CurrentMicMute = 0;
    }
    ELSE IF(sFromMic1 = 'REP DEVICE_AUDIO_MUTE ON')
    {
	MuteAllMics();
	CurrentMicMute = 1;
    }*/
}
DEFINE_FUNCTION ParseMic16()
{
    LOCAL_VAR INTEGER MuteOffTriggered16;
    LOCAL_VAR INTEGER MuteOnTriggered16;
    MuteOffTriggered16 = FIND_STRING(SFromMic16,'REP DEVICE_AUDIO_MUTE OFF',1);
    MuteOnTriggered16 = FIND_STRING(SFromMic16,'REP DEVICE_AUDIO_MUTE ON',1);
    IF(MuteOffTriggered16 > 0)
    {
	
	CurrentMicMute = 0;
	WAIT(20)
	{
	    fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)
	    fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)
	    fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)
	    fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)
	    fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)
	    fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)
	    fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)
	    fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)
	    fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)
	    fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)
	    fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)
	    fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)
	    fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)
	    fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)
	    //fnOpenTCPConnectM1(dvMic16,M1IPAddress, ATOI(M1IPPort),nProtocol)
	    set_length_string(sFromMic16,0);
	    UnmuteAllMicsExcept16()
	    DoNotParseMic1 = 1;
	}
	WAIT(50)
	{
	    DoNotParseMic1 = 0;
	}
	
    }
    ELSE IF(MuteOnTriggered16 > 0 )
    {
	
	CurrentMicMute = 1;
	WAIT(20)
	{
	    fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)
	    fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)
	    fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)
	    fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)
	    fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)
	    fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)
	    fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)
	    fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)
	    fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)
	    fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)
	    fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)
	    fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)
	    fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)
	    fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)
	   // fnOpenTCPConnectM1(dvMic16,M1IPAddress, ATOI(M1IPPort),nProtocol)
	    set_length_string(sFromMic16,0);
	    MuteAllMicsExcept16();
	    DoNotParseMic1 = 1;
	}
	
	
    }/*
    IF(sFromMic1 = 'REP DEVICE_AUDIO_MUTE OFF')
    {
	UnmuteAllMics();
	CurrentMicMute = 0;
    }
    ELSE IF(sFromMic1 = 'REP DEVICE_AUDIO_MUTE ON')
    {
	MuteAllMics();
	CurrentMicMute = 1;
    }*/
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
DEFINE_FUNCTION MuteAllMicsExcept1()
{
    SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 16
    Mic2Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic3Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic4Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic5Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic6Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic7Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic8Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic9Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic10Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic11Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic12Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic13Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic14Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic15Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
   // Mic16Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
/*
//    SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 1
    SEND_STRING dvMic2,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 2
    SEND_STRING dvMic3,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 3
    SEND_STRING dvMic4,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 4
    SEND_STRING dvMic5,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 5
    SEND_STRING dvMic6,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 6
    SEND_STRING dvMic7,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 7
    SEND_STRING dvMic8,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 8
    SEND_STRING dvMic9,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 9
    SEND_STRING dvMic10,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 10
    SEND_STRING dvMic11,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 11
    SEND_STRING dvMic12,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 12
    SEND_STRING dvMic13,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 13
    SEND_STRING dvMic14,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 14
    SEND_STRING dvMic15,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 15
    SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 16
    */
    WAIT(50)
    {
	DoNotParseMic16 = 0;
	//fnClose2Through15()
    }
}
DEFINE_FUNCTION MuteAllMicsExcept16()
{
    SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 16
    Mic2Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic3Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic4Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic5Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic6Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic7Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic8Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic9Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic10Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic11Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic12Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic13Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic14Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
    Mic15Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
  //  Mic1Buffer = "'< SET DEVICE_AUDIO_MUTE ON >'";
/*    SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 1
    SEND_STRING dvMic2,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 2
    SEND_STRING dvMic3,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 3
    SEND_STRING dvMic4,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 4
    SEND_STRING dvMic5,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 5
    SEND_STRING dvMic6,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 6
    SEND_STRING dvMic7,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 7
    SEND_STRING dvMic8,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 8
    SEND_STRING dvMic9,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 9
    SEND_STRING dvMic10,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 10
    SEND_STRING dvMic11,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 11
    SEND_STRING dvMic12,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 12
    SEND_STRING dvMic13,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 13
    SEND_STRING dvMic14,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 14
    SEND_STRING dvMic15,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 15
    //SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE ON >'";				//Mute Mic 16*/
    WAIT(50)
    {
	DoNotParseMic1 = 0;
	//fnClose2Through15()
    }
}
DEFINE_FUNCTION UnmuteAllMicsExcept1()
{
    SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 1
    Mic2Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic3Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic4Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic5Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic6Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic7Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic8Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic9Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic10Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic11Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic12Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic13Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic14Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic15Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    //Mic16Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    /*
//  SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 1
    SEND_STRING dvMic2,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 2
    SEND_STRING dvMic3,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 3
    SEND_STRING dvMic4,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 4
    SEND_STRING dvMic5,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 5
    SEND_STRING dvMic6,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 6
    SEND_STRING dvMic7,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 7
    SEND_STRING dvMic8,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 8
    SEND_STRING dvMic9,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 9
    SEND_STRING dvMic10,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 10
    SEND_STRING dvMic11,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 11
    SEND_STRING dvMic12,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 12
    SEND_STRING dvMic13,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 13
    SEND_STRING dvMic14,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 14
    SEND_STRING dvMic15,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 15
    SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 16*/
    WAIT(50)
    {
	DoNotParseMic16 = 0;
	//fnClose2Through15()
    }
}
DEFINE_FUNCTION UnmuteAllMicsExcept16()
{
    Mic2Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic3Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic4Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic5Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic6Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic7Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic8Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic9Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic10Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic11Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic12Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic13Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic14Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    Mic15Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE OFF >'";
    //Mic1Buffer = "'< SET DEVICE_AUDIO_MUTE OFF >'";
    /*
    SEND_STRING dvMic1,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 1
    SEND_STRING dvMic2,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 2
    SEND_STRING dvMic3,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 3
    SEND_STRING dvMic4,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 4
    SEND_STRING dvMic5,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 5
    SEND_STRING dvMic6,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 6
    SEND_STRING dvMic7,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 7
    SEND_STRING dvMic8,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 8
    SEND_STRING dvMic9,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 9
    SEND_STRING dvMic10,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 10
    SEND_STRING dvMic11,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 11
    SEND_STRING dvMic12,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 12
    SEND_STRING dvMic13,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 13
    SEND_STRING dvMic14,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 14
    SEND_STRING dvMic15,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 15
//    SEND_STRING dvMic16,"'< SET DEVICE_AUDIO_MUTE OFF >'";				//Mute Mic 16*/
    WAIT(50)
    {
	DoNotParseMic1 = 0;
	//fnClose2Through15()
    }
}
DEFINE_FUNCTION fnCloseTCPConnectM1() 		//MIC 1
{
    IP_CLIENT_CLOSE (dvMic1.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM2() 		//MIC 2
{
    IP_CLIENT_CLOSE (dvMic2.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM3() 		//MIC 3
{
    IP_CLIENT_CLOSE (dvMic3.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM4() 		//MIC 4
{
    IP_CLIENT_CLOSE (dvMic4.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM5() 		//MIC 5
{
    IP_CLIENT_CLOSE (dvMic5.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM6() 		//MIC 6
{
    IP_CLIENT_CLOSE (dvMic6.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM7() 		//MIC 7
{
    IP_CLIENT_CLOSE (dvMic7.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM8() 		//MIC 8
{
    IP_CLIENT_CLOSE (dvMic8.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM9() 		//MIC 9
{
    IP_CLIENT_CLOSE (dvMic9.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM10() 		//MIC 10
{
    IP_CLIENT_CLOSE (dvMic10.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM11() 		//MIC 11
{
    IP_CLIENT_CLOSE (dvMic11.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM12() 		//MIC 12
{
    IP_CLIENT_CLOSE (dvMic12.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM13() 		//MIC 13
{
    IP_CLIENT_CLOSE (dvMic13.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM14() 		//MIC 14
{
    IP_CLIENT_CLOSE (dvMic14.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM15() 		//MIC 15
{
    IP_CLIENT_CLOSE (dvMic15.PORT)
}
DEFINE_FUNCTION fnCloseTCPConnectM16() 		//MIC 16
{
    IP_CLIENT_CLOSE (dvMic16.PORT)
}
DEFINE_FUNCTION fnClose2Through15()
{
    fnCloseTCPConnectM2()
    fnCloseTCPConnectM3()
    fnCloseTCPConnectM4()
    fnCloseTCPConnectM5()
    fnCloseTCPConnectM6()
    fnCloseTCPConnectM7()
    fnCloseTCPConnectM8()
    fnCloseTCPConnectM9()
    fnCloseTCPConnectM10()
    fnCloseTCPConnectM11()
    fnCloseTCPConnectM12()
    fnCloseTCPConnectM13()
    fnCloseTCPConnectM14()
    fnCloseTCPConnectM15()
}
DEFINE_FUNCTION fnOpenTCPConnect() 											//DSP
{
    IP_CLIENT_OPEN (dvDSP.PORT, IPADDRESS,1702, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM1(DEV dvMic1, CHAR Mic1PAddress[15], LONG Mic1Port, INTEGER MicProtocol) 		//MIC 1
{
    IP_CLIENT_OPEN (dvMic1.PORT, Mic1PAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM2(DEV dvMic2, CHAR Mic2PAddress[15], LONG Mic2Port, INTEGER MicProtocol) 		//MIC 2
{
    IP_CLIENT_OPEN (dvMic2.PORT, Mic2PAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM3(DEV dvMic3, CHAR Mic3PAddress[15], LONG Mic3Port, INTEGER MicProtocol) 		//MIC 3
{
    IP_CLIENT_OPEN (dvMic3.PORT, Mic3PAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM4(DEV dvMic4, CHAR Mic4PAddress[15], LONG Mic4Port, INTEGER MicProtocol) 		//MIC 4
{
    IP_CLIENT_OPEN (dvMic4.PORT, Mic4PAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM5(DEV dvMic5, CHAR Mic5IPAddress[15], LONG Mic5Port, INTEGER MicProtocol) 		//MIC 5
{
    IP_CLIENT_OPEN (dvMic5.PORT, Mic5IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM6(DEV dvMic6, CHAR Mic6IPAddress[15], LONG Mic6Port, INTEGER MicProtocol) 		//MIC 6
{
    IP_CLIENT_OPEN (dvMic6.PORT, Mic6IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM7(DEV dvMic7, CHAR Mic7IPAddress[15], LONG Mic7Port, INTEGER MicProtocol) 		//MIC 7
{
    IP_CLIENT_OPEN (dvMic7.PORT, Mic7IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM8(DEV dvMic8, CHAR Mic8IPAddress[15], LONG Mic8Port, INTEGER MicProtocol) 		//MIC 8
{
    IP_CLIENT_OPEN (dvMic8.PORT, Mic8IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM9(DEV dvMic9, CHAR Mic9IPAddress[15], LONG Mic9Port, INTEGER MicProtocol) 		//MIC 9
{
    IP_CLIENT_OPEN (dvMic9.PORT, Mic9IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM10(DEV dvMic10, CHAR Mic10IPAddress[15], LONG Mic10Port, INTEGER MicProtocol) 		//MIC 10
{
    IP_CLIENT_OPEN (dvMic10.PORT, Mic10IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM11(DEV dvMic11, CHAR Mic11IPAddress[15], LONG Mic11Port, INTEGER MicProtocol) 		//MIC 11
{
    IP_CLIENT_OPEN (dvMic11.PORT, Mic11IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM12(DEV dvMic12, CHAR Mic12IPAddress[15], LONG Mic12ort, INTEGER MicProtocol) 		//MIC 12
{
    IP_CLIENT_OPEN (dvMic12.PORT, Mic12IPAddress,2202, 1)
}

DEFINE_FUNCTION fnOpenTCPConnectM13(DEV dvMic13, CHAR Mic13IPAddress[15], LONG Mic13Port, INTEGER MicProtocol) 		//MIC 13
{
    IP_CLIENT_OPEN (dvMic13.PORT, Mic13IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM14(DEV dvMic14, CHAR Mic14IPAddress[15], LONG Mic14Port, INTEGER MicProtocol) 		//MIC 14
{
    IP_CLIENT_OPEN (dvMic14.PORT, Mic14IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM15(DEV dvMic15, CHAR Mic15IPAddress[15], LONG Mic15Port, INTEGER MicProtocol) 		//MIC 15
{
    IP_CLIENT_OPEN (dvMic15.PORT, Mic15IPAddress,2202, 1)
}
DEFINE_FUNCTION fnOpenTCPConnectM16(DEV dvMic16, CHAR Mic16IPAddress[15], LONG Mic16Port, INTEGER MicProtocol) 		//MIC 16
{
    IP_CLIENT_OPEN (dvMic16.PORT, Mic16IPAddress,2202, 1)
}
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
	/*fnOpenTCPConnectM1(dvMic1,M1IPAddress, ATOI(M1IPPort),nProtocol)						//Mic 1
	fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)						//Mic 2
	fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)						//Mic 3
	fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)						//Mic 4
	fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)						//Mic 5
	fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)						//Mic 6
	fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)						//Mic 7
	fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)						//Mic 8
	fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)						//Mic 9
	fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)						//Mic 10
	
	fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)						//Mic 11
	fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)						//Mic 12
	fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)						//Mic 13
	fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)						//Mic 14
	fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)						//Mic 15
	fnOpenTCPConnectM16(dvMic16,M16IPAddress, ATOI(M16IPPort),nProtocol)						//Mic 16*/
	
	
    }
}
DATA_EVENT[dvMic1]
{
    ONLINE:
    {
	//SEND_STRING dvMic1,Mic1Buffer;//Mic 1
	//Mic1Buffer = "";
    }
    OFFLINE:
    {
	IF(SystemPowerStatus = 1)
	{
	    fnOpenTCPConnectM1(dvMic1,M1IPAddress, ATOI(M1IPPort),nProtocol)												//Mic 1
	}
    }
    STRING:
    {
	IF(DoNotParseMic1 = 0)
	{
	    LOCAL_VAR CHAR sFromMic1Temp[300];
	    sFromMic1Temp = DATA.TEXT;
	    sFromMic1 ="sFromMic1,sFromMic1Temp";
	    ParseMic1();
	}
    }
    ONERROR:
    {
    }
}
DATA_EVENT[dvMic2]
{
    ONLINE:
    {
	SEND_STRING dvMic2,Mic2Buffer;
	Mic2Buffer = "";
	fnCloseTCPConnectM2()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM2(dvMic2,M2IPAddress, ATOI(M2IPPort),nProtocol)												//Mic 2
    }
    ONERROR:
    {
    }
}
DATA_EVENT[dvMic3]
{
    ONLINE:
    {
	SEND_STRING dvMic3,Mic3Buffer;//Mic 3
	Mic3Buffer = "";
	fnCloseTCPConnectM3()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM3(dvMic3,M3IPAddress, ATOI(M3IPPort),nProtocol)												//Mic 3
    }
    ONERROR:
    {
    }
}
DATA_EVENT[dvMic4]
{
    ONLINE:
    {
	SEND_STRING dvMic4,Mic4Buffer;//Mic 4
	Mic4Buffer = "";
	fnCloseTCPConnectM4()
    }
    OFFLINE:
    {
	Mic4 = 2;
	//fnOpenTCPConnectM4(dvMic4,M4IPAddress, ATOI(M4IPPort),nProtocol)						//Mic 4
    }
    ONERROR:
    {	
	
	LOCAL_VAR CHAR sFromMic4[300];
	sFromMic4 = DATA.TEXT;
	Mic4 = 3;
	
    }
}
DATA_EVENT[dvMic5]
{
    ONLINE:
    {
	SEND_STRING dvMic5,Mic5Buffer;//Mic 5
	Mic5Buffer = "";
	fnCloseTCPConnectM5()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM5(dvMic5,M5IPAddress, ATOI(M5IPPort),nProtocol)						//Mic 5
    }
}
DATA_EVENT[dvMic6]
{
    ONLINE:
    {
	SEND_STRING dvMic6,Mic6Buffer;//Mic 6
	Mic6Buffer = "";
	fnCloseTCPConnectM6()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM6(dvMic6,M6IPAddress, ATOI(M6IPPort),nProtocol)						//Mic 6
    }
    ONERROR:
    {
    }
}
DATA_EVENT[dvMic7]
{
    ONLINE:
    {
	SEND_STRING dvMic7,Mic7Buffer;//Mic 7
	Mic7Buffer = "";
	fnCloseTCPConnectM7()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM7(dvMic7,M7IPAddress, ATOI(M7IPPort),nProtocol)						//Mic 7
    }
}
DATA_EVENT[dvMic8]
{
    ONLINE:
    {
	SEND_STRING dvMic8,Mic8Buffer;
	Mic8Buffer = "";
	fnCloseTCPConnectM8()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM8(dvMic8,M8IPAddress, ATOI(M8IPPort),nProtocol)						//Mic 8
    }
}
DATA_EVENT[dvMic9]
{
    ONLINE:
    {
	SEND_STRING dvMic9,Mic9Buffer;
	Mic9Buffer = "";
	fnCloseTCPConnectM9()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM9(dvMic9,M9IPAddress, ATOI(M9IPPort),nProtocol)						//Mic 9
    }
}
DATA_EVENT[dvMic10]
{
    ONLINE:
    {
	SEND_STRING dvMic10,Mic10Buffer;
	Mic10Buffer = "";
	fnCloseTCPConnectM10()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM10(dvMic10,M10IPAddress, ATOI(M10IPPort),nProtocol)						//Mic 10
    }
}
DATA_EVENT[dvMic11]
{
    ONLINE:
    {
	SEND_STRING dvMic11,Mic11Buffer;
	Mic11Buffer = "";
	fnCloseTCPConnectM11()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM11(dvMic11,M11IPAddress, ATOI(M11IPPort),nProtocol)						//Mic 11
    }
}
DATA_EVENT[dvMic12]
{
    ONLINE:
    {
	SEND_STRING dvMic12,Mic12Buffer;
	Mic12Buffer = "";
	fnCloseTCPConnectM12()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM12(dvMic12,M12IPAddress, ATOI(M12IPPort),nProtocol)						//Mic 12
    }
}
DATA_EVENT[dvMic13]
{
    ONLINE:
    {
	SEND_STRING dvMic13,Mic13Buffer;
	Mic13Buffer = "";
	fnCloseTCPConnectM13()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM13(dvMic13,M13IPAddress, ATOI(M13IPPort),nProtocol)						//Mic 13
    }
}
DATA_EVENT[dvMic14]
{
    ONLINE:
    {
	SEND_STRING dvMic14,Mic14Buffer;
	Mic14Buffer = "";
	fnCloseTCPConnectM14()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM14(dvMic14,M14IPAddress, ATOI(M14IPPort),nProtocol)						//Mic 14
    }
}
DATA_EVENT[dvMic15]
{
    ONLINE:
    {
	SEND_STRING dvMic15,Mic15Buffer;
	Mic15Buffer = "";
	fnCloseTCPConnectM15()
    }
    OFFLINE:
    {
	//fnOpenTCPConnectM15(dvMic15,M15IPAddress, ATOI(M15IPPort),nProtocol)						//Mic 15
    }
}
DATA_EVENT[dvMic16]
{
    ONLINE:
    {
	//SEND_STRING dvMic16,Mic16Buffer;
	//Mic16Buffer = "";
    }
    OFFLINE:
    {
	IF(SystemPowerStatus = 1)
	{
	    fnOpenTCPConnectM16(dvMic16,M16IPAddress, ATOI(M16IPPort),nProtocol)						//Mic 16
	}
    }
    
    STRING:
    {
	IF(DoNotParseMic16 = 0)
	{
	    LOCAL_VAR CHAR sFromMic16Temp[300];
	    sFromMic16Temp = DATA.TEXT;
	    sFromMic16 ="sFromMic16,sFromMic16Temp";
	    ParseMic16();
	}
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
	
    }
    string:
    {
	LOCAL_VAR CHAR sFromVideoSwitcher[200];
	sFromVideoSwitcher = DATA.TEXT;
	ParseVideoSwitcher(sFromVideoSwitcher);
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
	SEND_COMMAND dvIpad,"'^PPN-ShutdownConfirm'";
    }
}
BUTTON_EVENT[dvIpad,4]									//Source Button
{
    PUSH:
    {
	SelectedHeader = 1;
	ShowAdvanced = 0;
	SEND_COMMAND dvIpad,"'^PGE-Presentation_Basic'";
	SEND_COMMAND dvSwitcher,"'VI0O1'";
	SEND_COMMAND dvSwitcher,"'VI0O2'";
	SEND_COMMAND dvSwitcher,"'VI0O6'";
	RoutedBasic = 0;
	RoutedToLeftDisplay = 0;
	RoutedToRightDisplay = 0;
    }
}
BUTTON_EVENT[dvIpad,5]									//Conference Button
{
    PUSH:
    {
	SelectedHeader = 2;
	SEND_COMMAND dvIpad,"'^PGE-Conference'";
	SEND_COMMAND dvSwitcher,"'VI1O1'";
	SEND_COMMAND dvSwitcher,"'VI2O2'";
	SEND_COMMAND dvSwitcher,"'VI1O6'";
    }
}
BUTTON_EVENT[dvIpad,6]									//Room Control Button
{
    PUSH:
    {
	SelectedHeader = 3;
	SEND_COMMAND dvIpad,"'^PGE-Room_Control'";
    }
}
BUTTON_EVENT[dvIpad,7]									//Audio Control Button
{
    PUSH:
    {
	SelectedHeader = 4;
	SEND_COMMAND dvIpad,"'^PGE-Audio'";
    }
}

BUTTON_EVENT[dvIpad,10]									//Power Off Confirm
{
    PUSH:
    {
	SEND_COMMAND dvIpad,"'^PPF-ShutdownConfirm'";
	System_Off();
	
    }
}
BUTTON_EVENT[dvIpad,11]									//Power Off Cancel
{
    PUSH:
    {
	//SEND_COMMAND dvIpad,"'^PGE-'";							//Should Be a back command
	SEND_COMMAND dvIpad,"'^PPF-ShutdownConfirm'";
    }
}

BUTTON_EVENT[dvIpad,20]
{
    PUSH:
    {
	IF(ShowAdvanced = 1)
	{
	    ShowAdvanced = 0;
	    SEND_COMMAND dvIpad,"'^PGE-Presentation_Basic'";
	}
	ELSE IF(ShowAdvanced = 0)
	{
	    ShowAdvanced = 1;
	    SEND_COMMAND dvIpad,"'^PGE-Presentation_Advanced'";
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
	    SEND_COMMAND dvIpad,"'^SHO-106.109,0'";
	    SEND_COMMAND dvIpad,"'^SHO-706.709,0'";
	    SEND_COMMAND dvIpad,"'^TXT-1,0,HIDE VGA'";
	}
	ELSE IF(ShowVGA = 0)
	{
	    ShowVGA = 1;
	    SEND_COMMAND dvIPad,"'^SHO-106.109,1'";
	    SEND_COMMAND dvIpad,"'^SHO-706.709,1'";
	    SEND_COMMAND dvIpad,"'^TXT-1,0,SHOW VGA'";
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
	    CASE 700:SEND_COMMAND dvSwitcher,"'VI9O3'";		RoutedToVTC = 9;	SEND_COMMAND dvSwitcher,"'AI903'";
	    CASE 701:SEND_COMMAND dvSwitcher,"'VI10O3'";	RoutedToVTC = 10;	SEND_COMMAND dvSwitcher,"'VI10O3'";
	    CASE 702:SEND_COMMAND dvSwitcher,"'VI11O3'";	RoutedToVTC = 11;	SEND_COMMAND dvSwitcher,"'VI11O3'";
	    CASE 703:SEND_COMMAND dvSwitcher,"'VI12O3'";	RoutedToVTC = 12;	SEND_COMMAND dvSwitcher,"'VI12O3'";
	    CASE 704:SEND_COMMAND dvSwitcher,"'VI3O3'";		RoutedToVTC = 3;	SEND_COMMAND dvSwitcher,"'VI3O3'";		
	    CASE 705:SEND_COMMAND dvSwitcher,"'VI8O3'";		RoutedToVTC = 8;	SEND_COMMAND dvSwitcher,"'VI8O3'";
	    CASE 706:SEND_COMMAND dvSwitcher,"'VI4O3'";		RoutedToVTC = 4;	SEND_COMMAND dvSwitcher,"'VI4O3'";
	    CASE 707:SEND_COMMAND dvSwitcher,"'VI5O3'";		RoutedToVTC = 5;	SEND_COMMAND dvSwitcher,"'VI5O3'";
	    CASE 708:SEND_COMMAND dvSwitcher,"'VI6O3'";		RoutedToVTC = 6;	SEND_COMMAND dvSwitcher,"'VI6O3'";	
	    CASE 709:SEND_COMMAND dvSwitcher,"'VI7O3'";		RoutedToVTC = 7;	SEND_COMMAND dvSwitcher,"'VI7O3'";
	}
    }
}
BUTTON_EVENT[dvIpad,BasicSources]
{
    PUSH:
    {
	SWITCH(BUTTON.INPUT.CHANNEL)
	{
	    CASE 600:SEND_COMMAND dvSWITCHER,"'VI9O1'";SEND_COMMAND dvSWITCHER,"'VI9O2'";RoutedToLeftDisplay = 1;RoutedToRightDisplay = 1;RoutedBasic = 9; SEND_COMMAND dvSwitcher,"'VI9O6'";//Route North HDMI Video to Both displays
	    CASE 601:SEND_COMMAND dvSWITCHER,"'VI10O1'";SEND_COMMAND dvSWITCHER,"'VI10O2'";RoutedToLeftDisplay = 2;RoutedToRightDisplay = 2;;RoutedBasic = 10; SEND_COMMAND dvSwitcher,"'VI10O6'";//Route Center HDMI Video to Both displays
	    CASE 602:SEND_COMMAND dvSWITCHER,"'VI11O1'";SEND_COMMAND dvSWITCHER,"'VI11O2'";RoutedToLeftDisplay = 3;RoutedToRightDisplay = 3;;RoutedBasic = 11; SEND_COMMAND dvSwitcher,"'VI11O6'";//Route South HDMI Video to Both displays
	    CASE 603:SEND_COMMAND dvSWITCHER,"'VI12O1'";SEND_COMMAND dvSWITCHER,"'VI12O2'";RoutedToLeftDisplay = 4;RoutedToRightDisplay = 4;;RoutedBasic = 12; SEND_COMMAND dvSwitcher,"'VI12O6'";//Route Lectern HDMI Video to Both displays
	    CASE 604:SEND_COMMAND dvSWITCHER,"'VI3O1'";SEND_COMMAND dvSWITCHER,"'VI3O2'";RoutedToLeftDisplay = 5;RoutedToRightDisplay = 5;;RoutedBasic = 3; SEND_COMMAND dvSwitcher,"'VI3O6'";//Route Cable Video to Both displays
	    CASE 605:SEND_COMMAND dvSWITCHER,"'VI8O1'";SEND_COMMAND dvSWITCHER,"'VI8O2'";RoutedToLeftDisplay = 6;RoutedToRightDisplay = 6;RoutedBasic = 8; SEND_COMMAND dvSwitcher,"'VI8O6'";//
	    CASE 606:SEND_COMMAND dvSwitcher,"'VI4O1'";SEND_COMMAND dvSwitcher,"'VI4O2'";RoutedToLeftDisplay = 8;RoutedToRightDisplay = 8;RoutedBasic = 4; SEND_COMMAND dvSwitcher,"'VI4O6'";//Clickshare 1
	    CASE 607:SEND_COMMAND dvSwitcher,"'VI5O1'";SEND_COMMAND dvSwitcher,"'VI5O2'";RoutedToLeftDisplay = 9;RoutedToRightDisplay = 9;RoutedBasic = 5; SEND_COMMAND dvSwitcher,"'VI5O6'";//Clickshare 2
	    CASE 608:SEND_COMMAND dvSwitcher,"'VI6O1'";SEND_COMMAND dvSwitcher,"'VI6O2'";RoutedToLeftDisplay = 10;RoutedToRightDisplay = 10;RoutedBasic = 6; SEND_COMMAND dvSwitcher,"'VI6O6'";//ROutes VGA South to Both displays
	    CASE 609:SEND_COMMAND dvSwitcher,"'VI7O1'";SEND_COMMAND dvSwitcher,"'VI7O2'";RoutedToLeftDisplay = 11;RoutedToRightDisplay = 11;RoutedBasic = 7; SEND_COMMAND dvSwitcher,"'VI7O6'";//ROutes VGA Lectern to Both displays
	}
    }
}
BUTTON_EVENT[dvIpad,233]								//Left Display
{
    PUSH:
    {
	RoutedBasic = 0;
	IF     (CurrentlySelectedSource = 1) {SEND_COMMAND dvSWITCHER,"'VI9O1'";RoutedToLeftDisplay = 1;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI9O6'";}}//Route North HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 2) {SEND_COMMAND dvSWITCHER,"'VI10O1'";RoutedToLeftDisplay = 2;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI10O6'";}}//Route Center HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 3) {SEND_COMMAND dvSWITCHER,"'VI11O1'";RoutedToLeftDisplay = 3;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI11O6'";}}//Route South HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 4) {SEND_COMMAND dvSWITCHER,"'VI12O1'";RoutedToLeftDisplay = 4;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI12O6'";}}//Route Lectern HDMI Video to left display
	ELSE IF(CurrentlySelectedSource = 5) {SEND_COMMAND dvSWITCHER,"'VI3O1'";RoutedToLeftDisplay = 5;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI3O6'";}}//Route Cable Video to left display
	ELSE IF(CurrentlySelectedSource = 6) {SEND_COMMAND dvSWITCHER,"'VI8O1'";RoutedToLeftDisplay = 6;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI8O6'";}}//
	ELSE IF(CurrentlySelectedSource = 7) {SEND_COMMAND dvSwitcher,"'VI4O1'";RoutedToLeftDisplay = 8;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI4O6'";}}//Clickshare 1
	ELSE IF(CurrentlySelectedSource = 8) {SEND_COMMAND dvSwitcher,"'VI5O1'";RoutedToLeftDisplay = 9;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI5O6'";}}//Clickshare 2
	ELSE IF(CurrentlySelectedSource = 9) {SEND_COMMAND dvSwitcher,"'VI6O1'";RoutedToLeftDisplay = 10;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI6O6'";}}//ROutes VGA South to left Display
	ELSE IF(CurrentlySelectedSource = 10) {SEND_COMMAND dvSwitcher,"'VI7O1'";RoutedToLeftDisplay = 11;	IF(SelectedAudioScreen = 1)	{SEND_COMMAND dvSwitcher,"'VI7O6'";}}//ROutes VGA Lectern to left Display
	
    }
}
BUTTON_EVENT[dvIpad,234]								//Right Display
{
    PUSH:
    {
	RoutedBasic = 0;
	IF(CurrentlySelectedSource = 1)	     {SEND_COMMAND dvSWITCHER,"'VI9O2'";RoutedToRightDisplay = 1;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI9O6'";}}//Route North HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 2) {SEND_COMMAND dvSWITCHER,"'VI10O2'";RoutedToRightDisplay = 2;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI10O6'";}}//Route Center HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 3) {SEND_COMMAND dvSWITCHER,"'VI11O2'";RoutedToRightDisplay = 3;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI11O6'";}}//Route South HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 4) {SEND_COMMAND dvSWITCHER,"'VI12O2'";RoutedToRightDisplay = 4;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI12O6'";}}//Route Lectern HDMI Video to right display
	ELSE IF(CurrentlySelectedSource = 5) {SEND_COMMAND dvSWITCHER,"'VI3O2'";RoutedToRightDisplay = 5;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI3O6'";}}//Route Cable Video to right display
	ELSE IF(CurrentlySelectedSource = 6) {SEND_COMMAND dvSWITCHER,"'VI8O2'";RoutedToRightDisplay = 6;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI8O6'";}}//
	ELSE IF(CurrentlySelectedSource = 7) {SEND_COMMAND dvSwitcher,"'VI4O2'";RoutedToRightDisplay = 8;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI4O6'";}}//Clickshare 1
	ELSE IF(CurrentlySelectedSource = 8) {SEND_COMMAND dvSwitcher,"'VI5O2'";RoutedToRightDisplay = 9;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI5O6'";}}//Clickshare 2
	ELSE IF(CurrentlySelectedSource = 9) {SEND_COMMAND dvSwitcher,"'VI6O2'";RoutedToRightDisplay = 10;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI6O6'";}}//ROutes VGA South to Right Display
	ELSE IF(CurrentlySelectedSource = 10) {SEND_COMMAND dvSwitcher,"'VI7O2'";RoutedToRightDisplay = 11;	IF(SelectedAudioScreen = 2)	{SEND_COMMAND dvSwitcher,"'VI7O6'";}} //ROutes VGA Lectern to Right Display
    }
}


BUTTON_EVENT[dvIpad,240]								//LeftDisplay Audio
{
    PUSH:
    {
	SelectedAudioScreen =1;	
	IF(RoutedToLeftDisplay = 1)		Send_Command dvSwitcher,"'VI9O6'";
	IF(RoutedToLeftDisplay = 2)		SEND_COMMAND dvSwitcher,"'VI10O6'";
	IF(RoutedToLeftDisplay = 3)		Send_Command dvSwitcher,"'VI11O6'";
	IF(RoutedToLeftDisplay = 4)		SEND_COMMAND dvSwitcher,"'VI12O6'";
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
	IF(RoutedToRightDisplay = 1)		Send_Command dvSwitcher,"'VI9O6'";
	IF(RoutedToRightDisplay = 2)		SEND_COMMAND dvSwitcher,"'VI10O6'";
	IF(RoutedToRightDisplay = 3)		Send_Command dvSwitcher,"'VI11O6'";
	IF(RoutedToRightDisplay = 4)		SEND_COMMAND dvSwitcher,"'VI12O6'";
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

BUTTON_EVENT[dvIpad,99999]														//Right Display Off
{		
    PUSH:
    {
	sFromMic1 = "";
	sFromMic16 = "";
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
(* See “Differences in DEFINE_PROGRAM Program Execution” section *)
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


