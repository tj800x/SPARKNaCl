separate (SPARKNaCl)
procedure Sanitize_GF (R : out GF) is
begin
   R := GF'(others => 0);
   pragma Inspection_Point (R); --  See RM H3.2 (9)

   --  Add target-dependent code here to
   --  1. flush and invalidate data cache,
   --  2. wait until writes have committed (e.g. a memory-fence instruction)
   --  3. whatever else is required.
end Sanitize_GF;
