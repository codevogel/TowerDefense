static class ActionManager
{
    static public GameTile selectedGameTile;
    static public MenuTile selectedMenuTile;

    static public void initSelectedTiles()
    {
        initSelectedTile(0);
        initSelectedTile(1);
        
    }

    static public void initSelectedTile(int type)
    {
        if (type == 0)
        {
            selectedGameTile = Map.grid[PlayerController.selectionMap.x][PlayerController.selectionMap.y];
            selectedGameTile.setSelected(true);
        }
        else 
        {
            selectedMenuTile = SideMenu.buttons[PlayerController.selectionMenu];
            selectedMenuTile.setSelected(false);
        }
    }

    static public GameTile getSelectedGameTile()
    {
        return selectedGameTile;
    }

    static public void handleSelectionInput()
    {
    }

    static public void handleStartOfWaveInput(int frameCount)
    {
        if (PlayerController.getStartWaveDown())
        {
            startWave(frameCount);
        }
    }

    static public void handlePlayingInput()
    {
        if (PlayerController.getPlaceTowerDown())
        {
            placeTowerAtSelected(1);
            PlayerController.setPlaceTowerDown(false);
        }
    }

    static public void startWave(int frameCount)
    {
        GameManager.setGameState(1);
        WaveManager.startWave(frameCount);
    }

    static public boolean placeTowerAtSelected(int type)
    {
        if (selectedGameTile.isPath())
        {
            return false;
        }
        if (selectedGameTile.hasTower())
        {
            return false;
        }
        if (type == 1)
        {
            selectedGameTile.setTower(tDInstance.new LaserTower(selectedGameTile));
            TowerManager.addTower(selectedGameTile.getTower());
        }
        return true;
    }

    static public void setSelectedTiles()
    {
        if (PlayerController.isMapSelected())
        {
            selectedMenuTile.setSelected(false);
            selectedGameTile.setSelected(false);
            selectedGameTile = Map.grid[PlayerController.selectionMap.x][PlayerController.selectionMap.y];
            selectedGameTile.setSelected(true);
        }
        else 
        {
            selectedMenuTile.setSelected(false);
            selectedMenuTile = SideMenu.buttons[PlayerController.selectionMenu];
            selectedMenuTile.setSelected(true);
        }
    }
}