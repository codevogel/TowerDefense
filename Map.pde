class Map
{
    public GameTile[][] grid;
    private Level level;

    Map()
    {
        grid = new GameTile[GRID_SIZE_X][GRID_SIZE_Y];
    }

    protected void setLevel(Level _level)
    {
        level = _level;
    }

    void display()
    {
        strokeWeight(1);
        
        for (GameTile[] gameTileList : grid)
        {
            for (GameTile t : gameTileList)
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
                map.grid[x][y] = new GameTile(new Position(posX, posY));
                posY += TILE_WIDTH;
            }
            posX += TILE_WIDTH;
            posY = TILE_WIDTH / 2;
        }
        setGameTiles();
    }
    
    protected void setGameTiles()
    {
        Position[] waypointIndeces = level.waypointIndeces;
        print(waypointIndeces.length);
        final color pathColor = 125;

        for (int index = 0; index < waypointIndeces.length; index++)
        {
            Position current = waypointIndeces[index];

            if (index + 1 < waypointIndeces.length)
            {
                Position next = waypointIndeces[index + 1];
                setPath(current, next);
            }
            else {
                setAPathGameTile(current.x, current.y);
            }
        }
    }

    protected void setPath(Position current, Position next)
    {
        final color pathColor = 125;
        Boolean horizontal = (current.y == next.y) ? true : false;
    
        int constantIndex;
        int iteratingIndex;

        if (horizontal)
        {
            int y = current.y;
            Boolean ascending = (current.x < next.x);
            if (ascending)
            {
                for (int x = current.x; x < next.x; x++)
                {
                    setAPathGameTile(x, y);
                }
            }
            else {
                for (int x = current.x; x > next.x; x--)
                {
                    setAPathGameTile(x, y);
                }
            }
        }
        else {
            int x = current.x;
            Boolean ascending = (current.y < next.y);
            if (ascending)
            {
                for (int y = current.y; y < next.y; y++)
                {
                    setAPathGameTile(x, y);
                }
            }
            else {
                for (int y = current.y; y > next.y; y--)
                {
                    setAPathGameTile(x, y);
                }
            }

        }
    }

    private void setAPathGameTile(int x, int y)
    {
        grid[x][y].setPath(true);
        grid[x][y].style.setColor("fillColor", level.style.pathColor);
    }

    
}