pragma Ada_2022;

with Ada.Synchronous_Barriers; use Ada.Synchronous_Barriers;

package body Barrier_Demo is

   function Run_Barrier (Worker_Count : Positive) return Natural is
      Barrier : Synchronous_Barrier (Release_Threshold => Worker_Count);

      protected Counter is
         procedure Inc;
         function Get return Natural;
      private
         N : Natural := 0;
      end Counter;

      protected body Counter is
         procedure Inc is
         begin
            N := N + 1;
         end Inc;
         function Get return Natural is
         begin
            return N;
         end Get;
      end Counter;

      task type Worker;
      task body Worker is
         Notified : Boolean;
      begin
         Wait_For_Release (Barrier, Notified);
         if Notified then
            Counter.Inc;
         end if;
      end Worker;

      Workers : array (1 .. Worker_Count) of Worker;
      pragma Unreferenced (Workers);
   begin
      --  Tasks run and rendezvous on the barrier; wait for them to finish
      --  by falling off the declarative region (task waits at end of block).
      null;
      return Counter.Get;
   end Run_Barrier;

end Barrier_Demo;
