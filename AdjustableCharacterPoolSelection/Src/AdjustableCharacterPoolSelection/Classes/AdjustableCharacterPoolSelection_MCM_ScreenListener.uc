// This is an Unreal Script

class AdjustableCharacterPoolSelection_MCM_ScreenListener extends UIScreenListener;

event OnInit (UIScreen Screen)
{
	local CharacterPoolManager_Override_Screen MCMScreen;

	if (ScreenClass == none)
	{
		if (MCM_API(Screen) != none)
		{
			ScreenClass = Screen.Class;
		}
		else
		{
			return;
		}
	}

	MCMScreen = new class'CharacterPoolManager_Override_Screen';
	MCMScreen.OnInit(Screen);
}

defaultproperties
{
    ScreenClass = none;
}