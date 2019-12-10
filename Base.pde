/**
 * Describes the base players have to defend.
 * @author Kamiel de Visser | 500838438
 */
class Base
{
    private int hp;
    private int hpMax;

    private final int RADIUS = TILE_WIDTH / 2;

    private final int NUM_EDGES = 50;
    private final int NUM_EDGES_MAX = NUM_EDGES - MINIMUM_POLY_EDGES;

    private boolean oneMoreHit = true;
    
    private Position pos;

    /**
     * Instantiates a new Base object
     * @param pos the position of the base object
     */
    Base(Position pos)
    {
        this.pos = pos;
        hp = 150;
        hpMax = hp;
    }

    /**
     * @return whether the base is still alive
     */
    public boolean isAlive()
    {
        return hp > 0;
    }

    /**
     * @param damage the amount of damage taken
     * @return true if the base has died from this hit
     *         false if the base has survived this hit
     */
    public boolean takeDamage(int damage)
    {
        hp -= damage;
        if (hp <= 0)
        {
            if (oneMoreHit)
            {
                oneMoreHit = false;
                return false;
            }
            return true;
        }
        return false;
    }

    /**
     * Get the amount of points this polygon should
     * consist of based on it's current hp (minimum of 3)
     * @return the amount of points the polygon should be drawn with
     */
    private int getPoints()
    {
        float percentile = float(hp) / hpMax;
        return 3 + int(percentile * NUM_EDGES_MAX);
    }
    
    /**
     * Displays the base
     */
    public void display()
    {
        strokeWeight(THICK_STROKE_SIZE);
        stroke(WHITE);
        fill(WHITE, OPACITY_INVISIBLE);
        polygon(pos.getX(), pos.getY(), RADIUS, getPoints());
    }
}