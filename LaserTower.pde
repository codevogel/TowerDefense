class LaserTower extends Tower
{
    private Enemy enemy;
    private Boolean shooting = false;
    private Style style;

    public static final int PRICE = 5;

    LaserTower(GameTile parent)
    {
        super(parent);
        style = new Style();
    }

    public Boolean isShooting()
    {
        return shooting;
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

    public void shoot()
    {
        // if target is still in range
        if (isEnemyInRange(enemy))
        {
            // Let target take damage (returns true if target dies)
            if (enemy.takeDamage(2))
            {
                // if enemy died because of this damage, stop shooting
                stopShooting();
            }
            // draw the laser
            stroke(style.laserColor);
            strokeWeight(style.laserStrokeWeight);
            line(this.pos.getX(), this.pos.getY(), enemy.pos.getX(), enemy.pos.getY());
        }
        // if target is no longer in range, stop shooting
        else 
        {
            stopShooting();
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

    private void startShooting()
    {
        shooting = true;
    }

    private void stopShooting()
    {
        shooting = false;
    }

    public void setEnemy(Enemy enemy)
    {
        this.enemy = enemy;
    }

    // Look for enemies in range of this tower
    public void checkForEnemy()
    {
        for (Enemy e : EnemyManager.enemyList)
        {
            if (isEnemyInRange(e))
            {
                // Enemy found: start shooting at this enemy
                setEnemy(e);
                startShooting();
                return;
            }
        }
        return;
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