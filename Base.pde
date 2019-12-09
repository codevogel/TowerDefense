class Base
{
    private int hp;
    private int hpMax;

    private final int RADIUS = TILE_WIDTH;

    private final int NUM_EDGES = 50;
    private final int NUM_EDGES_MAX = NUM_EDGES - MINIMUM_POLY_EDGES;
    
    private Position pos;

    Base(Position pos)
    {
        this.pos = pos;
        hp = 150;
        hpMax = hp;
    }

    public boolean isAlive()
    {
        return hp > 0;
    }

    public boolean takeDamage(int damage)
    {
        hp -= damage;
        if (hp <= 0)
        {
            return true;
        }
        return false;
    }

    private int getEdges()
    {
        float percentile = float(hp) / hpMax;
        return 3 + int(percentile * NUM_EDGES_MAX);
    }

    public void display()
    {
        fill(255);
        polygon(pos.getX(), pos.getY(), RADIUS, getEdges());
    }
}