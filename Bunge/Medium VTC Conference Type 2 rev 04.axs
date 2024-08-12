PROGRAM_NAME='Medium VTC Conference Type 2'

/*
    Room List
    152
    244
    245
    323
    344
    432
    444
*/

(***********************************************************)
(*  FILE CREATED ON: 09/25/2017  AT: 14:00:29              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 05/15/2018  AT: 08:46:24        *)
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

dvMaster	= 0:1:0		// AMX Processor

dvSolecis	= 7001:1:0	// Solecis Switcher

vdvSamsungDM55E	= 41001:1:0	// The COMM module should use this as its duet device
dvSamsungDM55E	= 5001:1:0	// This device should be used as the physical device by the COMM module

vdvCiscoSX80	= 41002:1:0	// The COMM module should use this as its duet device
dvCiscoSX80	= 0:3:0		// ETHERNET CONTROL


(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

LONG n_500_Milliseconds[1]={500}    //Feedback query
TL_Feedback = 1;

// Shutdown at 21:00 (9 PM)
INTEGER SHUTDOWN_HOUR = 21
INTEGER SHUTDOWN_MINUTE = 0

(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

non_volatile char cInput[2][20]

persistent integer nSourceRouted
persistent integer nSourceDesired
volatile integer nSourcePollPacer
persistent char sIP_Address[15]

volatile integer nVTC_Online
volatile integer nVTC_Initialized
volatile integer nVTC_Standby_State
volatile integer nVTC_Call_State

volatile integer nMonitorPowerState
volatile integer nMonitorPowerStateTemp
volatile integer nMonitorPowerDesired
volatile integer nMonitorPowerPollPacer

integer nAutoShutdownFlag

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

TIMELINE_CREATE(TL_Feedback,n_500_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //feedback
nAutoShutdownFlag = 0

DEFINE_MODULE 'Samsung_DM55E_Comm_dr1_0_0' comm(vdvSamsungDM55E, dvSamsungDM55E)
DEFINE_MODULE 'Cisco_SX80_CE_Comm_dr1_0_0' comm(vdvCiscoSX80, dvCiscoSX80)
(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

TIMELINE_EVENT[TL_Feedback]
{
    nVTC_Online = [vdvCiscoSX80, 251]
    nVTC_Initialized = [vdvCiscoSX80, 252]
    nVTC_Standby_State = [vdvCiscoSX80, 255]
    nVTC_Call_State = [vdvCiscoSX80, 238]
    
    select
    {
	active([vdvSamsungDM55E,255] && [vdvSamsungDM55E,253]):	nMonitorPowerState = 1	// warming
	active([vdvSamsungDM55E,255] && [vdvSamsungDM55E,254]):	nMonitorPowerState = 0	// cooling
	active([vdvSamsungDM55E,255]):					nMonitorPowerState = 1	// on
	active(![vdvSamsungDM55E,255]):				nMonitorPowerState = 0	// off
    }
    if(nMonitorPowerDesired <> nMonitorPowerState)	// Force Power
    {
	if(nMonitorPowerPollPacer == 6)
	{
	    if(nMonitorPowerDesired == 1)
	    {
		pulse[vdvSamsungDM55E,27]
	    }
	    else
	    {
		pulse[vdvSamsungDM55E,28]
	    }
	    nMonitorPowerPollPacer = 0
	}
	nMonitorPowerPollPacer = nMonitorPowerPollPacer + 1;
    }
    if(nMonitorPowerState <> nMonitorPowerStateTemp)	// update feedback on the cisco
    {
	if(nMonitorPowerState)
	{
	    send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "on"',$0D,$0A"
	}
	else
	{
	    send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "off"',$0D,$0A"
	}
	nMonitorPowerStateTemp = nMonitorPowerState;
    }
    if(nMonitorPowerState)				// poll monitor for status
    {
	if(nSourcePollPacer == 6)
	{
	    send_command vdvSamsungDM55E, "'?INPUT'";
	    if(nMonitorPowerState)
	    {
		send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "on"',$0D,$0A"
	    }
	    else
	    {
		send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "off"',$0D,$0A"
	    }
	    nSourcePollPacer = 0;
	}
	nSourcePollPacer = nSourcePollPacer + 1;
    }
    
    // auto shutdown if current time matches auto shutdown time
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE))
    {
	if(!nAutoShutdownFlag)	// check flag to make sure it only fires once
	{
	    off[vdvSamsungDM55E,255];
	    off[vdvCiscoSX80,255];
	    nMonitorPowerDesired = 0;
	    
	    nAutoShutdownFlag = 1
	}
    }
    // reset auto shutdown flag after a minute
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE + 1))
    {
	nAutoShutdownFlag = 0
    }
}

DATA_EVENT[dvMaster]
{
    ONLINE:
    {
	nSourcePollPacer = 0;
	nMonitorPowerPollPacer = 0;
	
	switch(system_number)
	{
	    case 432:
	    {
		cInput[1] = 'HDMI,1'
		cInput[2] = 'DVI,1'
	    }
	    default:
	    {
		cInput[1] = 'HDMI,1'
		cInput[2] = 'HDMI,2'
	    }
	}
    }
}

DATA_EVENT[dvSolecis]
{
    ONLINE:
    {
	integer nDevice;
	integer nSystem;
	nDevice = data.device.number;
	nSystem = data.device.system;
	
	
	send_command nDevice:1:nSystem, "'VIDIN_EDID-MIRROR OUT 1'";
	send_command nDevice:1:nSystem, "'VIDIN_HDCP-DISABLE'";
	
	send_command nDevice:2:nSystem, "'VIDIN_EDID-MIRROR OUT 1'";
	send_command nDevice:2:nSystem, "'VIDIN_HDCP-DISABLE'";
	
	send_command nDevice:3:nSystem, "'VIDIN_EDID-MIRROR OUT 1'";
	send_command nDevice:3:nSystem, "'VIDIN_HDCP-DISABLE'";
	
	send_command nDevice:4:nSystem, "'VIDIN_EDID-MIRROR OUT 1'";
	send_command nDevice:4:nSystem, "'VIDIN_HDCP-DISABLE'";
	
	send_command nDevice:5:nSystem, "'VIDIN_EDID-MIRROR OUT 1'";
	send_command nDevice:5:nSystem, "'VIDIN_HDCP-DISABLE'";
    }
}

DATA_EVENT[vdvCiscoSX80]
{
    ONLINE:
    {
	switch(system_number)
	{
	    case 152: {sIP_Address = "'10.160.90.17'"}
	    case 244: {sIP_Address = "'10.160.90.20'"}
	    case 245: {sIP_Address = "'10.160.90.22'"}
	    case 323: {sIP_Address = "'10.160.90.28'"}
	    case 344: {sIP_Address = "'10.160.90.30'"}
	    case 432: {sIP_Address = "'10.160.90.34'"}
	    case 444: {sIP_Address = "'10.160.90.36'"}
	}
	
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-IP_Address,',sIP_Address"
//	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,23'" // TELNET PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,22'" // SSH PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-User_Name,amx'" // 
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Password,amxcontrol123'" // 
	SEND_COMMAND vdvCiscoSX80,"'PASSBACK-1'"
	SEND_COMMAND vdvCiscoSX80,"'REINIT'"
//	SEND_COMMAND vdvCiscoSX80,"'debug-4'" // use only when debugging project.

	wait 100
	{
	    SEND_COMMAND vdvCiscoSX80,"'PASSTHRU-xfeedback register event/UserInterface/Extensions/Event',$0D"	//Listen for Custom Controls
	}
    }
    
    STRING:
    {
	char cTemp[500]
	cTemp = data.text
	
	if(find_string(cTemp, "'widget_TvInput:1'",1))
	{
//	    send_command vdvSamsungDM55E, "'INPUT-HDMI,1'";
	    send_command vdvSamsungDM55E, "'INPUT-',cInput[1]";
	    nSourceDesired = 1;
	}
	if(find_string(cTemp, "'widget_TvInput:2'",1))
	{
//	    send_command vdvSamsungDM55E, "'INPUT-HDMI,2'";
	    send_command vdvSamsungDM55E, "'INPUT-',cInput[2]";
	    nSourceDesired = 2;
	}
	if(find_string(cTemp, "'widget_TvPower:on'",1))
	{
	    on[vdvSamsungDM55E,255];
	    nMonitorPowerDesired = 1;
	}
	if(find_string(cTemp, "'widget_TvPower:off'",1))
	{
	    off[vdvSamsungDM55E,255];
	    nMonitorPowerDesired = 0;
	}
	
	if(find_string(cTemp, "'SystemUnit Software Version'",1))
	{
	    SEND_COMMAND vdvCiscoSX80,"'PASSTHRU-xfeedback register event/UserInterface/Extensions/Event',$0D"	//Listen for Custom Controls
	}
    }
}

DATA_EVENT[vdvSamsungDM55E] 
{
    online:
    {
	send_command vdvSamsungDM55E,"'PROPERTY-Device_ID,0'";
	send_command vdvSamsungDM55E,"'REINIT'";
    }
    command:
    {
//	if(find_string(data.text,'INPUT-HDMI,1',1))
	if(find_string(data.text,"'INPUT-',cInput[1]",1))
	{
	    nSourceRouted=1
	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "1"',$0D,$0A"
	}
//	if(find_string(data.text,'INPUT-HDMI,2',1))
	if(find_string(data.text,"'INPUT-',cInput[2]",1))
	{
	    nSourceRouted=2
	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "2"',$0D,$0A"
	}
	
	if(nSourceDesired <> nSourceRouted)
	{
//	    send_command vdvSamsungDM55E, "'INPUT-HDMI,',itoa(nSourceDesired)"
	    send_command vdvSamsungDM55E, "'INPUT-',cInput[nSourceDesired]"
	}
    }
}

CHANNEL_EVENT[vdvCiscoSX80,238]	// in call, switch inputs
{
    on:
    {
	nSourceDesired = 1;		// (switch to HDMI 1 in Timeline)
    }
}

CHANNEL_EVENT[vdvCiscoSX80,255]
{
    on:
    {
	on[vdvSamsungDM55E,255];
	nMonitorPowerDesired = 1;
	nSourceDesired = 1;		// (switch to HDMI 1 in Timeline)
    }
    off:
    {
	if(nSourceRouted == 1)	//if tv is on cisco input, shutdown, else, don't
	{
	    off[vdvSamsungDM55E,255];
	    nMonitorPowerDesired = 0;
	}
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

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)


