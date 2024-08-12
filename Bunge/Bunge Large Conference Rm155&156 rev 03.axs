PROGRAM_NAME='Bunge Large Conference rm155&156'

/*
    Room List
    155
    156
*/

(***********************************************************)
(*  FILE CREATED ON: 08/30/2017  AT: 15:29:12              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 14:31:35        *)
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

dvMassio	= 0:1:0

dvKeypad	= 5001:28:0

dvSolecis	= 7001:1:0

vdvSamsungDM55E	= 41001:1:0  // The COMM module should use this as its duet device
dvSamsungDM55E	= 5001:1:0 // This device should be used as the physical device by the COMM module


(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

TL_FB = 1

LONG n_500_Milliseconds[1]={500}    //Feedback query

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
persistent integer nSourceRouted
volatile integer nMonitorPowerState
volatile integer nMonitorPowerStateTemp

integer nAutoShutdownFlag

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

([dvKeypad,7],[dvKeypad,8])

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
TIMELINE_CREATE(TL_FB,n_500_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //feedback
nAutoShutdownFlag = 0

DEFINE_MODULE 'Samsung_DM55E_Comm_dr1_0_0' comm(vdvSamsungDM55E, dvSamsungDM55E)
 
(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

DATA_EVENT[dvKeyPad]
{
    online:
    {
	send_command data.device,"'@BRT-28,0'"
	send_command data.device,"'@WBRT-28,0'"
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
//	if(find_string(data.text,'INPUT-HDMI',1)) nSourceRouted=1
//	if(find_string(data.text,'INPUT-VGA',1)) nSourceRouted=2
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
	
	send_command nDevice:1:nSystem, "'VIDIN_AUTO_SELECT-ENABLE'";
    }
    COMMAND:
    {
	stack_var char trash[50]
	
	send_string 0:1:0, "'Command Event'"
	
	if(find_string(data.text,'LVIDEO', 1))
	{
	    send_string 0:1:0,"'COMMAND IS: ',data.text"
	    
	    trash = remove_string(data.text,'LVIDEOI', 1)
	    nSourceRouted = atoi(left_string(data.text,1))
	}
    }
}

TIMELINE_EVENT[TL_FB]
{
    
    if([vdvSamsungDM55E,199] && nMonitorPowerState)
    {
	[dvKeypad,6] = ![dvKeypad,6]
    }
    else 
    {
	[dvKeypad,6] = 0
    }
    
    select
    {
	active([vdvSamsungDM55E,255] && [vdvSamsungDM55E,253]):	nMonitorPowerState = 1	// warming
	active([vdvSamsungDM55E,255] && [vdvSamsungDM55E,254]):	nMonitorPowerState = 0	// cooling
	active([vdvSamsungDM55E,255]):					nMonitorPowerState = 1	// on
	active(![vdvSamsungDM55E,255]):				nMonitorPowerState = 0	// off
    }
    
    if(nMonitorPowerState <> nMonitorPowerStateTemp)
    {
	if(nMonitorPowerState)
	{
	    wait 120 send_command vdvSamsungDM55E,"'INPUT-HDMI,1'"
	}
	nMonitorPowerStateTemp = nMonitorPowerState
    }
    
    [dvKeypad,7] = nMonitorPowerState == 1
    [dvKeypad,8] = nMonitorPowerState == 0
    
    // auto shutdown if current time matches auto shutdown time
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE))
    {
	if(!nAutoShutdownFlag)	// check flag to make sure it only fires once
	{
	    do_push(dvKeypad,8)
	    nAutoShutdownFlag = 1
	}
    }
    // reset auto shutdown flag after a minute
    if((TIME_TO_HOUR(TIME) == SHUTDOWN_HOUR) && (TIME_TO_MINUTE(TIME) == SHUTDOWN_MINUTE + 1))
    {
	nAutoShutdownFlag = 0
    }
}

//LEVEL_EVENT[vdvSamsungDM55E,1]
//{
//    volume=level.value
//    send_level dvKeyPad,1,volume
//}

LEVEL_EVENT[dvKeypad,2]
{
    if(nMonitorPowerState)
    {
	volume = level.value
	if(volume > 0)
	{
	    off[vdvSamsungDM55E,199]
	}	
	send_level dvKeypad,1,volume
	send_level vdvSamsungDM55E,1,volume
    }
}

BUTTON_EVENT[dvKeypad,7]		//Power On
{
    PUSH:
    {
	on[vdvSamsungDM55E,255]
	send_level dvKeypad, 1, volume
    }
}

BUTTON_EVENT[dvKeypad,8]		//Power Off
{
    PUSH:
    {
	off[vdvSamsungDM55E,255]
	send_level dvKeypad, 1, 0
    }
}

BUTTON_EVENT[dvKeypad,6]
BUTTON_EVENT[dvKeypad,11]		//mute toggle
{
    PUSH:
    {
	if(nMonitorPowerState)
	{
	    [vdvSamsungDM55E,199]=![vdvSamsungDM55E,199]
	}
    }
}


DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)


