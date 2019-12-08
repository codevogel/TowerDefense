static class ActionManager
{
    static public GameTile selectedGameTile;
    static public MenuTile selectedMenuTile;

    static public void initSelectedTiles()
    {
        initSelectedTile(0);
        initSelectedTile(1);
    }

    static public void placeTowerAt(int x, int y, int type)
    {
        GameTile tile = Map.grid[x][y];
        if (tile.isPath() || tile.hasTower())
        {
            return;
        }
        if (type == 1)
        {
            
            tile.setTower(tDInstance.new LaserTower(tile));
        }
    }

    static public void placeTowerAtSelected(int type)
    {
        if (selectedGameTile.isPath())
        {
            return;
        }
        if (selectedGameTile.hasTower())
        {
            PlayerController.swapSelection();
            return;
        }
        if (type == 1)
        {
            selectedGameTile.setTower(tDInstance.new LaserTower(selectedGameTile));
            TowerManager.addTower(selectedGameTile.getTower());
        }
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
            selectedMenuTile.setSelected(true);
        }
    }

    static public void getSelectedTile()
    {
        if (PlayerController.selectingMap)
        {
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