with SPARKNaCl;        use SPARKNaCl;
with SPARKNaCl.Core;   use SPARKNaCl.Core;
with SPARKNaCl.Debug;  use SPARKNaCl.Debug;
with SPARKNaCl.Stream; use SPARKNaCl.Stream;
procedure Stream4
is
   Firstkey : constant Salsa20_Key :=
     (16#1b#, 16#27#, 16#55#, 16#64#, 16#73#, 16#e9#, 16#85#, 16#d4#,
      16#62#, 16#cd#, 16#51#, 16#19#, 16#7a#, 16#9a#, 16#46#, 16#c7#,
      16#60#, 16#09#, 16#54#, 16#9e#, 16#ac#, 16#64#, 16#74#, 16#f2#,
      16#06#, 16#c4#, 16#ee#, 16#08#, 16#44#, 16#f6#, 16#83#, 16#89#);

   Nonce : constant HSalsa20_Nonce :=
     (16#69#, 16#69#, 16#6e#, 16#e9#, 16#55#, 16#b6#, 16#2b#, 16#73#,
      16#cd#, 16#62#, 16#bd#, 16#a8#, 16#75#, 16#fc#, 16#73#, 16#d6#,
      16#82#, 16#19#, 16#e0#, 16#03#, 16#6b#, 16#7a#, 16#0b#, 16#37#);

   Nonce8 : constant Salsa20_Nonce :=
     (16#69#, 16#69#, 16#6e#, 16#e9#, 16#55#, 16#b6#, 16#2b#, 16#73#);

   M : constant Byte_Seq (0 .. 162) :=
     (0,   0,   0,   0,   0,   0,   0,   0,
      0,   0,   0,   0,   0,   0,   0,   0,
      0,   0,   0,   0,   0,   0,   0,   0,
      0,   0,   0,   0,   0,   0,   0,   0,
      16#be#, 16#07#, 16#5f#, 16#c5#, 16#3c#, 16#81#, 16#f2#, 16#d5#,
      16#cf#, 16#14#, 16#13#, 16#16#, 16#eb#, 16#eb#, 16#0c#, 16#7b#,
      16#52#, 16#28#, 16#c5#, 16#2a#, 16#4c#, 16#62#, 16#cb#, 16#d4#,
      16#4b#, 16#66#, 16#84#, 16#9b#, 16#64#, 16#24#, 16#4f#, 16#fc#,
      16#e5#, 16#ec#, 16#ba#, 16#af#, 16#33#, 16#bd#, 16#75#, 16#1a#,
      16#1a#, 16#c7#, 16#28#, 16#d4#, 16#5e#, 16#6c#, 16#61#, 16#29#,
      16#6c#, 16#dc#, 16#3c#, 16#01#, 16#23#, 16#35#, 16#61#, 16#f4#,
      16#1d#, 16#b6#, 16#6c#, 16#ce#, 16#31#, 16#4a#, 16#db#, 16#31#,
      16#0e#, 16#3b#, 16#e8#, 16#25#, 16#0c#, 16#46#, 16#f0#, 16#6d#,
      16#ce#, 16#ea#, 16#3a#, 16#7f#, 16#a1#, 16#34#, 16#80#, 16#57#,
      16#e2#, 16#f6#, 16#55#, 16#6a#, 16#d6#, 16#b1#, 16#31#, 16#8a#,
      16#02#, 16#4a#, 16#83#, 16#8f#, 16#21#, 16#af#, 16#1f#, 16#de#,
      16#04#, 16#89#, 16#77#, 16#eb#, 16#48#, 16#f5#, 16#9f#, 16#fd#,
      16#49#, 16#24#, 16#ca#, 16#1c#, 16#60#, 16#90#, 16#2e#, 16#52#,
      16#f0#, 16#a0#, 16#89#, 16#bc#, 16#76#, 16#89#, 16#70#, 16#40#,
      16#e0#, 16#82#, 16#f9#, 16#37#, 16#76#, 16#38#, 16#48#, 16#64#,
      16#5e#, 16#07#, 16#05#);

   C : Byte_Seq (0 .. 162);
begin
   HSalsa20_Xor (C, M, Nonce, Firstkey);
   DH ("C is", C);

   --  RCC adds this case to gain coverage of...
   Salsa20_Xor (C, M, Nonce8, Firstkey);
   DH ("C2 is", C);
end Stream4;
