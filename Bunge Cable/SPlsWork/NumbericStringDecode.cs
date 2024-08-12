using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Linq;
using Crestron;
using Crestron.Logos.SplusLibrary;
using Crestron.Logos.SplusObjects;
using Crestron.SimplSharp;

namespace UserModule_NUMBERICSTRINGDECODE
{
    public class UserModuleClass_NUMBERICSTRINGDECODE : SplusObject
    {
        static CCriticalSection g_criticalSection = new CCriticalSection();
        
        CrestronString TEMPSTRING;
        Crestron.Logos.SplusObjects.StringInput STRINGIN__DOLLAR__;
        Crestron.Logos.SplusObjects.DigitalOutput NUM0;
        Crestron.Logos.SplusObjects.DigitalOutput NUM1;
        Crestron.Logos.SplusObjects.DigitalOutput NUM2;
        Crestron.Logos.SplusObjects.DigitalOutput NUM3;
        Crestron.Logos.SplusObjects.DigitalOutput NUM4;
        Crestron.Logos.SplusObjects.DigitalOutput NUM5;
        Crestron.Logos.SplusObjects.DigitalOutput NUM6;
        Crestron.Logos.SplusObjects.DigitalOutput NUM7;
        Crestron.Logos.SplusObjects.DigitalOutput NUM8;
        Crestron.Logos.SplusObjects.DigitalOutput NUM9;
        Crestron.Logos.SplusObjects.DigitalOutput ENTER;
        object STRINGIN__DOLLAR___OnChange_0 ( Object __EventInfo__ )
        
            { 
            Crestron.Logos.SplusObjects.SignalEventArgs __SignalEventArg__ = (Crestron.Logos.SplusObjects.SignalEventArgs)__EventInfo__;
            try
            {
                SplusExecutionContext __context__ = SplusThreadStartCode(__SignalEventArg__);
                ushort LENGTH = 0;
                ushort P1 = 0;
                ushort P2 = 0;
                ushort P3 = 0;
                ushort P4 = 0;
                ushort P5 = 0;
                
                CrestronString TEMP1;
                CrestronString TEMP2;
                CrestronString TEMP3;
                CrestronString TEMP4;
                TEMP1  = new CrestronString( Crestron.Logos.SplusObjects.CrestronStringEncoding.eEncodingASCII, 1, this );
                TEMP2  = new CrestronString( Crestron.Logos.SplusObjects.CrestronStringEncoding.eEncodingASCII, 1, this );
                TEMP3  = new CrestronString( Crestron.Logos.SplusObjects.CrestronStringEncoding.eEncodingASCII, 1, this );
                TEMP4  = new CrestronString( Crestron.Logos.SplusObjects.CrestronStringEncoding.eEncodingASCII, 1, this );
                
                
                __context__.SourceCodeLine = 16;
                TEMPSTRING  .UpdateValue ( STRINGIN__DOLLAR__  ) ; 
                __context__.SourceCodeLine = 17;
                LENGTH = (ushort) ( Functions.Length( TEMPSTRING ) ) ; 
                __context__.SourceCodeLine = 18;
                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (LENGTH == 3))  ) ) 
                    { 
                    __context__.SourceCodeLine = 20;
                    TEMP1  .UpdateValue ( Functions.Left ( TEMPSTRING ,  (int) ( 1 ) )  ) ; 
                    __context__.SourceCodeLine = 21;
                    P1 = (ushort) ( Functions.Atoi( TEMP1 ) ) ; 
                    __context__.SourceCodeLine = 22;
                    TEMP2  .UpdateValue ( Functions.Mid ( TEMPSTRING ,  (int) ( 2 ) ,  (int) ( 1 ) )  ) ; 
                    __context__.SourceCodeLine = 23;
                    P2 = (ushort) ( Functions.Atoi( TEMP2 ) ) ; 
                    __context__.SourceCodeLine = 24;
                    TEMP3  .UpdateValue ( Functions.Right ( TEMPSTRING ,  (int) ( 1 ) )  ) ; 
                    __context__.SourceCodeLine = 25;
                    P3 = (ushort) ( Functions.Atoi( TEMP3 ) ) ; 
                    } 
                
                else 
                    {
                    __context__.SourceCodeLine = 29;
                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (LENGTH == 2))  ) ) 
                        { 
                        __context__.SourceCodeLine = 31;
                        TEMP1  .UpdateValue ( Functions.Left ( TEMPSTRING ,  (int) ( 1 ) )  ) ; 
                        __context__.SourceCodeLine = 32;
                        TEMP2  .UpdateValue ( Functions.Right ( TEMPSTRING ,  (int) ( 1 ) )  ) ; 
                        __context__.SourceCodeLine = 33;
                        P1 = (ushort) ( Functions.Atoi( TEMP1 ) ) ; 
                        __context__.SourceCodeLine = 34;
                        Functions.Delay (  (int) ( 50 ) ) ; 
                        __context__.SourceCodeLine = 35;
                        P2 = (ushort) ( Functions.Atoi( TEMP2 ) ) ; 
                        } 
                    
                    else 
                        {
                        __context__.SourceCodeLine = 38;
                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (LENGTH == 1))  ) ) 
                            { 
                            __context__.SourceCodeLine = 40;
                            TEMP1  .UpdateValue ( TEMPSTRING  ) ; 
                            __context__.SourceCodeLine = 41;
                            P1 = (ushort) ( Functions.Atoi( TEMP1 ) ) ; 
                            } 
                        
                        }
                    
                    }
                
                __context__.SourceCodeLine = 43;
                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 0))  ) ) 
                    { 
                    __context__.SourceCodeLine = 43;
                    NUM0  .Value = (ushort) ( 1 ) ; 
                    __context__.SourceCodeLine = 43;
                    NUM0  .Value = (ushort) ( 0 ) ; 
                    } 
                
                else 
                    {
                    __context__.SourceCodeLine = 44;
                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 1))  ) ) 
                        { 
                        __context__.SourceCodeLine = 44;
                        NUM1  .Value = (ushort) ( 1 ) ; 
                        __context__.SourceCodeLine = 44;
                        NUM1  .Value = (ushort) ( 0 ) ; 
                        } 
                    
                    else 
                        {
                        __context__.SourceCodeLine = 45;
                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 2))  ) ) 
                            { 
                            __context__.SourceCodeLine = 45;
                            NUM2  .Value = (ushort) ( 1 ) ; 
                            __context__.SourceCodeLine = 45;
                            NUM2  .Value = (ushort) ( 0 ) ; 
                            } 
                        
                        else 
                            {
                            __context__.SourceCodeLine = 46;
                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 3))  ) ) 
                                { 
                                __context__.SourceCodeLine = 46;
                                NUM3  .Value = (ushort) ( 1 ) ; 
                                __context__.SourceCodeLine = 46;
                                NUM3  .Value = (ushort) ( 0 ) ; 
                                } 
                            
                            else 
                                {
                                __context__.SourceCodeLine = 47;
                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 4))  ) ) 
                                    { 
                                    __context__.SourceCodeLine = 47;
                                    NUM4  .Value = (ushort) ( 1 ) ; 
                                    __context__.SourceCodeLine = 47;
                                    NUM4  .Value = (ushort) ( 0 ) ; 
                                    } 
                                
                                else 
                                    {
                                    __context__.SourceCodeLine = 48;
                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 5))  ) ) 
                                        { 
                                        __context__.SourceCodeLine = 48;
                                        NUM5  .Value = (ushort) ( 1 ) ; 
                                        __context__.SourceCodeLine = 48;
                                        NUM5  .Value = (ushort) ( 0 ) ; 
                                        } 
                                    
                                    else 
                                        {
                                        __context__.SourceCodeLine = 49;
                                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 6))  ) ) 
                                            { 
                                            __context__.SourceCodeLine = 49;
                                            NUM6  .Value = (ushort) ( 1 ) ; 
                                            __context__.SourceCodeLine = 49;
                                            NUM6  .Value = (ushort) ( 0 ) ; 
                                            } 
                                        
                                        else 
                                            {
                                            __context__.SourceCodeLine = 50;
                                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 7))  ) ) 
                                                { 
                                                __context__.SourceCodeLine = 50;
                                                NUM7  .Value = (ushort) ( 1 ) ; 
                                                __context__.SourceCodeLine = 50;
                                                NUM7  .Value = (ushort) ( 0 ) ; 
                                                } 
                                            
                                            else 
                                                {
                                                __context__.SourceCodeLine = 51;
                                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 8))  ) ) 
                                                    { 
                                                    __context__.SourceCodeLine = 51;
                                                    NUM8  .Value = (ushort) ( 1 ) ; 
                                                    __context__.SourceCodeLine = 51;
                                                    NUM8  .Value = (ushort) ( 0 ) ; 
                                                    } 
                                                
                                                else 
                                                    {
                                                    __context__.SourceCodeLine = 52;
                                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P1 == 9))  ) ) 
                                                        { 
                                                        __context__.SourceCodeLine = 52;
                                                        NUM9  .Value = (ushort) ( 1 ) ; 
                                                        __context__.SourceCodeLine = 52;
                                                        NUM9  .Value = (ushort) ( 0 ) ; 
                                                        } 
                                                    
                                                    }
                                                
                                                }
                                            
                                            }
                                        
                                        }
                                    
                                    }
                                
                                }
                            
                            }
                        
                        }
                    
                    }
                
                __context__.SourceCodeLine = 53;
                Functions.Delay (  (int) ( 50 ) ) ; 
                __context__.SourceCodeLine = 54;
                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 0))  ) ) 
                    { 
                    __context__.SourceCodeLine = 54;
                    NUM0  .Value = (ushort) ( 1 ) ; 
                    __context__.SourceCodeLine = 54;
                    NUM0  .Value = (ushort) ( 0 ) ; 
                    } 
                
                else 
                    {
                    __context__.SourceCodeLine = 55;
                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 1))  ) ) 
                        { 
                        __context__.SourceCodeLine = 55;
                        NUM1  .Value = (ushort) ( 1 ) ; 
                        __context__.SourceCodeLine = 55;
                        NUM1  .Value = (ushort) ( 0 ) ; 
                        } 
                    
                    else 
                        {
                        __context__.SourceCodeLine = 56;
                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 2))  ) ) 
                            { 
                            __context__.SourceCodeLine = 56;
                            NUM2  .Value = (ushort) ( 1 ) ; 
                            __context__.SourceCodeLine = 56;
                            NUM2  .Value = (ushort) ( 0 ) ; 
                            } 
                        
                        else 
                            {
                            __context__.SourceCodeLine = 57;
                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 3))  ) ) 
                                { 
                                __context__.SourceCodeLine = 57;
                                NUM3  .Value = (ushort) ( 1 ) ; 
                                __context__.SourceCodeLine = 57;
                                NUM3  .Value = (ushort) ( 0 ) ; 
                                } 
                            
                            else 
                                {
                                __context__.SourceCodeLine = 58;
                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 4))  ) ) 
                                    { 
                                    __context__.SourceCodeLine = 58;
                                    NUM4  .Value = (ushort) ( 1 ) ; 
                                    __context__.SourceCodeLine = 58;
                                    NUM4  .Value = (ushort) ( 0 ) ; 
                                    } 
                                
                                else 
                                    {
                                    __context__.SourceCodeLine = 59;
                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 5))  ) ) 
                                        { 
                                        __context__.SourceCodeLine = 59;
                                        NUM5  .Value = (ushort) ( 1 ) ; 
                                        __context__.SourceCodeLine = 59;
                                        NUM5  .Value = (ushort) ( 0 ) ; 
                                        } 
                                    
                                    else 
                                        {
                                        __context__.SourceCodeLine = 60;
                                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 6))  ) ) 
                                            { 
                                            __context__.SourceCodeLine = 60;
                                            NUM6  .Value = (ushort) ( 1 ) ; 
                                            __context__.SourceCodeLine = 60;
                                            NUM6  .Value = (ushort) ( 0 ) ; 
                                            } 
                                        
                                        else 
                                            {
                                            __context__.SourceCodeLine = 61;
                                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 7))  ) ) 
                                                { 
                                                __context__.SourceCodeLine = 61;
                                                NUM7  .Value = (ushort) ( 1 ) ; 
                                                __context__.SourceCodeLine = 61;
                                                NUM7  .Value = (ushort) ( 0 ) ; 
                                                } 
                                            
                                            else 
                                                {
                                                __context__.SourceCodeLine = 62;
                                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 8))  ) ) 
                                                    { 
                                                    __context__.SourceCodeLine = 62;
                                                    NUM8  .Value = (ushort) ( 1 ) ; 
                                                    __context__.SourceCodeLine = 62;
                                                    NUM8  .Value = (ushort) ( 0 ) ; 
                                                    } 
                                                
                                                else 
                                                    {
                                                    __context__.SourceCodeLine = 63;
                                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P2 == 9))  ) ) 
                                                        { 
                                                        __context__.SourceCodeLine = 63;
                                                        NUM9  .Value = (ushort) ( 1 ) ; 
                                                        __context__.SourceCodeLine = 63;
                                                        NUM9  .Value = (ushort) ( 0 ) ; 
                                                        } 
                                                    
                                                    }
                                                
                                                }
                                            
                                            }
                                        
                                        }
                                    
                                    }
                                
                                }
                            
                            }
                        
                        }
                    
                    }
                
                __context__.SourceCodeLine = 64;
                Functions.Delay (  (int) ( 50 ) ) ; 
                __context__.SourceCodeLine = 65;
                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 0))  ) ) 
                    { 
                    __context__.SourceCodeLine = 65;
                    NUM0  .Value = (ushort) ( 1 ) ; 
                    __context__.SourceCodeLine = 65;
                    NUM0  .Value = (ushort) ( 0 ) ; 
                    } 
                
                else 
                    {
                    __context__.SourceCodeLine = 66;
                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 1))  ) ) 
                        { 
                        __context__.SourceCodeLine = 66;
                        NUM1  .Value = (ushort) ( 1 ) ; 
                        __context__.SourceCodeLine = 66;
                        NUM1  .Value = (ushort) ( 0 ) ; 
                        } 
                    
                    else 
                        {
                        __context__.SourceCodeLine = 67;
                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 2))  ) ) 
                            { 
                            __context__.SourceCodeLine = 67;
                            NUM2  .Value = (ushort) ( 1 ) ; 
                            __context__.SourceCodeLine = 67;
                            NUM2  .Value = (ushort) ( 0 ) ; 
                            } 
                        
                        else 
                            {
                            __context__.SourceCodeLine = 68;
                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 3))  ) ) 
                                { 
                                __context__.SourceCodeLine = 68;
                                NUM3  .Value = (ushort) ( 1 ) ; 
                                __context__.SourceCodeLine = 68;
                                NUM3  .Value = (ushort) ( 0 ) ; 
                                } 
                            
                            else 
                                {
                                __context__.SourceCodeLine = 69;
                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 4))  ) ) 
                                    { 
                                    __context__.SourceCodeLine = 69;
                                    NUM4  .Value = (ushort) ( 1 ) ; 
                                    __context__.SourceCodeLine = 69;
                                    NUM4  .Value = (ushort) ( 0 ) ; 
                                    } 
                                
                                else 
                                    {
                                    __context__.SourceCodeLine = 70;
                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 5))  ) ) 
                                        { 
                                        __context__.SourceCodeLine = 70;
                                        NUM5  .Value = (ushort) ( 1 ) ; 
                                        __context__.SourceCodeLine = 70;
                                        NUM5  .Value = (ushort) ( 0 ) ; 
                                        } 
                                    
                                    else 
                                        {
                                        __context__.SourceCodeLine = 71;
                                        if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 6))  ) ) 
                                            { 
                                            __context__.SourceCodeLine = 71;
                                            NUM6  .Value = (ushort) ( 1 ) ; 
                                            __context__.SourceCodeLine = 71;
                                            NUM6  .Value = (ushort) ( 0 ) ; 
                                            } 
                                        
                                        else 
                                            {
                                            __context__.SourceCodeLine = 72;
                                            if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 7))  ) ) 
                                                { 
                                                __context__.SourceCodeLine = 72;
                                                NUM7  .Value = (ushort) ( 1 ) ; 
                                                __context__.SourceCodeLine = 72;
                                                NUM7  .Value = (ushort) ( 0 ) ; 
                                                } 
                                            
                                            else 
                                                {
                                                __context__.SourceCodeLine = 73;
                                                if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 8))  ) ) 
                                                    { 
                                                    __context__.SourceCodeLine = 73;
                                                    NUM8  .Value = (ushort) ( 1 ) ; 
                                                    __context__.SourceCodeLine = 73;
                                                    NUM8  .Value = (ushort) ( 0 ) ; 
                                                    } 
                                                
                                                else 
                                                    {
                                                    __context__.SourceCodeLine = 74;
                                                    if ( Functions.TestForTrue  ( ( Functions.BoolToInt (P3 == 9))  ) ) 
                                                        { 
                                                        __context__.SourceCodeLine = 74;
                                                        NUM9  .Value = (ushort) ( 1 ) ; 
                                                        __context__.SourceCodeLine = 74;
                                                        NUM9  .Value = (ushort) ( 0 ) ; 
                                                        } 
                                                    
                                                    }
                                                
                                                }
                                            
                                            }
                                        
                                        }
                                    
                                    }
                                
                                }
                            
                            }
                        
                        }
                    
                    }
                
                __context__.SourceCodeLine = 75;
                Functions.Delay (  (int) ( 50 ) ) ; 
                __context__.SourceCodeLine = 76;
                ENTER  .Value = (ushort) ( 1 ) ; 
                __context__.SourceCodeLine = 77;
                Functions.Delay (  (int) ( 50 ) ) ; 
                __context__.SourceCodeLine = 78;
                ENTER  .Value = (ushort) ( 0 ) ; 
                
                
            }
            catch(Exception e) { ObjectCatchHandler(e); }
            finally { ObjectFinallyHandler( __SignalEventArg__ ); }
            return this;
            
        }
        
    
    public override void LogosSplusInitialize()
    {
        SocketInfo __socketinfo__ = new SocketInfo( 1, this );
        InitialParametersClass.ResolveHostName = __socketinfo__.ResolveHostName;
        _SplusNVRAM = new SplusNVRAM( this );
        TEMPSTRING  = new CrestronString( Crestron.Logos.SplusObjects.CrestronStringEncoding.eEncodingASCII, 3, this );
        
        NUM0 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM0__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM0__DigitalOutput__, NUM0 );
        
        NUM1 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM1__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM1__DigitalOutput__, NUM1 );
        
        NUM2 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM2__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM2__DigitalOutput__, NUM2 );
        
        NUM3 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM3__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM3__DigitalOutput__, NUM3 );
        
        NUM4 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM4__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM4__DigitalOutput__, NUM4 );
        
        NUM5 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM5__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM5__DigitalOutput__, NUM5 );
        
        NUM6 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM6__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM6__DigitalOutput__, NUM6 );
        
        NUM7 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM7__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM7__DigitalOutput__, NUM7 );
        
        NUM8 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM8__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM8__DigitalOutput__, NUM8 );
        
        NUM9 = new Crestron.Logos.SplusObjects.DigitalOutput( NUM9__DigitalOutput__, this );
        m_DigitalOutputList.Add( NUM9__DigitalOutput__, NUM9 );
        
        ENTER = new Crestron.Logos.SplusObjects.DigitalOutput( ENTER__DigitalOutput__, this );
        m_DigitalOutputList.Add( ENTER__DigitalOutput__, ENTER );
        
        STRINGIN__DOLLAR__ = new Crestron.Logos.SplusObjects.StringInput( STRINGIN__DOLLAR____AnalogSerialInput__, 5, this );
        m_StringInputList.Add( STRINGIN__DOLLAR____AnalogSerialInput__, STRINGIN__DOLLAR__ );
        
        
        STRINGIN__DOLLAR__.OnSerialChange.Add( new InputChangeHandlerWrapper( STRINGIN__DOLLAR___OnChange_0, false ) );
        
        _SplusNVRAM.PopulateCustomAttributeList( true );
        
        NVRAM = _SplusNVRAM;
        
    }
    
    public override void LogosSimplSharpInitialize()
    {
        
        
    }
    
    public UserModuleClass_NUMBERICSTRINGDECODE ( string InstanceName, string ReferenceID, Crestron.Logos.SplusObjects.CrestronStringEncoding nEncodingType ) : base( InstanceName, ReferenceID, nEncodingType ) {}
    
    
    
    
    const uint STRINGIN__DOLLAR____AnalogSerialInput__ = 0;
    const uint NUM0__DigitalOutput__ = 0;
    const uint NUM1__DigitalOutput__ = 1;
    const uint NUM2__DigitalOutput__ = 2;
    const uint NUM3__DigitalOutput__ = 3;
    const uint NUM4__DigitalOutput__ = 4;
    const uint NUM5__DigitalOutput__ = 5;
    const uint NUM6__DigitalOutput__ = 6;
    const uint NUM7__DigitalOutput__ = 7;
    const uint NUM8__DigitalOutput__ = 8;
    const uint NUM9__DigitalOutput__ = 9;
    const uint ENTER__DigitalOutput__ = 10;
    
    [SplusStructAttribute(-1, true, false)]
    public class SplusNVRAM : SplusStructureBase
    {
    
        public SplusNVRAM( SplusObject __caller__ ) : base( __caller__ ) {}
        
        
    }
    
    SplusNVRAM _SplusNVRAM = null;
    
    public class __CEvent__ : CEvent
    {
        public __CEvent__() {}
        public void Close() { base.Close(); }
        public int Reset() { return base.Reset() ? 1 : 0; }
        public int Set() { return base.Set() ? 1 : 0; }
        public int Wait( int timeOutInMs ) { return base.Wait( timeOutInMs ) ? 1 : 0; }
    }
    public class __CMutex__ : CMutex
    {
        public __CMutex__() {}
        public void Close() { base.Close(); }
        public void ReleaseMutex() { base.ReleaseMutex(); }
        public int WaitForMutex() { return base.WaitForMutex() ? 1 : 0; }
    }
     public int IsNull( object obj ){ return (obj == null) ? 1 : 0; }
}


}
