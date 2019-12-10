/**
 * Manages game actions
 * @author Kamiel de Visser | 500838438
 */
static class ActionManager
{
    // Holds the selected tiles
    static public GameTile selectedGameTile;
    static public MenuTile selectedMenuTile;

    /**
     * Initializes the selected tiles
     */ 
    static public void initSelectedTiles()
    {
        selectedGameTile = Map.grid[PlayerController.selectionMap.x][PlayerController.selectionMap.y];
        selectedGameTile.setSelected(true);
        selectedMenuTile = SideMenu.buttons[PlayerController.selectionMenu];
        selectedMenuTile.setSelected(false);      
    }

    /**
     * Gets the currently selected game tile
     */ 
    static public GameTile getSelectedGameTile()
    {
        return selectedGameTile;
    }

    /**
     * Sets the gamestate to playing and starts the wave
     * @param frameNo the frame the wave is started
     */
    static public void startWave(int frameNo)
    {
        GameManager.setGameState(1);
        WaveManager.startWave(frameNo);
    }
    
    /**
     * If possible, places a type of tower at the currently selected tile
     * @return true if tower has been placed
     *         false if tile is path or already contains a tower. 
     */
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
            if (GoldManager.purchase(LaserTower.PRICE))
            {
                selectedGameTile.setTower(tDInstance.new LaserTower(selectedGameTile));
                TowerManager.addTower(selectedGameTile.getTower());
            }
        }
        return true;
    }

    /**
     * Undo's the previously selected tiles, then gets the newly selected tiles
     */
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