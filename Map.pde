class Map
{
    public Tile[][] grid;
    private Level level;

    Map()
    {
        grid = new Tile[GRID_SIZE_X][GRID_SIZE_Y];
    }

    protected void setLevel(Level _level)
    {
        level = _level;
    }

    void display()
    {
        strokeWeight(1);
        for (Tile[] tileList : grid)
        {
            for (Tile t : tileList)
            {
                t.display();
            }
        }
    }

    void initGrid()
    {
        int posX = TILE_WIDTH / 2;
        int posY = posX;
        for (int x = 0; x < GRID_SIZE_X; x++)
        {
            for (int y = 0; y < GRID_SIZE_Y; y++)
            {
                map.grid[x][y] = new Tile(new Position(posX, posY));
                posY += TILE_WIDTH;
            }
            posX += TILE_WIDTH;
            posY = TILE_WIDTH / 2;
        }
        setTiles();
    }
    
    protected void setTiles()
    {
        Position[] tileIndeces = level.tileIndeces;
        final color pathColor = 125;
        for (Position pos : tileIndeces)
        {
            map.grid[pos.x][pos.y].style.setColor("fillColor", pathColor);
        }
    }
}