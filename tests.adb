pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Barrier_Demo;

procedure Tests is
   N : Natural;
begin
   N := Barrier_Demo.Run_Barrier (Worker_Count => 4);
   Assert (N = 1);
   Put_Line ("PASS Synchronous_Barrier: exactly one Notified among 4 workers");

   N := Barrier_Demo.Run_Barrier (Worker_Count => 2);
   Assert (N = 1);
   Put_Line ("PASS Synchronous_Barrier with 2 workers");

   Put_Line ("All Synchronous Barriers topic tests passed.");
end Tests;
