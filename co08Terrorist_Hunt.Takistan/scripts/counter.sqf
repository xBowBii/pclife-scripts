if (time > (lastCountedTime + 5)) then {
  gTerroristCount = east countSide allUnits;
  lastCountedTime = time;  
}
else {gTerroristCount = gTerroristCount - 1;};
hintSilent format["Terrorists left: %1", gTerroristCount];