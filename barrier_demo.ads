--  Ada 2022 topic: Ada.Synchronous_Barriers.
pragma Ada_2022;

package Barrier_Demo is

   --  Spawn Worker_Count tasks that each wait on one barrier;
   --  returns how many tasks observed Released = True (exactly one).
   function Run_Barrier (Worker_Count : Positive) return Natural;

end Barrier_Demo;
