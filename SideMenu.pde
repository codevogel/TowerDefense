
static class SideMenu
{
    static protected MenuTile[] buttons = new MenuTile[GRID_SIZE_Y];

    static protected void initMenu()
    {
        int y = TILE_WIDTH / 2;
        int x = SIZE_X - y;
        for (int i = 0; i < buttons.length; i++)
        {
            buttons[i] = tDInstance.new MenuTile(new Position(x, y));
            buttons[i].style.setColor(Color.FILL, 125);
            buttons[i].style.setColor(Color.STROKE, 125);
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