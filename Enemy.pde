class Enemy
{
    Position pos;
    private final int d = int(TILE_WIDTH * .75);
    private final int r = d / 2;
    private Style style;

    private int hp;
    private int hpMax;
    private int numEdgesMax;
    private int award;

    private Boolean alive = true;

    private Boolean moving = true;
    private Boolean reachedLastPos = false;

    private int waypointsPassed;

    private Waypoint nextWaypoint;

    private int v = int(DELTA_TIME * 300f);

    Enemy(Position _pos, Position firstWaypointPosition)
    {
        pos = _pos;
        style = new Style();
        waypointsPassed = 0;
        hp = 100;
        hpMax = hp;
        award = 5;
        int numEdges = 15;
        numEdgesMax = numEdges - MINIMUM_POLY_EDGES;
        nextWaypoint = new Waypoint(pos, firstWaypointPosition);
    }

    public int getAward()
    {
        return award;
    }

    private int getEdges()
    {
        float percentile = float(hp) / hpMax;
        return 3 + int(percentile * numEdgesMax);
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
        strokeWeight(THICK_STROKE_SIZE);
        stroke(WHITE);
        fill(WHITE, OPACITY_INVISIBLE);
        polygon(pos.getX(), pos.getY(), r, getEdges());
    }

    class Style
    {
        private final int OPACITY = 0;
    }
}