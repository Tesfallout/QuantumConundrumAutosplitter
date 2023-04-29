// Quantum Conundrum Autosplitter
// Written by Tesfallout
// Version 1.0 (4/28/2023)
// Supports: Start, Split, Load Removal - Reset is not applicable for this run.


state("TryGame-Win32-Shipping") {
	//gameState = 2 Main Menu
	//gameState = 3 Paused - sometimes load screen?
	//gameState = 4 Level Select
	//gameState = 5 End of Wing
	//gameState = 7 Great Hall
	//gameState = 8 In Chamber
	//gameState = 9 In Hallway
	//gameState = 10 Load Screen

	int gameState: 0x01017404;
}

 isLoading {
	if ((current.gameState == 2 || current.gameState == 3 || current.gameState == 4 || current.gameState == 5 || current.gameState == 9 || current.gameState == 10) || (current.gameState == 8 && old.gameState == 4)){return true;} else {return false;}
}

split {
	if ((old.gameState == 7 || old.gameState == 8) && (current.gameState == 5 || current.gameState == 9 || current.gameState == 10)){return true;}
}

start {
	if ((current.gameState == 7 ||current.gameState == 8) && old.gameState == 10) {return true;}
}
