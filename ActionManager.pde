static class ActionManager
{
    static public GameTile selectedGameTile;
    static public MenuTile selectedMenuTile;

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