class Enemy
{
    Position pos;
    private final int d = TILE_WIDTH / 2;
    private final int r = d / 2;
    private Style style;

    private int hp;
    private Boolean alive = true;

    private Boolean moving = true;
    private Boolean reachedLastPos = false;

    private int waypointsPassed;

    private Waypoint nextWaypoint;

    private int v = 10;

    Enemy(Position _pos, Position firstWaypointPosition)
    {
        pos = _pos;
        style = new Style();
        waypointsPassed = 0;
        hp = 100;
        nextWaypoint = new Waypoint(pos, firstWaypointPosition);
    }

    public Boolean isAlive()
    {
        return alive;
    }

    public Boolean takeDamage(int damage)
    {
        hp -= damage;
        if (hp <= 0)
        {
            alive = false;
            WaveManager.enemyKilled();
            return true;
        }
        return false;
    }

    public void passWaypoint()
    {
        if (reachedLastPos)
        {
            // enemy should die here
            moving = false;
            return;
        }
        Position[] waypointIndeces = LevelManager.getCurrentLevel().getWaypointIndeces();
        waypointsPassed += 1;

        if (waypointsPassed < waypointIndeces.length)
        {
            Position index = waypointIndeces[waypointsPassed];
            GameTile tile = Map.getTileAt(index.getX(), index.getY());
            nextWaypoint = new Waypoint(pos, tile.getPos());
        }
        else {
            Position finalPosition = new Position(nextWaypoint.pos.getX() + TILE_WIDTH, nextWaypoint.pos.getY());
            nextWaypoint = new Waypoint(pos, finalPosition);
            reachedLastPos = true;
        }
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

    void move()
    {
        // if enemy has to move horizontally
        if (nextWaypoint.isHorizontal())
        {
            int nextX = nextWaypoint.pos.getX();
            // and forwards
            if (nextWaypoint.isForward())
            {
                int newX = pos.getX() + v;
                pos.setX(newX);
                if (newX >= nextX)
                {
                    newX = nextX;
                    pos.setX(newX);
                    passWaypoint();
                }
                return;
            }
            // or backwards
            int newX = pos.getX() - v;
            pos.setX(newX);
            if (newX <= nextX)
            {
                newX = nextX;
                pos.setX(newX);
                passWaypoint();
            }
            return;
        }
        // if enemy has to move vertically
        else 
        {
            int nextY = nextWaypoint.pos.getY();
            // print(String.format("currentPos: %d, nextY: %d\n", pos.getY(), nextY));
            // print(nextWaypoint.isForward() + "\n");
            
            // and forwards
            if (nextWaypoint.isForward())
            {
                int newY = pos.getY() + v;
                pos.setY(newY);
                if (newY >= nextY)
                {
                    newY = nextY;
                    pos.setY(newY);
                    passWaypoint();
                }
                return;
            }
            // or backwards
            int newY = pos.getY() - v;
            pos.setY(newY);
            if (newY <= nextY)
            {
                newY = nextY;
                pos.setY(newY);
                passWaypoint();
            }
            return;
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