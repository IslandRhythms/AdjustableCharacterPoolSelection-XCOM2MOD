// This is an Unreal Script
class CharacterPoolManager_Override extends CharacterPoolManager config(AdjustableCharacterPoolSelection_DEFAULT);

var config int RATIO;

function ECharacterPoolSelectionMode GetSelectionMode(ECharacterPoolSelectionMode OverrideMode)
{
    if( OverrideMode != eCPSM_None && OverrideMode != eCPSM_Mixed )
        return OverrideMode;

    // check for mixed, 50-50 chance of random/pool
    if( OverrideMode == eCPSM_Mixed || SelectionMode == eCPSM_Mixed )
    {
        if( `SYNC_RAND(100) <= RATIO )
            return eCPSM_PoolOnly;
        else
            return eCPSM_RandomOnly;

    }

    return SelectionMode;
}