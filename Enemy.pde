class Enemy
{
    Position pos;
    private final int d = TILE_WIDTH / 2;
    private final int r = d / 2;
    private Style style;

    private Boolean moving = true;

    private int waypointsPassed;

    private Waypoint nextWaypoint;

    Enemy(Position _pos)
    {
        pos = _pos;
        style = new Style();
        waypointsPassed = 0;
    }

    public void updateWaypoint()
    {
        
    }
    
    public void setWaypointsPassed(int _waypointsPassed)
    {
        waypointsPassed = _waypointsPassed;
    }

    public int getWaypointsPassed()
    {
        return waypointsPassed;
    }

    public void setMoving(Boolean _moving)
    {
        moving = _moving;
    }

    public boolean isMoving()
    {
        return moving;
    }

    public void moveTowards(Position pos)
    {
        GameTile waypoint = Map.grid[pos.x][pos.y];
        Boolean movingHorizontal = this.pos.y == waypoint.pos.y;

        if (movingHorizontal)
        {
            
        }
    }

    void move()
    {
        if (moving)
        {

        }
    }

    public void display()
    {
        fill(style.fillColor);
        circle(pos.x, pos.y, d);
    }
    
    class Style
    {
        private final color fillColor = color(0, 0, 255);
    }
}