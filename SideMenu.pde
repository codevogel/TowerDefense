class SideMenu
{
    protected MenuTile[] buttons;

    SideMenu()
    {
        buttons = new MenuTile[GRID_SIZE_Y];
    }

    protected void initMenu()
    {
        int y = TILE_WIDTH / 2;
        int x = SIZE_X - y;
        for (int i = 0; i < buttons.length; i++)
        {
            buttons[i] = new MenuTile(new Position(x, y));
            buttons[i].style.setColor("fillColor", 255);
            y += TILE_WIDTH;
        }
    }

    protected void display()
    {
        for (MenuTile t : buttons)
        {
            t.display();
        }
    }
}