
static class SideMenu
{
    static protected MenuTile[] buttons = new MenuTile[GRID_SIZE_Y];

    static protected void initMenu(TowerDefense instance)
    {
        int y = TILE_WIDTH / 2;
        int x = SIZE_X - y;
        for (int i = 0; i < buttons.length; i++)
        {
            buttons[i] = instance.new MenuTile(new Position(x, y));
            buttons[i].style.setColor("fillColor", 255);
            y += TILE_WIDTH;
        }
    }

    static protected void display()
    {
        for (MenuTile t : buttons)
        {
            t.display();
        }
    }
}