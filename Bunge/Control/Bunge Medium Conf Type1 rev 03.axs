PROGRAM_NAME='Bunge Medium Conference Type1'

/*
    Room List
    146
    147
    157
    345
    428
    445
*/

(***********************************************************)
(*  FILE CREATED ON: 08/30/2017  AT: 15:29:12              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 14:17:39        *)
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
TL_POLL = 2

LONG n_500_Milliseconds[1]={500}    //Feedback query
LONG n_10000_Milliseconds[1]={10000}    //Poll query

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
float temp_volume
float cks
integer nMonitorPower
float gain
integer nMuteState

persistent integer nSourceRouted
persistent char sIP_Address[15]

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
TIMELINE_CREATE(TL_FB,n_500_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //feedback
TIMELINE_CREATE(TL_POLL,n_10000_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //polling
 nAutoShutdownFlag = 0

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

DATA_EVENT[dvSamsungDM55E]
{
    ONLINE:
    {
	SEND_COMMAND dvSamsungDM55E, 'SET BAUD 9600,N,8,1'
    }
    STRING:
    {
	if(find_string(data.text,"$AA,$FF,$00,$03,$41,$11,$00,$54",1)) 	// Power is off
	{
	    nMonitorPower = 0
	}
	else if(find_string(data.text,"$AA,$FF,$00,$03,$41,$11,$01,$55",1))	// Power is on
	{
	    nMonitorPower = 1
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
    if(nMuteState && nMonitorPower)
    {
	[dvKeypad,6] = ![dvKeypad,6]
    }
    else 
    {
	[dvKeypad,6] = 0
    }
    
    [dvKeypad,7] = nMonitorPower == 1
    [dvKeypad,8] = nMonitorPower == 0
    
    
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

TIMELINE_EVENT[TL_POLL]
{
    SEND_STRING dvSamsungDM55E, "$AA,$11,$00,$00,$11"
}

LEVEL_EVENT[dvKeypad,2]
{
    stack_var integer scaled_volume
    stack_var char temp[20]
    stack_var integer i
    stack_var integer checksum

    if(nMonitorPower)
    {
	volume = level.value
	
	if(volume > 0)
	{
	    nMuteState = 0
	}
	
	SEND_LEVEL dvKeypad, 1, volume
	scaled_volume = TYPE_CAST((100 * volume) / 255)
	
	checksum = ($12 + $00 + $01 + scaled_volume) % 256
	
	SEND_STRING dvSamsungDM55E, "$AA,$12,$00,$01,scaled_volume, checksum"
    }
}

BUTTON_EVENT[dvKeypad,7]		//Power On
{
    PUSH:
    {
	SEND_STRING dvSamsungDM55E, "$AA,$11,$00,$01,$01,$13"
	nMonitorPower = 1
	send_level dvKeypad, 1, volume
    }
}

BUTTON_EVENT[dvKeypad,8]		//Power Off
{
    PUSH:
    {
	SEND_STRING dvSamsungDM55E, "$AA,$11,$00,$01,$00,$12"
	nMonitorPower = 0
	send_level dvKeypad, 1, 0
    }
}

BUTTON_EVENT[dvKeypad,6]
BUTTON_EVENT[dvKeypad,11]		//mute toggle
{
    PUSH:
    {
        stack_var integer scaled_volume
	stack_var integer checksum
	
	if(nMonitorPower)
	{
	    nMuteState = !nMuteState
	    
	    if(nMuteState)
	    {
		temp_volume = volume
		volume = 0
	    }
	    else
	    {
		volume = temp_volume
	    }
	    
	    SEND_LEVEL dvKeypad, 1, volume
	    scaled_volume = TYPE_CAST((100 * volume) / 255)
	    
	    checksum = ($12 + $00 + $01 + scaled_volume) % 256
	    
	    SEND_STRING dvSamsungDM55E, "$AA,$12,$00,$01,scaled_volume, checksum"
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


