class ActionManager
{
    InputTimer inputTimer;
    private GameTile selectedTile;

    ActionManager(int frameNo, GameTile _selectedTile)
    {
        inputTimer = new InputTimer(frameNo);
        selectedTile = _selectedTile;
    }


    private void setTileSelection()
    {
        selectedTile = map.grid[PlayerController.selectionMap.x][PlayerController.selectionMap.y];
        selectedTile.setSelected(true);
    }

    private void undoTileSelection()
    {
        selectedTile.setSelected(false);
    }
    
    class InputTimer
    {
        private int previousKeyPress;
        private final int FRAMES_BETWEEN_INPUTS = 5;

        InputTimer(int frameNo)
        {
            previousKeyPress = frameNo;
        }

        Boolean inputAllowed(int frameNo)
        {
            if (frameNo - previousKeyPress > FRAMES_BETWEEN_INPUTS)
            {
                previousKeyPress = frameNo;
                return true;
            }
            return false;
        }
    }

}