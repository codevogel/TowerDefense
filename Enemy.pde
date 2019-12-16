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

    private boolean alive = true;

    private boolean moving = true;
    private boolean frozen = false;

    private boolean reachedLastPos = false;

    private int waypointsPassed;

    private Waypoint nextWaypoint;
    
    public static final float DEFAULT_V = TILE_WIDTH / 25f;
    public static final float FROZEN_V = DEFAULT_V * .60f;
    public static final float RECOVER_V = .125f;
    public static final int RECOVER_FRAMES_STEP = 20;

    private AutoTimer freezeTimer;

    private float v = DEFAULT_V;

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
        freezeTimer = new AutoTimer(RECOVER_FRAMES_STEP);
    }

    public void setFrozen(boolean frozen)
    {
        this.frozen = frozen;
    }

    public void setV(int v)
    {
        this.v = v;
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

    private float getV()
    {
        if (frozen)
        {
            return FROZEN_V;
        }
        else {
            if (freezeTimer.actionAllowed())
            {
                if (v < DEFAULT_V)
                {
                    return constrain(v + RECOVER_V, FROZEN_V, DEFAULT_V);
                }
            }
        }
        return v;
    }

    void move()
    {
        v = getV();
        // if enemy has to move horizontally
        if (nextWaypoint.isHorizontal())
        {
            int nextX = nextWaypoint.pos.getX();
            // and forwards
            if (nextWaypoint.isForward())
            {
                int newX = int( pos.getX() + v );
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
            int newX = int (pos.getX() - v );
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
                int newY = int (pos.getY() + v);
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
            int newY = int(pos.getY() - v);
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
        text(String.format("%f", v), pos.getX(), pos.getY());
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