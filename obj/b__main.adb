pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E115 : Short_Integer; pragma Import (Ada, E115, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__io_exceptions_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__strings_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__strings__maps_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings__maps__constants_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "ada__tags_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "ada__streams_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "interfaces__c_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "interfaces__c__strings_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exceptions_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__file_control_block_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__file_io_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__finalization_root_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__finalization_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__storage_pools_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "system__finalization_masters_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "system__task_info_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "ada__calendar__delays_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "system__object_reader_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__dwarf_lines_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__tasking__initialization_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "system__traceback__symbolic_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ada__real_time_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__text_io_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__tasking__protected_objects_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "system__tasking__protected_objects__entries_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__tasking__queuing_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "system__tasking__stages_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E178 := E178 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E097 := E097 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E110 := E110 - 1;
         F3;
      end;
      E166 := E166 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__finalization_masters__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, False, False, True, True, False, False, True, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           False, False, True, False, True, True, False, True, 
           False, True, True, False, True, False, True, False, 
           False, False, True, False, False, False, False, False, 
           True, False, True, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           True, False, False, False, True, False, False, True, 
           False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 1, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E100 := E100 + 1;
      Ada.Strings'Elab_Spec;
      E046 := E046 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E052 := E052 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E099 := E099 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E025 := E025 + 1;
      System.File_Control_Block'Elab_Spec;
      E118 := E118 + 1;
      System.Finalization_Root'Elab_Spec;
      E113 := E113 + 1;
      Ada.Finalization'Elab_Spec;
      E111 := E111 + 1;
      System.Storage_Pools'Elab_Spec;
      E170 := E170 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Task_Info'Elab_Spec;
      E152 := E152 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E091 := E091 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E166 := E166 + 1;
      System.File_Io'Elab_Body;
      E110 := E110 + 1;
      E142 := E142 + 1;
      E063 := E063 + 1;
      Ada.Tags'Elab_Body;
      E102 := E102 + 1;
      E048 := E048 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E115 := E115 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      E041 := E041 + 1;
      E061 := E061 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E036 := E036 + 1;
      System.Tasking.Initialization'Elab_Body;
      E182 := E182 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E136 := E136 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E097 := E097 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E172 := E172 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E178 := E178 + 1;
      System.Tasking.Queuing'Elab_Body;
      E190 := E190 + 1;
      System.Tasking.Stages'Elab_Body;
      E198 := E198 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\Rangel\Desktop\projetosADA\driver\obj\main.o
   --   -LC:\Users\Rangel\Desktop\projetosADA\driver\obj\
   --   -LC:\Users\Rangel\Desktop\projetosADA\driver\obj\
   --   -LC:/gnat/2016/lib/gcc/i686-pc-mingw32/4.9.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
