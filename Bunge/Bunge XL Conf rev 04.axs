PROGRAM_NAME='Bunge XL Conference rm143 and 144'

/*
    Room List
    143
    144
*/

(***********************************************************)
(*  FILE CREATED ON: 08/30/2017  AT: 15:29:12              *)
(***********************************************************)
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 02/12/2018  AT: 12:04:00        *)
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

vdvNEC_E905	= 41001:1:0  // The COMM module should use this as its duet device
dvNEC_E905	= 5001:1:0 // This device should be used as the physical device by the COMM module


(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

TL_FB = 1
TL_POLL = 2

MONITOR_ID = 1

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
integer nMonitorID
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

DEFINE_FUNCTION fnNEC_SendString(char MessageType[1], char MessageStr[30])
{
    // Message Types are as follows
    // 'A' Command
    // 'B' Command Reply
    // 'C' Get current parameter
    // 'D' 'Get parameter' reply
    // 'E' Set parameter
    // 'F' 'set parameter' reply
    
    stack_var char CheckSumStr[30]
    stack_var char LengthStr[2]
    stack_var integer i
    stack_var integer checksum
        
    if(length_string(MessageStr) > $0F)
    {
	LengthStr = "itohex(length_string(MessageStr))"
    }
    else
    {
	LengthStr = "'0',itohex(length_string(MessageStr))"
    }
    
    CheckSumStr = "'0',nMonitorID,'0',MessageType,LengthStr,MessageStr"
        
    checksum = $00
    for(i=1;i <= length_string(CheckSumStr);i++)
    {
	checksum = checksum BXOR CheckSumStr[i]
    }
    
    SEND_STRING dvNEC_E905, "$01,CheckSumStr, checksum,$0D"
}

DEFINE_FUNCTION fnNEC_Volume(integer unscaled_volume)
{
    stack_var integer scaled_volume
    
    scaled_volume = TYPE_CAST((100 * unscaled_volume) / 255)
    if(scaled_volume > $0F)
    {
	fnNEC_SendString("'E'","$02,'0062','00',itohex(scaled_volume),$03")
    }
    else
    {
	fnNEC_SendString("'E'","$02,'0062','000',itohex(scaled_volume),$03")
    }
}

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
TIMELINE_CREATE(TL_FB,n_500_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //feedback
TIMELINE_CREATE(TL_POLL,n_10000_Milliseconds,1,TIMELINE_ABSOLUTE,TIMELINE_REPEAT) //polling

nMonitorID = $40 + MONITOR_ID
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

DATA_EVENT[dvNEC_E905]
{
    ONLINE:
    {
	SEND_COMMAND dvNEC_E905, 'SET BAUD 9600,N,8,1'
    }
    STRING:
    {
	if(find_string(data.text,"$02,'0200D60000040001',$03",1)) 		// Power is on
	{
	    nMonitorPower = 1
	}
	else if(find_string(data.text,"$02,'0200D60000040002',$03",1))	// Power is Standby
	{
	    nMonitorPower = 0
	}
	else if(find_string(data.text,"$02,'0200D60000040003',$03",1))	// Power is Suspend
	{
	    nMonitorPower = 0
	}
	else if(find_string(data.text,"$02,'0200D60000040004',$03",1))	// Power is Off
	{
	    nMonitorPower = 0
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
    fnNEC_SendString("'A'","$02,'01D6',$03") 
}

LEVEL_EVENT[dvKeypad,2]
{
    if(nMonitorPower)
    {
	volume = level.value
	
	if(volume > 0)
	{
	    nMuteState = 0
	}
	
	SEND_LEVEL dvKeypad, 1, volume
	fnNEC_Volume(level.value)
    }
}

BUTTON_EVENT[dvKeypad,7]		//Power On
{
    PUSH:
    {	
	fnNEC_SendString("'A'","$02,'C203D60001',$03") 
	nMonitorPower = 1
	send_level dvKeypad, 1, volume
	
	wait 100
	{
	    fnNEC_SendString("'E'","$02,'0060','0011',$03")
	}
    }
}

BUTTON_EVENT[dvKeypad,8]		//Power Off
{
    PUSH:
    {
	fnNEC_SendString("'A'","$02,'C203D60004',$03") 
	nMonitorPower = 0
	send_level dvKeypad, 1, 0
    }
}

BUTTON_EVENT[dvKeypad,6]
BUTTON_EVENT[dvKeypad,11]		//mute toggle
{
    PUSH:
    {
	if(nMonitorPower)
	{
	    nMuteState = !nMuteState
	    if(nMuteState)
	    {
		fnNEC_SendString("'E'","$02,'008D0001',$03") 
	    }
	    else
	    {
		fnNEC_SendString("'E'","$02,'008D0002',$03") 
	    }
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


