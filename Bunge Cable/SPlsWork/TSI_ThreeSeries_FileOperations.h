namespace TSI.ThreeSeries.FileOperations;
        // class declarations
         class FileOperations;
         class Debug;
         class FileContentsReadSuccessfullyEventArgs;
         class DeserializationSuccessEventArgs;
         class FileWriteSuccessEventArgs;
     class FileOperations 
    {
        // class delegates

        // class events
        EventHandler FileContentsReadSuccessfullyEvent ( FileOperations sender, FileContentsReadSuccessfullyEventArgs e );
        EventHandler DeserializationSuccessEvent ( FileOperations sender, DeserializationSuccessEventArgs e );
        EventHandler FileWriteSuccessEvent ( FileOperations sender, FileWriteSuccessEventArgs e );

        // class functions
        FUNCTION SetDebugEnable ( INTEGER enable );
        FUNCTION ReadFile ();
        FUNCTION WriteFile ();
        FUNCTION UpdateListFromSimpl ( INTEGER Index , STRING Item );
        SIGNED_LONG_INTEGER_FUNCTION GetHashCode ();
        STRING_FUNCTION ToString ();

        // class variables
        INTEGER __class_id__;

        // class properties
        STRING FilePath[];
    };

     class Debug 
    {
        // class delegates

        // class events

        // class functions
        SIGNED_LONG_INTEGER_FUNCTION GetHashCode ();
        STRING_FUNCTION ToString ();

        // class variables
        INTEGER __class_id__;

        // class properties
        INTEGER UshortDebugEnable;
    };

     class FileContentsReadSuccessfullyEventArgs 
    {
        // class delegates

        // class events

        // class functions
        SIGNED_LONG_INTEGER_FUNCTION GetHashCode ();
        STRING_FUNCTION ToString ();

        // class variables
        INTEGER __class_id__;

        // class properties
        STRING FileContentsArg[];
    };

     class DeserializationSuccessEventArgs 
    {
        // class delegates

        // class events

        // class functions
        SIGNED_LONG_INTEGER_FUNCTION GetHashCode ();
        STRING_FUNCTION ToString ();

        // class variables
        INTEGER __class_id__;

        // class properties
        STRING LastUpdate[];
        STRING StringArray[][];
        INTEGER ListCount;
    };

     class FileWriteSuccessEventArgs 
    {
        // class delegates

        // class events

        // class functions
        SIGNED_LONG_INTEGER_FUNCTION GetHashCode ();
        STRING_FUNCTION ToString ();

        // class variables
        INTEGER __class_id__;

        // class properties
        STRING LastUpdate[];
    };

