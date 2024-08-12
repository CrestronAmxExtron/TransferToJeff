PROGRAM_NAME='Bunge Medium VTC Conf Room Type3'

(***********************************************************)
(*  FILE CREATED ON: 08/30/2017  AT: 15:29:12              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 14:39:55        *)
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

dvMaster	= 0:1:0

dvSolecis	= 7001:1:0

vdvSamsungMon1	= 41001:1:0  // The COMM module should use this as its duet device
dvSamsungMon1	= 5001:1:0 // This device should be used as the physical device by the COMM module

vdvSamsungMon2	= 41002:1:0  // The COMM module should use this as its duet device
dvSamsungMon2	= 5001:2:0 // This device should be used as the physical device by the COMM module

vdvCiscoSX80	= 41003:1:0	// The COMM module should use this as its duet device
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

float volume
persistent integer nSource1Routed
persistent integer nSource2Routed
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

volatile integer nMonitor2PowerState
volatile integer nMonitor2PowerStateTemp
volatile integer nMonitor2PowerPollPacer

non_volatile integer nPollEnable = 1

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

DEFINE_MODULE 'Samsung_DM55E_Comm_dr1_0_0' comm(vdvSamsungMon1, dvSamsungMon1)
DEFINE_MODULE 'Samsung_DM55E_Comm_dr1_0_0' comm(vdvSamsungMon2, dvSamsungMon2)
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
	active([vdvSamsungMon1,255] && [vdvSamsungMon1,253]):	nMonitorPowerState = 1	// warming
	active([vdvSamsungMon1,255] && [vdvSamsungMon1,254]):	nMonitorPowerState = 0	// cooling
	active([vdvSamsungMon1,255]):				nMonitorPowerState = 1	// on
	active(![vdvSamsungMon1,255]):				nMonitorPowerState = 0	// off
    }
    select
    {
	active([vdvSamsungMon2,255] && [vdvSamsungMon2,253]):	nMonitor2PowerState = 1	// warming
	active([vdvSamsungMon2,255] && [vdvSamsungMon2,254]):	nMonitor2PowerState = 0	// cooling
	active([vdvSamsungMon2,255]):				nMonitor2PowerState = 1	// on
	active(![vdvSamsungMon2,255]):				nMonitor2PowerState = 0	// off
    }
    
    if(nMonitorPowerDesired <> nMonitorPowerState)	// Force Power
    {
	if(nMonitorPowerPollPacer == 6)
	{
	    if(nMonitorPowerDesired == 1)
	    {
		pulse[vdvSamsungMon1,27]
	    }
	    else
	    {
		pulse[vdvSamsungMon1,28]
	    }
	    nMonitorPowerPollPacer = 0
	}
	nMonitorPowerPollPacer = nMonitorPowerPollPacer + 1;
    }
    if(nMonitorPowerDesired <> nMonitor2PowerState)	// Force Power
    {
	if(nMonitor2PowerPollPacer == 6)
	{
	    if(nMonitorPowerDesired == 1)
	    {
		pulse[vdvSamsungMon1,27]
	    }
	    else
	    {
		pulse[vdvSamsungMon1,28]
	    }
	    nMonitor2PowerPollPacer = 0
	}
	nMonitor2PowerPollPacer = nMonitor2PowerPollPacer + 1;
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
	nMonitorPowerStateTemp = nMonitorPowerState
    }
    if(nMonitorPowerState && nPollEnable)	// poll monitor for status
    {
	if(nSourcePollPacer == 6)
	{
	    send_command vdvSamsungMon1, "'?INPUT'";
	    send_command vdvSamsungMon2, "'?INPUT'";
	    if(nMonitorPowerState)
	    {
		send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "on"',$0D,$0A"
	    }
	    else
	    {
		send_command vdvCiscoSX80, "'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvPower" Value: "off"',$0D,$0A"
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
	    off[vdvSamsungMon1,255];
	    off[vdvSamsungMon2,255];
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
	nMonitor2PowerPollPacer = 0;
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
	    case 448: {sIP_Address = "'10.160.90.38'"}
	}
	
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-IP_Address,',sIP_Address"
	//SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,23'" // TELNET PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Port,22'" // SSH PORT
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-User_Name,amx'" // 
	SEND_COMMAND vdvCiscoSX80,"'PROPERTY-Password,amxcontrol123'" // 
	SEND_COMMAND vdvCiscoSX80,"'PASSBACK-1'"
	SEND_COMMAND vdvCiscoSX80,"'REINIT'"
	//SEND_COMMAND vdvCiscoSX80,"'debug-4'" // use only when debugging project.
    }
    STRING:
    {
	char cTemp[500]
	cTemp = data.text
	
	if(find_string(cTemp, "'widget_TvInput:1'",1))
	{
	    send_command vdvSamsungMon1, "'INPUT-HDMI,1'"
	    send_command vdvSamsungMon2, "'INPUT-HDMI,1'"
	    nSourceDesired = 1;
	}
	if(find_string(cTemp, "'widget_TvInput:2'",1))
	{
	    send_command vdvSamsungMon1, "'INPUT-HDMI,2'"
	    nSourceDesired = 2;
	}
	if(find_string(cTemp, "'widget_TvPower:on'",1))
	{
	    on[vdvSamsungMon1,255]
	    on[vdvSamsungMon2,255]
	    nMonitorPowerDesired = 1;
	}
	if(find_string(cTemp, "'widget_TvPower:off'",1))
	{
	    off[vdvSamsungMon1,255]
	    off[vdvSamsungMon2,255]
	    nMonitorPowerDesired = 0;
	}
	
	if(find_string(cTemp, "'SystemUnit Software Version'",1))
	{
	    SEND_COMMAND vdvCiscoSX80,"'PASSTHRU-xfeedback register event/UserInterface/Extensions/Event',$0D"	//Listen for Custom Controls
	}
    }
}

CHANNEL_EVENT[vdvSamsungMon1,255] {
    on : {
	wait 120 send_command vdvSamsungMon1,"'INPUT-HDMI,1'"
    }
}

CHANNEL_EVENT[vdvSamsungMon2,255] {
    on : {
	wait 120 send_command vdvSamsungMon2,"'INPUT-HDMI,1'"
    }
}

DATA_EVENT[vdvSamsungMon1]
{
    online:
    {
	send_command data.device,"'PROPERTY-Device_ID,0'";
	send_command data.device,"'REINIT'";
    }
    command:
    {
	if(find_string(data.text,'INPUT-HDMI,1',1))
	{
	    nSource1Routed=1
	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "1"',$0D,$0A"
	}
	if(find_string(data.text,'INPUT-HDMI,2',1))
	{
	    nSource1Routed=2
	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "2"',$0D,$0A"
	}
	if(nSourceDesired <> nSource1Routed)
	{
	    send_command vdvSamsungMon1, "'INPUT-HDMI,',itoa(nSourceDesired)"
	}
    }
}

DATA_EVENT[vdvSamsungMon2]
{
    online:
    {
	send_command data.device,"'PROPERTY-Device_ID,0'";
	send_command data.device,"'REINIT'";
    }
    command:
    {
	if(find_string(data.text,'INPUT-HDMI,1',1))
	{
	    nSource2Routed=1
//	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "1"',$0D,$0A"
	}
	if(find_string(data.text,'INPUT-HDMI,2',1))
	{
	    nSource2Routed=2
//	    send_command vdvCiscoSX80,"'PASSTHRU-xCommand UserInterface Extensions Widget SetValue WidgetId: "widget_TvInput" Value: "2"',$0D,$0A"
	}
	if(nSourceDesired <> nSource2Routed)
	{
	    send_command vdvSamsungMon2, "'INPUT-HDMI,1'"
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
	on[vdvSamsungMon1,255]
	on[vdvSamsungMon2,255]
	nMonitorPowerDesired = 1;
	nSourceDesired = 1;		// (switch to HDMI 1 in Timeline)
    }
    off:
    {
	if(nSource1Routed == 1)	//if tv is on cisco input, shutdown, else, don't
	{
	    off[vdvSamsungMon1,255]
	    nMonitorPowerDesired = 0;
	}
	off[vdvSamsungMon2,255]
    }
}




DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)


