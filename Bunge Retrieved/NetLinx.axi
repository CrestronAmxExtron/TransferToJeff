//####
//# Legal Notice :
//#    Copyright, AMX LLC, 2015
//#    Private, proprietary information, the sole property of AMX LLC.  The
//#    contents, ideas, and concepts expressed herein are not to be disclosed
//#    except within the confines of a confidential relationship and only
//#    then on a need to know basis.
//#
//#    Any entity in possession of this AMX Software shall not, and shall not
//#    permit any other person to, disclose, display, loan, publish, transfer
//#    (whether by sale, assignment, exchange, gift, operation of law or
//#    otherwise), license, sublicense, copy, or otherwise disseminate this
//#    AMX Software.
//#
//#    This AMX Software is owned by AMX and is protected by United States
//#    copyright laws, patent laws, international treaty provisions, and/or
//#    state of Texas trade secret laws.
//#
//#    Portions of this AMX Software may, from time to time, include
//#    pre-release code and such code may not be at the level of performance,
//#    compatibility and functionality of the final code. The pre-release code
//#    may not operate correctly and may be substantially modified prior to
//#    final release or certain features may not be generally released. AMX is
//#    not obligated to make or support any pre-release code. All pre-release
//#    code is provided "as is" with no warranties.
//#
//#    This AMX Software is provided with restricted rights. Use, duplication,
//#    or disclosure by the Government is subject to restrictions as set forth
//#    in subparagraph (1)(ii) of The Rights in Technical Data and Computer
//#    Software clause at DFARS 252.227-7013 or subparagraphs (1) and (2) of
//#    the Commercial Computer Software Restricted Rights at 48 CFR 52.227-19,
//#    as applicable.
//####

(*------------------------------------------------------------------------------------------------*)
(* NOTE: In the follow arrays with a size of 1 means that the size is set runtime  *)
(*       Size of 1 is just a place holder for the compiler to do type checking     *)
(*------------------------------------------------------------------------------------------------*)

(*------------------------------------------------------------------------------------------------*)
(* Set Netlinx System *)
(*------------------------------------------------------------------------------------------------*)
#DEFINE __NETLINX__

(*------------------------------------------------------------------------------------------------*)
(* Predefined Constants *)
(*------------------------------------------------------------------------------------------------*)
DEFINE_CONSTANT
(*-- NetLinx.axi version -------------------------------------------------------------------------*)
CHAR NETLINX_AXI_VERSION[6]    = '1.62';
(*-- URL Constants -------------------------------------------------------------------------------*)
CHAR URL_Flg_TCP              = 1;     // TCP connection
CHAR URL_Flg_AcctInfoPresent  = $02;   // Added v1.21 - If set, the User and Password fields are valid
CHAR URL_Flg_Temp             = $10;   // Temp Connection
CHAR URL_Flg_Stat_PrgNetLinx  = $20;   // URL set by NetLinx Set_URL_List
CHAR URL_Flg_Stat_Mask        = $C0;   // status mask upper 2 bits
CHAR URL_Flg_Stat_Lookup      = $00;   // Looking up IP
CHAR URL_Flg_Stat_Connecting  = $40;   // connecting
CHAR URL_Flg_Stat_Waiting     = $80;   // waiting
CHAR URL_Flg_Stat_Connected   = $C0;   // connected
(*-- IP Address Flag Constants -------------------------------------------------------------------*)
CHAR IP_Addr_Flg_DHCP         = 1;     // Use DHCP
(*-- for user ------------------------------------------------------------------------------------*)
INTEGER  FIRST_VIRTUAL_DEVICE   = 32768;
INTEGER  FIRST_LOCAL_PORT       = 2;
DEV      DYNAMIC_VIRTUAL_DEVICE = 36864:1:0;
INTEGER  TIMELINE_ONCE          = 0;
INTEGER  TIMELINE_REPEAT        = 1;
INTEGER  TIMELINE_ABSOLUTE      = 0;
INTEGER  TIMELINE_RELATIVE      = 1;
INTEGER  DO_PUSH_TIMED_INFINITE = $FFFF;
(*-- for source type -----------------------------------------------------------------------------*)
INTEGER  SOURCE_TYPE_NO_ADDRESS          = $00;
INTEGER  SOURCE_TYPE_NEURON_ID           = $01;
INTEGER  SOURCE_TYPE_IP_ADDRESS          = $02;
INTEGER  SOURCE_TYPE_AXLINK              = $03;
INTEGER  SOURCE_TYPE_NEURON_SUBNODE_ICSP = $10;
INTEGER  SOURCE_TYPE_NEURON_SUBNODE_PL   = $11;
INTEGER  SOURCE_TYPE_IP_SOCKET_ADDRESS   = $12;
INTEGER  SOURCE_TYPE_RS232               = $13;
INTEGER  SOURCE_TYPE_INTERNAL            = $14; // Corrected value v1.25
(*------------------------------------------------------------------------------------------------*)
(* Added v1.25 *)
(*------------------------------------------------------------------------------------------------*)
INTEGER  SOURCE_TYPE_MAC_ADDRESS         = $04;
INTEGER  SOURCE_TYPE_IPv4_PORT           = $05;
INTEGER  SOURCE_TYPE_IPv4_PORT_MAC_ADDRESS = $06;

(*------------------------------------------------------------------------------------------------*)
(* Added v1.59 *)
(*------------------------------------------------------------------------------------------------*)
INTEGER  SOURCE_TYPE_IPv4_PORT_MAC_IPv6  =$18;

(*------------------------------------------------------------------------------------------------*)
(* Added v1.17 *)
(*------------------------------------------------------------------------------------------------*)
CHAR INTERNAL_QUEUE_SIZE_INDEX_INTERPRETER    = 0;
CHAR INTERNAL_QUEUE_SIZE_INDEX_NOTIFICATION_MGR   = 1;
CHAR INTERNAL_QUEUE_SIZE_INDEX_CONNECTION_MGR     = 2;
CHAR INTERNAL_QUEUE_SIZE_INDEX_ROUTE_MGR          = 3;
CHAR INTERNAL_QUEUE_SIZE_INDEX_DEVICE_MGR         = 4;
CHAR INTERNAL_QUEUE_SIZE_INDEX_DIAGNOSTIC_MGR     = 5;
CHAR INTERNAL_QUEUE_SIZE_INDEX_TCP_TX             = 6;
CHAR INTERNAL_QUEUE_SIZE_INDEX_IPCONNECTION_MGR   = 7;
CHAR INTERNAL_QUEUE_SIZE_INDEX_MESSAGE_DISPATCHER = 8;
CHAR INTERNAL_QUEUE_SIZE_INDEX_AXLINK_TX          = 9;
CHAR INTERNAL_QUEUE_SIZE_INDEX_PHASTLINK_TX       = 10;
CHAR INTERNAL_QUEUE_SIZE_INDEX_ICSPLONTALK_TX     = 11;
CHAR INTERNAL_QUEUE_SIZE_INDEX_ICSP232_TX         = 12;
CHAR INTERNAL_QUEUE_SIZE_INDEX_ICSPIP_TX          = 13;
CHAR INTERNAL_QUEUE_SIZE_INDEX_NI_DEVICE          = 19;

CHAR INTERNAL_THRESHOLD_INDEX_INTERPRETER = 0;
CHAR INTERNAL_THRESHOLD_INDEX_LONTALK     = 1;
CHAR INTERNAL_THRESHOLD_INDEX_IP          = 2;

(*------------------------------------------------------------------------------------------------*)
(* Added v1.18 *)
(*------------------------------------------------------------------------------------------------*)
CHAR TRUE = 1;
CHAR FALSE = 0;

CHAR FILE_READ_ONLY = 1;
CHAR FILE_RW_NEW = 2;
CHAR FILE_RW_APPEND = 3;

CHAR IP_TCP = 1;
CHAR IP_UDP = 2;
CHAR IP_UDP_2WAY = 3;

CHAR XML_ENCODE_TYPES = $01;
CHAR XML_ENCODE_CHAR_AS_LIST = $10;
CHAR XML_ENCODE_LE = $20;

CHAR XML_DECODE_TYPES = $01;
CHAR XML_DECODE_NO_PRESERVE = $10;

(*------------------------------------------------------------------------------------------------*)
(* Added v1.46 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_DISPLAY_DEVICE[]                  = 'com.amx.duet.devicesdk.Display';

(*------------------------------------------------------------------------------------------------*)
(* Added v1.42 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_RFIDSYSTEM_DEVICE[]               = 'com.amx.duet.devicesdk.RFIDSystem';

(*------------------------------------------------------------------------------------------------*)
(* Added v1.40 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_LIGHTSYSTEM_DEVICE[]              = 'com.amx.duet.devicesdk.LightSystem';

(*------------------------------------------------------------------------------------------------*)
(* Added v1.29 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_IO_DEVICE[]                       = 'com.amx.duet.devicesdk.IODevice';
CHAR DUET_DEV_TYPE_RELAY_DEVICE[]                    = 'com.amx.duet.devicesdk.RelayDevice';
CHAR DUET_DEV_TYPE_UPS[]                             = 'com.amx.duet.devicesdk.UPS';

(*------------------------------------------------------------------------------------------------*)
(* Added v1.26 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_AMPLIFIER[]                       = 'com.amx.duet.devicesdk.Amplifier';
(*------------------------------------------------------------------------------------------------*)
(* Added v1.23 *)
(*------------------------------------------------------------------------------------------------*)
CHAR DUET_DEV_TYPE_AUDIO_CONFERENCER[]               = 'com.amx.duet.devicesdk.AudioConferencer';
CHAR DUET_DEV_TYPE_AUDIO_MIXER[]                     = 'com.amx.duet.devicesdk.AudioMixer';
CHAR DUET_DEV_TYPE_AUDIO_PROCESSOR[]                 = 'com.amx.duet.devicesdk.AudioProcessor';
CHAR DUET_DEV_TYPE_AUDIO_TUNER_DEVICE[]              = 'com.amx.duet.devicesdk.AudioTunerDevice';
CHAR DUET_DEV_TYPE_CAMERA[]                          = 'com.amx.duet.devicesdk.Camera';
CHAR DUET_DEV_TYPE_DIGITAL_MEDIA_ENCODER[]       = 'com.amx.duet.devicesdk.DigitalMediaEncoder';
CHAR DUET_DEV_TYPE_DIGITAL_MEDIA_DECODER[]           = 'com.amx.duet.devicesdk.DigitalMediaDecoder';
CHAR DUET_DEV_TYPE_DIGITAL_MEDIA_SERVER[]            = 'com.amx.duet.devicesdk.DigitalMediaServer';
CHAR DUET_DEV_TYPE_DSS[]                             = 'com.amx.duet.devicesdk.DigitalSatelliteSystem';
CHAR DUET_DEV_TYPE_DVR[]                             = 'com.amx.duet.devicesdk.DigitalVideoRecorder';
CHAR DUET_DEV_TYPE_DISC_DEVICE[]                     = 'com.amx.duet.devicesdk.DiscDevice';
CHAR DUET_DEV_TYPE_DOCUMENT_CAMERA[]                 = 'com.amx.duet.devicesdk.DocumentCamera';
CHAR DUET_DEV_TYPE_AUDIO_TAPE[]                      = 'com.amx.duet.devicesdk.AudioTape';
CHAR DUET_DEV_TYPE_HVAC[]                            = 'com.amx.duet.devicesdk.HVAC';
CHAR DUET_DEV_TYPE_KEYPAD[]                          = 'com.amx.duet.devicesdk.Keypad';
CHAR DUET_DEV_TYPE_LIGHT[]                           = 'com.amx.duet.devicesdk.Light';
CHAR DUET_DEV_TYPE_MONITOR[]                         = 'com.amx.duet.devicesdk.Monitor';
CHAR DUET_DEV_TYPE_MOTOR[]                           = 'com.amx.duet.devicesdk.Motor';
CHAR DUET_DEV_TYPE_MULTI_WINDOW[]            = 'com.amx.duet.devicesdk.MultiWindow';
CHAR DUET_DEV_TYPE_POOL_SPA[]                        = 'com.amx.duet.devicesdk.PoolSpa';
CHAR DUET_DEV_TYPE_PREAMP_SURROUND_SOUND_PROCESSOR[] = 'com.amx.duet.devicesdk.PreAmpSurroundSoundProcessor';
CHAR DUET_DEV_TYPE_RECEIVER[]                        = 'com.amx.duet.devicesdk.Receiver';
CHAR DUET_DEV_TYPE_SECURITY_SYSTEM[]                 = 'com.amx.duet.devicesdk.SecuritySystem';
CHAR DUET_DEV_TYPE_SENSOR_DEVICE[]                   = 'com.amx.duet.devicesdk.SensorDevice';
CHAR DUET_DEV_TYPE_SETTOP_BOX[]                      = 'com.amx.duet.devicesdk.SettopBox';
CHAR DUET_DEV_TYPE_SLIDE_PROJECTOR[]                 = 'com.amx.duet.devicesdk.SlideProjector';
CHAR DUET_DEV_TYPE_SWITCHER[]                        = 'com.amx.duet.devicesdk.Switcher';
CHAR DUET_DEV_TYPE_TEXT_KEYPAD[]             = 'com.amx.duet.devicesdk.TextKeypad';
CHAR DUET_DEV_TYPE_TV[]                              = 'com.amx.duet.devicesdk.TV';
CHAR DUET_DEV_TYPE_UTILITY[]                 = 'com.amx.duet.devicesdk.Utility';
CHAR DUET_DEV_TYPE_VCR[]                             = 'com.amx.duet.devicesdk.VCR';
CHAR DUET_DEV_TYPE_VIDEO_CONFERENCER[]               = 'com.amx.duet.devicesdk.VideoConferencer';
CHAR DUET_DEV_TYPE_VIDEO_PROCESSOR[]                 = 'com.amx.duet.devicesdk.VideoProcessor';
CHAR DUET_DEV_TYPE_VIDEO_PROJECTOR[]                 = 'com.amx.duet.devicesdk.VideoProjector';
CHAR DUET_DEV_TYPE_VIDEO_WALL[]                      = 'com.amx.duet.devicesdk.VideoWall';
CHAR DUET_DEV_TYPE_VOLUME_CONTROLLER[]               = 'com.amx.duet.devicesdk.VolumeController';
CHAR DUET_DEV_TYPE_WEATHER[]                         = 'com.amx.duet.devicesdk.Weather';

INTEGER DUET_DEV_NOT_POLLED = 0;
INTEGER DUET_DEV_POLLED     = 1;

(* Added v1.28, Clock Manager *)
INTEGER CLKMGR_MODE_NETWORK    = $01;
INTEGER CLKMGR_MODE_STANDALONE = $02;

(* Added v1.41, STANDBY devices *)
INTEGER NORMAL_STANDBY         = $01;
INTEGER NORMAL_WAKE            = $03;

(* Added v1.43, IP Option constants */
INTEGER IP_MULTICAST_TTL_OPTION   = 1;
INTEGER IP_TTL_SUBNET         = 1;
INTEGER IP_TTL_SITE       = 32;
INTEGER IP_TTL_REGION         = 64;
INTEGER IP_TTL_CONTINENT      = 128;

(* Added v1.45, IP NODELAY Option constants */
INTEGER IP_TCP_NODELAY_OPTION     = 2;
INTEGER IP_NODELAY_ON         = 1;
INTEGER IP_NODELAY_OFF        = 0;
(* Added v1.53, to support AMX_LOG, SMTP *)
LONG AMX_ERROR = 1;
LONG AMX_WARNING = 2;
LONG AMX_INFO = 3;
LONG AMX_DEBUG = 4;

(* Added v1.54, to support AUDIT_NETLINX_SESSION_EVENT *)
LONG NETLINX_LOGIN_SUCCESS = 0;
LONG NETLINX_LOGIN_FAIL = 1;
LONG NETLINX_LOGOUT = 2;

CHAR NULL_STR[] = '';
CHAR SMTP_ADDRESS[] = 'ADDRESS';
CHAR SMTP_PORT_NUMBER[] = 'PORT';
CHAR SMTP_USERNAME[] = 'USERNAME';
CHAR SMTP_PASSWORD[] = 'PASSWORD';
CHAR SMTP_REQUIRE_TLS[] = 'REQUIRE_TLS';
CHAR SMTP_FROM[] = 'FROM';

CHAR SMTP_TLS_TRUE[] = 'TRUE';
CHAR SMTP_TLS_FALSE[] = 'FALSE';

(* Added v1.55, to support dynamic data feeds *)
INTEGER LISTVIEW_ON_ROW_SELECT_EVENT = 1;

INTEGER DATA_STRUCTURE_UNKNOWN    = 0;
INTEGER DATA_STRUCTURE_DATAFEED   = 1;
INTEGER DATA_STRUCTURE_DATARECORDSET    = 2;
INTEGER DATA_STRUCTURE_DATARECORD = 3;
INTEGER DATA_STRUCTURE_DATAFIELD  = 4;

INTEGER DATA_MAX_CONTENT_FIELD_COUNT  = 30;
INTEGER DATA_MAX_METADATA_FIELD_COUNT = 20;
INTEGER DATA_MAX_ID_LENGTH            = 30;
INTEGER DATA_MAX_NAME_LENGTH          = 30;
INTEGER DATA_MAX_DESCRIPTION_LENGTH   = 255;
INTEGER DATA_MAX_TYPE_LENGTH          = 30;
INTEGER DATA_MAX_FORMAT_LENGTH        = 30;
INTEGER DATA_MAX_SOURCE_LENGTH        = 255;
INTEGER DATA_MAX_VALUE_LENGTH         = 2048;
INTEGER DATA_MAX_LABEL_LENGTH         = 100;
INTEGER DATA_MAX_URL_LENGTH           = 500;

(* Added v1.56 *)
INTEGER MAX_LAST_LOGIN_INFO_LENGTH    = 45;

CHAR DATA_TYPE_UNKNOWN[]    = '';
CHAR DATA_TYPE_STRING[]     = 'string';
CHAR DATA_TYPE_DATETIME[]   = 'datetime';
CHAR DATA_TYPE_DATE[]       = 'date';
CHAR DATA_TYPE_TIME[]       = 'time';
CHAR DATA_TYPE_IMAGE[]      = 'image';
CHAR DATA_FORMAT_URL[]      = 'url';
CHAR DATA_FORMAT_PHONE[]    = 'phone';
CHAR DATA_FORMAT_EMAIL[]    = 'email';
CHAR DATA_FORMAT_ISO8601[]  = 'ISO-8601';

(* Added v1.58 *)
CHAR AUDITLOG_PRIV[] = 'AuditLog';
CHAR CONFIGURATION_PRIV[] = 'Configuration';
CHAR DEVICECONFIG_PRIV[] = 'DeviceConfig';
CHAR FTP_PRIV[] = 'FTP';
CHAR HTTP_PRIV[] = 'HTTP';
CHAR NETWORKCONFIG_PRIV[] = 'NetworkConfig';
CHAR PROGRAMPORT_PRIV[] = 'ProgramPort';
CHAR REMOTEUI_PRIV[] = 'RemoteUI';
CHAR SECURITYCONTROL_PRIV[] = 'SecurityControl';
CHAR SOFTWAREMANAGEMENT_PRIV[] = 'SoftwareManagement';
CHAR TERMINAL_PRIV[] = 'Terminal';
CHAR TPADMIN_PRIV[] = 'TPAdmin';
CHAR USER1_PRIV[] = 'User1';
CHAR USER2_PRIV[] = 'User2';
CHAR USER3_PRIV[] = 'User3';
CHAR USER4_PRIV[] = 'User4';
CHAR USERMANAGEMENT_PRIV[] = 'UserManagement';

(*--- Account auth errors ---*)
SLONG VALID_ACCOUNT            = 0;
SLONG ERR_NAME_INVALID         = -1;
SLONG ERR_PASSWORD_INVALID     = -2;
SLONG ERR_INVALID_ACCOUNT      = -3;
SLONG ERR_NO_AUTHORIZATION     = -4;
SLONG ERR_INVALID_PARAMETER    = -5;
SLONG ERR_USER_LOCKED_OUT      = -6;
SLONG ERR_USER_ACCOUNT_EXPIRED = -7;
SLONG ERR_GENERAL_ERROR        = -8;
SLONG ERR_AUTHENTICATION_ERROR = -9;


INTEGER TLS_IGNORE_CERTIFICATE_ERRORS = 1;
INTEGER TLS_VALIDATE_CERTIFICATE  = 0;

(*------------------------------------------------------------------------------------------------*)
(* End of Predefined Constants *)
(*------------------------------------------------------------------------------------------------*)

(*------------------------------------------------------------------------------------------------*)
(* Predefined Types *)
(*------------------------------------------------------------------------------------------------*)
DEFINE_TYPE
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TBUTTON
{
  DEVCHAN INPUT;
  LONG    HOLDTIME;
  DEV     SOURCEDEV;
}
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TCHANNEL
{
  DEV     DEVICE;
  INTEGER CHANNEL;
  DEV     SOURCEDEV;
}
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TDATA
{
  DEV      DEVICE;
  LONG     NUMBER;
  CHAR     TEXT[2048];
  CHAR     SOURCEIP[32];
  INTEGER  SOURCEPORT;
  DEV      SOURCEDEV;
}
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TLEVEL
{
  DEVLEV   INPUT;
  CHAR     VALUE;
  DEV      SOURCEDEV;
}
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TTIMELINE
{
  INTEGER  ID;
  INTEGER  SEQUENCE;
  LONG     TIME;
  INTEGER  RELATIVE;
  LONG     REPETITION;
}
(*------------------------------------------------------------------------------------------------*)
STRUCTURE TCUSTOM
{
  DEV      DEVICE;
  INTEGER  ID;
  INTEGER  TYPE;
  INTEGER  FLAG;
  SLONG    VALUE1;
  SLONG    VALUE2;
  SLONG    VALUE3;
  CHAR     TEXT[2048];
  CHAR     ENCODE[2048];
  DEV      SOURCEDEV;
}
(*------------------------------------------------------------------------------------------------*)

(*------------------------------------------------------------------------------------------------*)
(* URL Manipulation structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE URL_STRUCT
{
  CHAR     Flags;           // Connection Type (normally 1)
  INTEGER  Port;            // TCP port (normally 1319)
  CHAR     URL[128];        // string: URL or IP address
  CHAR     User[20];        // optional account info for ICSPS Added v1.21
  CHAR     Password[20];    // optional account info for ICSPS Added v1.21
}
(*------------------------------------------------------------------------------------------------*)
(* DNS Manipulation structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE DNS_STRUCT
{
  CHAR     DomainName[128];    // domain suffix (e.g. panja.com)
  CHAR     DNS1[32];           // IP address of 1st DNS server
  CHAR     DNS2[32];           // IP address of 2nd DNS server
  CHAR     DNS3[32];           // IP address of 3rd DNS server
}
(*------------------------------------------------------------------------------------------------*)
(* IP Address Manipulation structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE IP_ADDRESS_STRUCT
{
  CHAR     FLAGS;          // Configuration flags
  CHAR     HOSTNAME[128];  // Host name
  CHAR     IPADDRESS[32];  // IP address unit
  CHAR     SUBNETMASK[32]; // subnet mask
  CHAR     GATEWAY[32];    // IP address of gateway
}
(*------------------------------------------------------------------------------------------------*)
(* Device Info Structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE DEV_INFO_STRUCT
{
  CHAR     MANUFACTURER_STRING[128];
  INTEGER  MANUFACTURER;
  CHAR     DEVICE_ID_STRING[128];
  INTEGER  DEVICE_ID;
  CHAR     VERSION[32];
  INTEGER  FIRMWARE_ID;
  CHAR     SERIAL_NUMBER[32];
  INTEGER  SOURCE_TYPE;
  CHAR     SOURCE_STRING[32];
}

(*------------------------------------------------------------------------------------------------*)
(* Added v1.28, Clock Manager Time Offset Structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE CLKMGR_TIMEOFFSET_STRUCT
{
  INTEGER     HOURS;
  INTEGER     MINUTES;
  INTEGER     SECONDS;
}

(*------------------------------------------------------------------------------------------------*)
(* Added v1.28, Clock Manager Time Server Entry Structure *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE CLKMGR_TIMESERVER_STRUCT
{
  CHAR     IS_SELECTED;           (* TRUE/FALSE *)
  CHAR     IS_USER_DEFINED;       (* TRUE/FALSE *)
  CHAR     IP_ADDRESS_STRING[48]; (* Allow enough room for IPv6 in the future *)
  CHAR     URL_STRING[32];
  CHAR     LOCATION_STRING[32];
}

(*------------------------------------------------------------------------------------------------*)
(* Added v1.55, to support data feeds *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE DATA_FEED
{
  CHAR name[DATA_MAX_NAME_LENGTH]
  CHAR description[DATA_MAX_DESCRIPTION_LENGTH]
  CHAR source[DATA_MAX_SOURCE_LENGTH]
  LONG lastUpdate
}

STRUCTURE DATA_FIELD
{
  CHAR id[DATA_MAX_ID_LENGTH]
  CHAR type[DATA_MAX_TYPE_LENGTH]
  CHAR format[DATA_MAX_FORMAT_LENGTH]
  CHAR label[DATA_MAX_LABEL_LENGTH]
  CHAR value[DATA_MAX_VALUE_LENGTH]
}

STRUCTURE DATA_RECORD
{
  DATA_FIELD metadata[DATA_MAX_METADATA_FIELD_COUNT]
  DATA_FIELD content[DATA_MAX_CONTENT_FIELD_COUNT]
}

STRUCTURE WC_DATA_FEED
{
  CHAR name[DATA_MAX_NAME_LENGTH]
  WIDECHAR description[DATA_MAX_DESCRIPTION_LENGTH]
  WIDECHAR source[DATA_MAX_SOURCE_LENGTH]
  LONG lastUpdate
}

STRUCTURE WC_DATA_FIELD
{
  WIDECHAR id[DATA_MAX_ID_LENGTH]
  CHAR type[DATA_MAX_TYPE_LENGTH]
  CHAR format[DATA_MAX_FORMAT_LENGTH]
  WIDECHAR label[DATA_MAX_LABEL_LENGTH]
  WIDECHAR value[DATA_MAX_VALUE_LENGTH]
}

STRUCTURE WC_DATA_RECORD
{
  WC_DATA_FIELD metadata[DATA_MAX_METADATA_FIELD_COUNT]
  WC_DATA_FIELD content[DATA_MAX_CONTENT_FIELD_COUNT]
}

(*------------------------------------------------------------------------------------------------*)
(* Added v1.56 *)
(*------------------------------------------------------------------------------------------------*)
STRUCTURE LAST_LOGIN_INFO
{
    INTEGER failedLoginCount
    CHAR lastSuccessfulLoginDate[MAX_LAST_LOGIN_INFO_LENGTH]
    CHAR lastSuccessfulLoginIp[MAX_LAST_LOGIN_INFO_LENGTH]
    CHAR lastFailedLoginDate[MAX_LAST_LOGIN_INFO_LENGTH]
    CHAR lastFailedLoginIp[MAX_LAST_LOGIN_INFO_LENGTH]
}

(*------------------------------------------------------------------------------------------------*)
(* End of Predefined Types *)
(*------------------------------------------------------------------------------------------------*)

(* Added v1.47, to suppress debug error *)
DEFINE_VARIABLE
INTEGER ___RESERVED___;

(*------------------------------------------------------------------------------------------------*)
(* System Variables *)
(*------------------------------------------------------------------------------------------------*)
DEFINE_SYSTEM_VARIABLE
INTEGER   PUSH_DEVICE     = $F001;
INTEGER   PUSH_CHANNEL    = $F002;
DEVCHAN   PUSH_DEVCHAN    = $F003;
INTEGER   RELEASE_DEVICE  = $F004;
INTEGER   RELEASE_CHANNEL = $F005;
DEVCHAN   RELEASE_DEVCHAN = $F006;
INTEGER   MASTER_SLOT     = $F007;
INTEGER   GET_PULSE_TIME  = $F008;
LONG      GET_TIMER       = $F009;
CHAR      DAY[10]         = $F00A;
CHAR      DATE[8]         = $F00B;
CHAR      TIME[8]         = $F00C;
CHAR      MASTER_SN[16]   = $F00D;
INTEGER   SYSTEM_NUMBER   = $F00E;
CHAR      LDATE[1]        = $F00F;
TBUTTON   BUTTON          = $F010;
DEVCHAN   DV_CHANNEL      = $F011;
TDATA     DATA            = $F012;
TLEVEL    LEVEL           = $F013;
TTIMELINE TIMELINE        = $F014;
TCHANNEL  CHANNEL         = $F015;
TCUSTOM   CUSTOM          = $F016;
(*------------------------------------------------------------------------------------------------*)
(* End of System Variables *)
(*------------------------------------------------------------------------------------------------*)

(*------------------------------------------------------------------------------------------------*)
(* Library Calls *)
(*------------------------------------------------------------------------------------------------*)
DEFINE_LIBRARY_FUNCTION CHAR      ATOI(CONSTANT CHAR A[])                                               = $F001;
DEFINE_LIBRARY_FUNCTION SINTEGER  ATOL(CONSTANT CHAR A[])                                               = $F002;
DEFINE_LIBRARY_FUNCTION FLOAT     ATOF(CONSTANT CHAR A[])                                               = $F003;
DEFINE_LIBRARY_FUNCTION SINTEGER  DATE_TO_DAY(CONSTANT CHAR A[])                                        = $F004;
DEFINE_LIBRARY_FUNCTION SINTEGER  DATE_TO_MONTH(CONSTANT CHAR A[])                                      = $F005;
DEFINE_LIBRARY_FUNCTION SINTEGER  DATE_TO_YEAR(CONSTANT CHAR A[])                                       = $F006;
DEFINE_LIBRARY_FUNCTION SINTEGER  DAY_OF_WEEK(CONSTANT CHAR A[])                                        = $F007;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_CLOSE(CONSTANT VARIANT A)                                        = $F008;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_COPY(CONSTANT CHAR A[],CONSTANT CHAR B[])                        = $F009;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_CREATEDIR(CONSTANT CHAR A[])                                     = $F00A;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_DELETE(CONSTANT CHAR A[])                                        = $F00B;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_DIR(CONSTANT CHAR A[],CHAR B[],CONSTANT VARIANT C)               = $F00C;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_GETDIR(CHAR A[])                                                 = $F00D;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_OPEN(CONSTANT CHAR A[],CONSTANT LONG B)                          = $F00E;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_READ(CONSTANT VARIANT A,CHAR B[],CONSTANT LONG C)                = $F00F;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_READ_LINE(CONSTANT VARIANT A,CHAR B[],CONSTANT LONG C)           = $F010;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_REMOVEDIR(CONSTANT CHAR A[])                                     = $F011;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_RENAME(CONSTANT CHAR A[],CONSTANT CHAR B[])                      = $F012;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_SEEK(CONSTANT VARIANT A,CONSTANT LONG B)                         = $F013;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_SETDIR(CONSTANT CHAR A[])                                        = $F014;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_WRITE(CONSTANT VARIANT A,CONSTANT CHAR B[],CONSTANT LONG C)      = $F015;
DEFINE_LIBRARY_FUNCTION SINTEGER  FILE_WRITE_LINE(CONSTANT VARIANT A,CONSTANT CHAR B[],CONSTANT LONG C) = $F016;
DEFINE_LIBRARY_FUNCTION CHAR      FIND_STRING(CONSTANT CHAR A[],CONSTANT CHAR B[],CONSTANT LONG C)      = $F017;
DEFINE_LIBRARY_FUNCTION CHAR[1]   FTOA(CONSTANT DOUBLE A)                                               = $F018;
DEFINE_LIBRARY_FUNCTION CHAR      HEXTOI(CONSTANT CHAR A[])                                             = $F019;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_CLIENT_CLOSE(CONSTANT LONG A)                                      = $F01A;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_CLIENT_OPEN(CONSTANT LONG A,CONSTANT CHAR B[],
                                                 CONSTANT LONG C,CONSTANT LONG D)                       = $F01B;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_SERVER_CLOSE(CONSTANT LONG A)                                      = $F01C;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_SERVER_OPEN(CONSTANT LONG A,CONSTANT  LONG B,CONSTANT  LONG C)     = $F01D;
DEFINE_LIBRARY_FUNCTION CHAR[1]   ITOA(CONSTANT VARIANT A)                                              = $F01E;
DEFINE_LIBRARY_FUNCTION CHAR[1]   ITOHEX(CONSTANT VARIANT A)                                            = $F01F;
DEFINE_LIBRARY_FUNCTION CHAR[1]   LEFT_STRING(CONSTANT CHAR A[],CONSTANT LONG B)                        = $F020;
DEFINE_LIBRARY_FUNCTION CHAR      LENGTH_ARRAY(CONSTANT VARIANTARRAY A)                                 = $F021;
DEFINE_LIBRARY_FUNCTION CHAR      LENGTH_STRING(CONSTANT VARIANTARRAY A)                                = $F022;
DEFINE_LIBRARY_FUNCTION           LOAD_DUET_MODULE(CONSTANT CHAR A[][])                                 = $F023;
DEFINE_LIBRARY_FUNCTION CHAR[1]   LOWER_STRING(CONSTANT CHAR A[])                                       = $F024;
DEFINE_LIBRARY_FUNCTION CHAR      MAX_LENGTH_ARRAY(CONSTANT VARIANTARRAY A)                             = $F025;
DEFINE_LIBRARY_FUNCTION CHAR      MAX_LENGTH_STRING(CONSTANT VARIANTARRAY A)                            = $F026;
DEFINE_LIBRARY_FUNCTION CHAR[1]   MID_STRING(CONSTANT CHAR A[],CONSTANT LONG B,CONSTANT LONG C)         = $F027;
DEFINE_LIBRARY_FUNCTION CHAR      RANDOM_NUMBER(CONSTANT LONG A)                                        = $F028;
DEFINE_LIBRARY_FUNCTION CHAR[1]   REMOVE_STRING(CHAR A[],CONSTANT CHAR B[],CONSTANT LONG C)             = $F029;
DEFINE_LIBRARY_FUNCTION CHAR[1]   RIGHT_STRING(CONSTANT CHAR A[],CONSTANT LONG B)                       = $F02A;
DEFINE_LIBRARY_FUNCTION CHAR      SET_LENGTH_ARRAY(VARIANTARRAY A,CONSTANT LONG B)                      = $F02B;
DEFINE_LIBRARY_FUNCTION CHAR      SET_LENGTH_STRING(VARIANTARRAY A,CONSTANT LONG B)                     = $F02C;
DEFINE_LIBRARY_FUNCTION SINTEGER  TIME_TO_HOUR(CONSTANT CHAR A[])                                       = $F02D;
DEFINE_LIBRARY_FUNCTION SINTEGER  TIME_TO_MINUTE(CONSTANT CHAR A[])                                     = $F02E;
DEFINE_LIBRARY_FUNCTION SINTEGER  TIME_TO_SECOND(CONSTANT CHAR A[])                                     = $F02F;
(* Added v1.44, Unload Duet Module *)
DEFINE_LIBRARY_FUNCTION           UNLOAD_DUET_MODULE(CONSTANT CHAR A[][])                               = $F030;
DEFINE_LIBRARY_FUNCTION CHAR[1]   UPPER_STRING(CONSTANT CHAR A[])                                       = $F031;
DEFINE_LIBRARY_FUNCTION CHAR      GET_LAST(CONSTANT VARIANTARRAY A)                                     = $F032;
DEFINE_LIBRARY_FUNCTION SINTEGER  COMPARE_STRING(CONSTANT CHAR A[],CONSTANT CHAR B[])                   = $F033;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_MC_SERVER_OPEN(CONSTANT LONG A,CONSTANT CHAR B[],CONSTANT LONG C)  = $F034;
DEFINE_LIBRARY_FUNCTION CHAR[1]   FORMAT(CONSTANT CHAR A[],CONSTANT VARIANT B)                          = $F035;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_CREATE(CONSTANT LONG A,CONSTANT VARIANT B[],CONSTANT LONG C,
                                                  CONSTANT LONG D,CONSTANT LONG E)                      = $F036;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_KILL(CONSTANT LONG A)                                        = $F037;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_RELOAD(CONSTANT LONG A,CONSTANT VARIANT B[],CONSTANT LONG C) = $F038;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_PAUSE(CONSTANT LONG A)                                       = $F039;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_RESTART(CONSTANT LONG A)                                     = $F03A;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_SET(CONSTANT LONG A,CONSTANT LONG B)                         = $F03B;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_GET(CONSTANT LONG A)                                         = $F03C;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_ACTIVE(CONSTANT LONG A)                                      = $F03D;
DEFINE_LIBRARY_FUNCTION CHAR      TIMELINE_DYNAMIC_ID()                                                 = $F03E;
//MISSING 3F
DEFINE_LIBRARY_FUNCTION CHAR      GET_BUFFER_CHAR(CHAR A[])                                             = $F040;
DEFINE_LIBRARY_FUNCTION CHAR      GET_MULTI_BUFFER_STRING(CHAR A[],CHAR B[])                            = $F041;
DEFINE_LIBRARY_FUNCTION CHAR[1]   GET_BUFFER_STRING(CHAR A[],CONSTANT LONG B)                           = $F042;
DEFINE_LIBRARY_FUNCTION CHAR      DEVICE_ID(CONSTANT DEV A)                                             = $F043;
DEFINE_LIBRARY_FUNCTION CHAR[1]   DEVICE_ID_STRING(CONSTANT DEV A)                                      = $F044;
DEFINE_LIBRARY_FUNCTION           DEVICE_INFO(CONSTANT DEV A,DEV_INFO_STRUCT B)                         = $F045;
DEFINE_LIBRARY_FUNCTION           DO_PUSH(CONSTANT DEV A,CONSTANT LONG B)                               = $F046;
DEFINE_LIBRARY_FUNCTION           DO_RELEASE(CONSTANT DEV A,CONSTANT LONG B)                            = $F047;
DEFINE_LIBRARY_FUNCTION           REDIRECT_STRING(CONSTANT LONG A,CONSTANT DEV B,CONSTANT DEV C)        = $F048;
DEFINE_LIBRARY_FUNCTION           SET_PULSE_TIME(CONSTANT LONG A)                                       = $F049;
DEFINE_LIBRARY_FUNCTION           SET_TIMER(CONSTANT LONG A)                                            = $F04A;
DEFINE_LIBRARY_FUNCTION SINTEGER  VARIABLE_TO_STRING(CONSTANT VARIANTARRAY A,CHAR B[], LONG C)          = $F04B;
DEFINE_LIBRARY_FUNCTION SINTEGER  STRING_TO_VARIABLE(VARIANTARRAY A,CONSTANT CHAR B[], LONG C)          = $F04C;
DEFINE_LIBRARY_FUNCTION CHAR      LENGTH_VARIABLE_TO_STRING(CONSTANT VARIANTARRAY A)                    = $F04D;
DEFINE_LIBRARY_FUNCTION           DYNAMIC_APPLICATION_DEVICE(CONSTANT DEV A, CHAR B[], CHAR C[])        = $F04E;
DEFINE_LIBRARY_FUNCTION           DYNAMIC_POLLED_PORT(CONSTANT DEV A)                                   = $F04F;
DEFINE_LIBRARY_FUNCTION CHAR[1]   GET_UNIQUE_ID()                                                       = $F050;
DEFINE_LIBRARY_FUNCTION SINTEGER  GET_SERIAL_NUMBER(CONSTANT DEV A,CHAR B[])                            = $F051;
DEFINE_LIBRARY_FUNCTION CHAR      GET_SYSTEM_NUMBER()                                                   = $F052;
DEFINE_LIBRARY_FUNCTION SINTEGER  SET_SYSTEM_NUMBER(CONSTANT LONG A)                                    = $F053;
//MISSING 54
//MISSING 55
DEFINE_LIBRARY_FUNCTION SINTEGER  GET_DNS_LIST(CONSTANT DEV A,DNS_STRUCT B)                             = $F056;
DEFINE_LIBRARY_FUNCTION SINTEGER  SET_DNS_LIST(CONSTANT DEV A,CONSTANT DNS_STRUCT B)                    = $F057;
DEFINE_LIBRARY_FUNCTION SINTEGER  GET_IP_ADDRESS(CONSTANT DEV A,IP_ADDRESS_STRUCT B)                    = $F058;
DEFINE_LIBRARY_FUNCTION SINTEGER  SET_IP_ADDRESS(CONSTANT DEV A,CONSTANT IP_ADDRESS_STRUCT B)           = $F059;
DEFINE_LIBRARY_FUNCTION SINTEGER  SET_VALIDATION_CODE(CONSTANT LONG A)                                  = $F05A;
DEFINE_LIBRARY_FUNCTION SINTEGER  GET_URL_LIST(CONSTANT DEV A,URL_STRUCT B[],CONSTANT LONG C)           = $F05B;
DEFINE_LIBRARY_FUNCTION SINTEGER  ADD_URL_ENTRY(CONSTANT DEV A,CONSTANT URL_STRUCT C)                   = $F05C;
DEFINE_LIBRARY_FUNCTION SINTEGER  DELETE_URL_ENTRY(CONSTANT DEV A,CONSTANT URL_STRUCT C)                = $F05D;
//MISSING 5E
DEFINE_LIBRARY_FUNCTION SINTEGER  REBOOT(CONSTANT DEV A)                                                = $F05F;
DEFINE_LIBRARY_FUNCTION           DO_PUSH_TIMED(CONSTANT DEV A,CONSTANT LONG B,CONSTANT LONG C)         = $F060;
// How do you spell temperature???
DEFINE_LIBRARY_FUNCTION           SET_OUTDOOR_TEMPATURE(CONSTANT LONG A)                                = $F061;
DEFINE_LIBRARY_FUNCTION           SET_OUTDOOR_TEMPERATURE(CONSTANT LONG A)                              = $F061;
DEFINE_LIBRARY_FUNCTION           SET_VIRTUAL_LEVEL_COUNT(CONSTANT DEV A,CONSTANT LONG B)               = $F062;
DEFINE_LIBRARY_FUNCTION           SET_VIRTUAL_CHANNEL_COUNT(CONSTANT DEV A,CONSTANT LONG B)             = $F063;
DEFINE_LIBRARY_FUNCTION           SET_VIRTUAL_PORT_COUNT(CONSTANT DEV A,CONSTANT LONG B)                = $F064;
DEFINE_LIBRARY_FUNCTION CHAR      TYPE_CAST(CONSTANT VARIANT A)                                         = $F065;
DEFINE_LIBRARY_FUNCTION CHAR      RAW_BE(CONSTANT VARIANT A)                                            = $F066;
DEFINE_LIBRARY_FUNCTION CHAR      RAW_LE(CONSTANT VARIANT A)                                            = $F067;
DEFINE_LIBRARY_FUNCTION SINTEGER  ASTRO_CLOCK(CONSTANT DOUBLE A,CONSTANT DOUBLE B,CONSTANT DOUBLE C,
                                              CONSTANT CHAR D[],CHAR E[],CHAR F[])                      = $F068;
DEFINE_LIBRARY_FUNCTION CHAR      ABS_VALUE(CONSTANT VARIANT A)                                         = $F069;
DEFINE_LIBRARY_FUNCTION CHAR      MAX_VALUE(CONSTANT VARIANT A,CONSTANT VARIANT B)                      = $F06A;
DEFINE_LIBRARY_FUNCTION CHAR      MIN_VALUE(CONSTANT VARIANT A,CONSTANT VARIANT B)                      = $F06B;

DEFINE_LIBRARY_FUNCTION SINTEGER  VARIABLE_TO_XML(CONSTANT VARIANTARRAY A,CHAR B[], LONG C, LONG D)     = $F06C;
DEFINE_LIBRARY_FUNCTION SINTEGER  XML_TO_VARIABLE(VARIANTARRAY A,CONSTANT CHAR B[], LONG C, LONG D)     = $F06D;
DEFINE_LIBRARY_FUNCTION CHAR      LENGTH_VARIABLE_TO_XML(CONSTANT VARIANTARRAY A, LONG B)               = $F06E;
DEFINE_LIBRARY_FUNCTION           STATIC_PORT_BINDING(CONSTANT DEV A, CONSTANT DEV B,
                                                      CONSTANT CHAR C[], CONSTANT CHAR D[],
                                                      CONSTANT LONG E)                                  = $F06F;
DEFINE_LIBRARY_FUNCTION           STATIC_IP_BINDING(CONSTANT DEV A, CONSTANT CHAR B[],
                                                      CONSTANT CHAR C[], CONSTANT CHAR D[])             = $F08B;
DEFINE_LIBRARY_FUNCTION CHAR      INTERNAL_QUEUE_SIZE_SET(CONSTANT LONG A,CONSTANT LONG B)              = $F070;
DEFINE_LIBRARY_FUNCTION CHAR      INTERNAL_QUEUE_SIZE_GET(CONSTANT LONG A)                              = $F071;
DEFINE_LIBRARY_FUNCTION CHAR      INTERNAL_THRESHOLD_SET(CONSTANT LONG A,CONSTANT LONG B)               = $F072;
DEFINE_LIBRARY_FUNCTION CHAR      INTERNAL_THRESHOLD_GET(CONSTANT LONG A)                               = $F073;

DEFINE_LIBRARY_FUNCTION           REBUILD_EVENT()                                                       = $F074;
DEFINE_LIBRARY_FUNCTION           DO_CUSTOM_EVENT(CONSTANT DEV A,CONSTANT TCUSTOM B)                    = $F075;

(* Added v1.24 *)
DEFINE_LIBRARY_FUNCTION SINTEGER  DUET_MEM_SIZE_SET(CONSTANT LONG A)                        = $F076;
DEFINE_LIBRARY_FUNCTION CHAR      DUET_MEM_SIZE_GET()                                       = $F077;

(* Added v1.28, Clock Manager *)
DEFINE_LIBRARY_FUNCTION CHAR      CLKMGR_IS_NETWORK_SOURCED()                                           = $F078;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_CLK_SOURCE(CONSTANT INTEGER MODE)                          = $F079;
DEFINE_LIBRARY_FUNCTION CHAR      CLKMGR_IS_DAYLIGHTSAVINGS_ON()                                        = $F07A;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_DAYLIGHTSAVINGS_MODE(CONSTANT INTEGER ONOFF)               = $F07B;
DEFINE_LIBRARY_FUNCTION CHAR[1]   CLKMGR_GET_TIMEZONE()                                                 = $F07C;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_TIMEZONE(CONSTANT CHAR TIMEZONE[])                         = $F07D;
DEFINE_LIBRARY_FUNCTION INTEGER   CLKMGR_GET_RESYNC_PERIOD()                                            = $F07E;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_RESYNC_PERIOD(CONSTANT INTEGER PERIOD)                     = $F07F;
DEFINE_LIBRARY_FUNCTION SLONG     CLKMGR_GET_DAYLIGHTSAVINGS_OFFSET(CLKMGR_TIMEOFFSET_STRUCT T)         = $F080;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_DAYLIGHTSAVINGS_OFFSET(CONSTANT CLKMGR_TIMEOFFSET_STRUCT T)= $F081;
DEFINE_LIBRARY_FUNCTION SLONG     CLKMGR_GET_ACTIVE_TIMESERVER(CLKMGR_TIMESERVER_STRUCT T)              = $F082;
DEFINE_LIBRARY_FUNCTION           CLKMGR_SET_ACTIVE_TIMESERVER(CONSTANT CHAR IP[])                      = $F083;
DEFINE_LIBRARY_FUNCTION SLONG     CLKMGR_GET_TIMESERVERS(CLKMGR_TIMESERVER_STRUCT T[])                  = $F084;

DEFINE_LIBRARY_FUNCTION           CLKMGR_ADD_USERDEFINED_TIMESERVER(CONSTANT CHAR IP[],
                                                                    CONSTANT CHAR URL[],
                                                                    CONSTANT CHAR LOCATION[])           = $F085;
DEFINE_LIBRARY_FUNCTION           CLKMGR_DELETE_USERDEFINED_TIMESERVER(CONSTANT CHAR IP[])              = $F086;

DEFINE_LIBRARY_FUNCTION CHAR[1]   CLKMGR_GET_START_DAYLIGHTSAVINGS_RULE()                               = $F087;
DEFINE_LIBRARY_FUNCTION SLONG     CLKMGR_SET_START_DAYLIGHTSAVINGS_RULE(CONSTANT CHAR RECORD[])         = $F088;
DEFINE_LIBRARY_FUNCTION CHAR[1]   CLKMGR_GET_END_DAYLIGHTSAVINGS_RULE()                                 = $F089;
DEFINE_LIBRARY_FUNCTION SLONG     CLKMGR_SET_END_DAYLIGHTSAVINGS_RULE(CONSTANT CHAR RECORD[])           = $F08A;

(* Added v1.41, STANDBY devices *)
DEFINE_LIBRARY_FUNCTION           DEVICE_STANDBY(CONSTANT DEV A, CONSTANT LONG B)                       = $F08C;
DEFINE_LIBRARY_FUNCTION           DEVICE_WAKE(CONSTANT DEV A, CONSTANT LONG B)                          = $F08D;

(* Added v1.43, IP Option *)
DEFINE_LIBRARY_FUNCTION       IP_SET_OPTION(CONSTANT LONG A, CONSTANT LONG B, CONSTANT LONG C)      = $F08E;
DEFINE_LIBRARY_FUNCTION SINTEGER  IP_BOUND_CLIENT_OPEN(CONSTANT LONG A,CONSTANT LONG B, CONSTANT CHAR C[],
                                                 CONSTANT LONG D,CONSTANT LONG E)                       = $F08F;
(* Added v1.53, AMX_LOG, math functions and SMTP*)
DEFINE_LIBRARY_FUNCTION       SET_LOG_LEVEL(CONSTANT LONG A)                    = $F0B0;
DEFINE_LIBRARY_FUNCTION CHAR      GET_LOG_LEVEL()                           = $F0B1;
DEFINE_LIBRARY_FUNCTION       AMX_LOG(CONSTANT LONG A, CONSTANT CHAR B[])               = $F0B2;
DEFINE_LIBRARY_FUNCTION       SMTP_SERVER_CONFIG_SET(CONSTANT CHAR A[], CONSTANT CHAR B[])      = $F0B3;
DEFINE_LIBRARY_FUNCTION CHAR[1]   SMTP_SERVER_CONFIG_GET(CONSTANT CHAR A[])             = $F0B4;
DEFINE_LIBRARY_FUNCTION SINTEGER  SMTP_SEND(DEV A, CONSTANT CHAR B[], CONSTANT CHAR C[],
                        CONSTANT CHAR D[], CONSTANT CHAR E[])           = $F0B5;
DEFINE_LIBRARY_FUNCTION CHAR    EXP_VALUE(CONSTANT VARIANT A)                                         = $F0B6;
DEFINE_LIBRARY_FUNCTION CHAR    LOG_VALUE(CONSTANT VARIANT A)                                         = $F0B7;
DEFINE_LIBRARY_FUNCTION CHAR    LOG10_VALUE(CONSTANT VARIANT A)                                       = $F0B8;
DEFINE_LIBRARY_FUNCTION CHAR    POWER_VALUE(CONSTANT VARIANT A, CONSTANT VARIANT B)                   = $F0B9;
DEFINE_LIBRARY_FUNCTION CHAR    SQRT_VALUE(CONSTANT VARIANT A)                                        = $F0BA;

(* Added v1.56 *)
DEFINE_LIBRARY_FUNCTION CHAR    VALIDATE_NETLINX_ACCOUNT(CONSTANT CHAR A[], CONSTANT CHAR B[], LAST_LOGIN_INFO C) = $F0BB;
DEFINE_LIBRARY_FUNCTION CHAR    AUDIT_NETLINX_SESSION_EVENT(CONSTANT DEV A, CONSTANT CHAR B[], CONSTANT LONG C) = $F0BC;
DEFINE_LIBRARY_FUNCTION CHAR    AUDIT_NETLINX_GENERIC_EVENT(CONSTANT DEV A, CONSTANT CHAR B[], CONSTANT CHAR C[]) = $F0BD;
DEFINE_LIBRARY_FUNCTION LONG    GET_AVAILABLE_FLASH_DISK_SPACE()                                     = $F0BE;
DEFINE_LIBRARY_FUNCTION LONG    GET_MAX_FLASH_DISK_SPACE()                                           = $F0BF;

(* Added v1.55, Added to support dynamic data feeds *)
DEFINE_LIBRARY_FUNCTION SINTEGER DATA_CREATE_FEED(CONSTANT DATA_FEED A)                               = $F0C0;
DEFINE_LIBRARY_FUNCTION SINTEGER DATA_DELETE_FEED(CONSTANT CHAR A[])                                  = $F0C1;
DEFINE_LIBRARY_FUNCTION CHAR[1]  DATA_PUBLISH_FEED(CONSTANT CHAR A[])                                 = $F0C2;
DEFINE_LIBRARY_FUNCTION CHAR[1]  DATA_GET_PUBLISHED_FEED(CONSTANT CHAR A[])                           = $F0C3;
DEFINE_LIBRARY_FUNCTION SINTEGER DATA_ADD_RECORD(CONSTANT CHAR A[], CONSTANT CHAR B[], CONSTANT DATA_RECORD C) = $F0C4;
DEFINE_LIBRARY_FUNCTION SINTEGER DATA_GET_EVENT_RECORD(CONSTANT DEV A, CONSTANT LONG B, CONSTANT CHAR C[][], DATA_RECORD D) = $F0C5;

DEFINE_LIBRARY_FUNCTION SINTEGER _WC_DATA_CREATE_FEED(CONSTANT WC_DATA_FEED A)                             = $F0C6;
DEFINE_LIBRARY_FUNCTION SINTEGER _WC_DATA_ADD_RECORD(CONSTANT CHAR A[], CONSTANT WIDECHAR B[], CONSTANT WC_DATA_RECORD C) = $F0C7;
DEFINE_LIBRARY_FUNCTION SINTEGER _WC_DATA_GET_EVENT_RECORD(CONSTANT DEV A, CONSTANT LONG B, CONSTANT WIDECHAR C[][], WC_DATA_RECORD D) = $F0C8;

DEFINE_LIBRARY_FUNCTION SINTEGER VALIDATE_NETLINX_ACCOUNT_WITH_PERMISSION(CONSTANT CHAR A[], CONSTANT CHAR B[], CONSTANT CHAR C, CONSTANT CHAR D[], CONSTANT LAST_LOGIN_INFO E) = $F0CB
DEFINE_LIBRARY_FUNCTION SINTEGER AUTHENTICATE_CERTIFICATE(CONSTANT DEV A, CONSTANT LONG B, CONSTANT LONG C, CONSTANT LONG D, CONSTANT CHAR E[], CONSTANT CHAR F[], CONSTANT CHAR G[]) = $F0CD;

(* Added v1.57 *)
DEFINE_LIBRARY_FUNCTION SINTEGER  SSH_CLIENT_CLOSE(CONSTANT LONG A)                                       = $F0CA;
DEFINE_LIBRARY_FUNCTION SINTEGER  SSH_CLIENT_OPEN(CONSTANT LONG A, CONSTANT CHAR B[], CONSTANT LONG C,
                                                  CONSTANT CHAR D[], CONSTANT CHAR E[],
                                                  CONSTANT CHAR F[], CONSTANT CHAR G[])                   = $F0C9;

DEFINE_LIBRARY_FUNCTION SINTEGER  TLS_CLIENT_CLOSE(CONSTANT LONG A)                                      = $F0CF; // Added v1.61
DEFINE_LIBRARY_FUNCTION SINTEGER  TLS_CLIENT_OPEN(CONSTANT LONG A, CONSTANT CHAR B[], CONSTANT LONG C, INTEGER D)    = $F0CE; // Added v1.61

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// These are the internal versions of the WIDECHAR functions.  They may be implemented in later
// versions of firmware but the functions are defined as "placeholders".  Until then, the NetLinx
// implementations of each function will be used.  Once they are supported in FW, the functions
// below will call through to these functions.
//
// As these functions get implmented in FW, update the appropriate call below and specify the
// NetLinx master FW version number that supports the function.
//
// They are being commented out for now to avoid anybody from compiling a NetLinx program that uses them but
// would never work because they ARE NOT implemented at all in Firmware.
//
DEFINE_LIBRARY_FUNCTION CHAR[1]     _WC_ENCODE_INT(CONSTANT WIDECHAR A[], CONSTANT INTEGER B, LONG C)   = $F090
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_DECODE_INT(CONSTANT CHAR A[], CONSTANT INTEGER B, LONG C)       = $F091
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_INT(CONSTANT CHAR A[])                                          = $F092
DEFINE_LIBRARY_FUNCTION CHAR[1]     _WC_TO_CH_INT(CONSTANT WIDECHAR A[])                                = $F093
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _CH_TO_WC_INT(CONSTANT CHAR A[])                                    = $F094
DEFINE_LIBRARY_FUNCTION CHAR        _WC_FIND_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT WIDECHAR B[],
                                                        CONSTANT LONG C)                                = $F095
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_LEFT_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT LONG B)         = $F096
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_LOWER_STRING_INT(CONSTANT WIDECHAR A[])                         = $F097
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_MID_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT LONG B,
                                                       CONSTANT LONG C)                                 = $F098
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_REMOVE_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT WIDECHAR B[],
                                                          CONSTANT LONG C)                              = $F099
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_RIGHT_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT LONG B)        = $F09A
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_UPPER_STRING_INT(CONSTANT WIDECHAR A[])                         = $F09B
DEFINE_LIBRARY_FUNCTION SINTEGER    _WC_COMPARE_STRING_INT(CONSTANT WIDECHAR A[], CONSTANT WIDECHAR B[])= $F09C
DEFINE_LIBRARY_FUNCTION WIDECHAR    _WC_GET_BUFFER_CHAR_INT(WIDECHAR A[])                               = $F09D
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_GET_BUFFER_STRING_INT(WIDECHAR A[],CONSTANT LONG B)             = $F09E
DEFINE_LIBRARY_FUNCTION WIDECHAR[1] _WC_CONCAT_STRING_INT(CONSTANT WIDECHAR A[],CONSTANT WIDECHAR B[])  = $F09F
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_OPEN_INT(CONSTANT CHAR A[],CONSTANT LONG B,
                                                      CONSTANT INTEGER C)                               = $F0A0
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_CLOSE_INT(CONSTANT SLONG A)                                = $F0A1
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_READ_INT(CONSTANT SLONG A,CONSTANT WIDECHAR B[],
                                                      CONSTANT LONG C)                                  = $F0A2
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_READ_LINE_INT(CONSTANT SLONG A,CONSTANT WIDECHAR B[],
                                                           CONSTANT LONG C)                             = $F0A3
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_WRITE_INT(CONSTANT SLONG A, CONSTANT WIDECHAR B[],
                                                       CONSTANT LONG C)                                 = $F0A4
DEFINE_LIBRARY_FUNCTION SLONG       _WC_FILE_WRITE_LINE_INT(CONSTANT SLONG A, CONSTANT WIDECHAR B[],
                                                            CONSTANT LONG C)                            = $F0A5
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(*------------------------------------------------------------------------------------------------*)
(* End of Library Calls *)
(*------------------------------------------------------------------------------------------------*)

(*------------------------------------------------------------------------------------------------*)
(* WC NetLinx-implemented routines, Added 1.22 *)
(*------------------------------------------------------------------------------------------------*)
(********************************************)
(* Call Name: GET_MASTER_BUILD              *)
(* Function:  Return build # of the master  *)
(********************************************)
DEFINE_FUNCTION INTEGER GET_MASTER_BUILD()
{
  // Declare
  STACK_VAR DEV_INFO_STRUCT sDevInfo
  STACK_VAR CHAR    cVer[50]
  STACK_VAR CHAR    cTemp[50]
  STACK_VAR INTEGER nMajor
  STACK_VAR INTEGER nMinor
  STACK_VAR INTEGER nBuild

  // Check master version
  DEVICE_INFO(0:0:0,sDevInfo)
  cVer = sDevInfo.VERSION
  cTemp = REMOVE_STRING(cVer,'.',1)
  nMajor = ATOI(cTemp)
  cTemp = REMOVE_STRING(cVer,'.',1)
  nMinor = ATOI(cTemp)
  nBuild = ATOI(cVer)

  RETURN nBuild;
}

(*------------------------------------------------------------------------------------------------*)
(* End of File *)
(*------------------------------------------------------------------------------------------------*)
