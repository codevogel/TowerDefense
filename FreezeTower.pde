class FreezeTower extends Tower
{
    private Style style;
    public static final int PRICE = 5;

    private boolean freezing = false;

    private ArrayList<Enemy> targets;


    FreezeTower(GameTile parent)
    {
        super(parent);
        style = new Style();
        targets = new ArrayList<Enemy>();
    }
    
    public void shoot()
    {
        getTargets();
        if (shooting)
        {
            freezeEnemies();
        }
    }

    private void freezeEnemies()
    {
        for (Enemy e : targets)
        {
            e.setFrozen(true);
        }
    }

    public void display()
    {
        fill(255);
        circle(pos.x, pos.y, d);
        if (parent.isSelected())
        {
            fill(color(255,0,0), 50);
            circle(pos.x, pos.y, rangeD);
        }
    }

    private void startShooting()
    {
        shooting = true;
    }

    private void stopShooting()
    {
        shooting = false;

    }

    public Boolean isShooting()
    {
        return shooting;
    }

    // Look for enemies in range of this tower
    public void getTargets()
    {
        for (Enemy e : targets)
{
            if (isEnemyInRange(e))
            {
                continue;
            }
            e.frozen = false;
        }
        targets = new ArrayList<Enemy>();
        for (Enemy e : EnemyManager.enemyList)
        {
            if (isEnemyInRange(e))
            {
                targets.add(e);
            }
        }
        if (targets.size() > 0)
        {
            shooting = true;
        }
        else {
            shooting = false;
        }
    }

    // Checks whether a specific enemy is in range of the tower.
    // Returns true and assigns enemy to the enemy if the enemy is in range.
    Boolean isEnemyInRange(Enemy e)
    {
        // distance from the tower to the enemy
        float distance = dist(pos.getX(), pos.getY(), e.pos.getX(), e.pos.getY());
        // if the enemy is in range
        if (distance <= range)
        {
            return true;
        }
        return false;
    }

    // holds styling options for this type of tower    
    class Style 
    {
        color fillColor = color(100, 100, 100);
        color rangeFill = color(0, 0, 0);
        color laserColor = color(235, 20, 20, 210);
        color black = 0;
        color iceBlue = color(186, 242, 239);
        int laserStrokeWeight = SIZE_X / 100;
        int defaultStrokeWeight = 1;
    }
}