PROGRAM_NAME='Bunge Small Conf or Interview Room'

/*
    Room List
    314
    315
    420
*/

(***********************************************************)
(*  FILE CREATED ON: 09/25/2017  AT: 14:00:29              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 14:34:32        *)
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

vdvSamsungDM55E	= 41001:1:0	// The COMM module should use this as its duet device
dvSamsungDM55E	= 5001:1:0	// This device should be used as the physical device by the COMM module

vdvCiscoSX10	= 41002:1:0	// The COMM module should use this as its duet device
dvCiscoSX10	= 0:3:0		// ETHERNET CONTROL


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
DEFINE_MODULE 'Cisco_SX10_CE_Comm_dr1_0_0' comm(vdvCiscoSX10, dvCiscoSX10)
(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

TIMELINE_EVENT[TL_Feedback]
{
    nVTC_Online = [vdvCiscoSX10, 251]
    nVTC_Initialized = [vdvCiscoSX10, 252]
    nVTC_Standby_State = [vdvCiscoSX10, 255]
    nVTC_Call_State = [vdvCiscoSX10, 238]
    
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
	    send_command vdvCiscoSX10, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "on"',$0D,$0A"
	}
	else
	{
	    send_command vdvCiscoSX10, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "off"',$0D,$0A"
	}
	nMonitorPowerStateTemp = nMonitorPowerState
    }
    if(nMonitorPowerState)
    {
	if(nSourcePollPacer == 6)
	{
	    send_command vdvSamsungDM55E, "'?INPUT'";
	    if(nMonitorPowerState)
	    {
		send_command vdvCiscoSX10, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "on"',$0D,$0A"
	    }
	    else
	    {
		send_command vdvCiscoSX10, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "off"',$0D,$0A"
	    }
	    nSourcePollPacer = 1;
	}
	nSourcePollPacer = nSourcePollPacer + 1;
    }
    
    // auto shutdown if current time matches auto shutdown time
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE))
    {
	if(!nAutoShutdownFlag)	// check flag to make sure it only fires once
	{
	    off[vdvSamsungDM55E,255];
	    off[vdvCiscoSX10,255];
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
    }
}

DATA_EVENT[vdvCiscoSX10]
{
    ONLINE:
    {
	switch(system_number)
	{
	    case 314: {sIP_Address = "'10.160.90.24'"}		// Room 314
	    case 315: {sIP_Address = "'10.160.90.26'"}		// Room 315
	    case 420: {sIP_Address = "'10.160.90.32'"}		// Room 420
	}
	
	SEND_COMMAND vdvCiscoSX10,"'PROPERTY-IP_Address,',sIP_Address"
	//SEND_COMMAND vdvCiscoSX10,"'PROPERTY-Port,23'" // TELNET PORT
	SEND_COMMAND vdvCiscoSX10,"'PROPERTY-Port,22'" // SSH PORT
	SEND_COMMAND vdvCiscoSX10,"'PROPERTY-User_Name,amx'" // 
	SEND_COMMAND vdvCiscoSX10,"'PROPERTY-Password,amxcontrol123'" // 
	SEND_COMMAND vdvCiscoSX10,"'PASSBACK-1'"
	SEND_COMMAND vdvCiscoSX10,"'REINIT'"
	//SEND_COMMAND vdvCiscoSX10,"'debug-4'" // use only when debugging project.
	
	wait 100
	{
	    SEND_COMMAND vdvCiscoSX10,"'PASSTHRU-xfeedback register event/UserInterface/Extensions/Event',$0D"	//Listen for Custom Controls
	}
    }
    STRING:
    {
	char cTemp[500]
	cTemp = data.text
	
	if(find_string(cTemp, "'widget_TvInput:1'",1))
	{
	    send_command vdvSamsungDM55E, "'INPUT-HDMI,1'"
	    nSourceDesired = 1;
	}
//	if(find_string(cTemp, "'widget_TvInput:2'",1))
//	{
//	    send_command vdvSamsungDM55E, "'INPUT-HDMI,2'"
//	}
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
	    SEND_COMMAND vdvCiscoSX10,"'PASSTHRU-xfeedback register event/UserInterface/Extensions/Event',$0D"	//Listen for Custom Controls
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
	if(find_string(data.text,'INPUT-HDMI,1',1))
	{
	    nSourceRouted=1
	    send_command vdvCiscoSX10,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "1"',$0D,$0A"
	}
	if(find_string(data.text,'INPUT-HDMI,2',1))
	{
	    nSourceRouted=2
	    send_command vdvCiscoSX10,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "2"',$0D,$0A"
	}
    }
}

CHANNEL_EVENT[vdvCiscoSX10,238]	// in call, switch inputs
{
    on:
    {
	send_command vdvSamsungDM55E, "'INPUT-HDMI,1'"
	nSourceDesired = 1;		// (switch to HDMI 1 in Timeline)
    }
}

CHANNEL_EVENT[vdvCiscoSX10,255]
{
    on:
    {
	on[vdvSamsungDM55E,255];
	nMonitorPowerDesired = 1;
	nSourceDesired = 1;		// (switch to HDMI 1 in Timeline)
    }
    off:
    {
	off[vdvSamsungDM55E,255];
	nMonitorPowerDesired = 0;
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


