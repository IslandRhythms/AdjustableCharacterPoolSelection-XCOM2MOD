// This is an Unreal Script
class CharacterPoolManager_Override_Screen extends Object config(CharacterPoolManager_Override_NullConfig);

var config int VERSION_CFG;
var config int RATIO;

`include(AdjustableCharacterPoolSelection/Src/ModConfigMenuAPI/MCM_API_Includes.uci)
`include(AdjustableCharacterPoolSelection/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci)


event OnInit(UIScreen Screen)
{
	`MCM_API_Register(Screen, ClientModCallback);
}

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode) {
	local MCM_API_SettingsPage Page;
	local MCM_API_SettingsGroup Group;

	Page = ConfigAPI.NewSettingsPage("Adjustable Character Pool Selection");
	Page.SetPageTitle("Adjustable Character Pool Selection");
	Page.SetSaveHandler(SaveButtonClicked);
	Group = Page.AddGroup('Group1', "General Settings");
	Group.AddSlider('ratio', "ratio", "", 0, 100, 1, RATIO, , RatioSaveHandler);
	Page.ShowSettings();
}

simulated function RatioSaveHandler(MCM_API_Setting _Setting, float _SettingValue) {
	RATIO = _SettingValue;
}

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
	VERSION_CFG = `MCM_CH_GetCompositeVersion();
	SaveConfig();

}
