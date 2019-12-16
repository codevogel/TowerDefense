class FreezeTower extends Tower
{
    private Style style;
    public static final int PRICE = 5;

    private boolean freezing = false;

    private ArrayList<Enemy> targets;

    private AutoTimer shotTimer;
    private AutoTimer freezeStepTimer;

    private int currentV;
    private int freezeStep;

    private final int DEFAULT_V = 25;
    private final int FROZEN_V = 10;
    private final int NUM_STEPS = 5;
    private final int V_PER_STEP = DEFAULT_V - FROZEN_V / NUM_STEPS;

    FreezeTower(GameTile parent)
    {
        super(parent);
        style = new Style();
        targets = new ArrayList<Enemy>();
        shotTimer = new AutoTimer(FrameCounter.getCurrentFrame());
    }
    
    public void shoot()
    {
        int currentFrame = FrameCounter.getCurrentFrame();
        if (shotTimer.actionAllowed(currentFrame))
        {
            startFreezing();
        }
        if (freezing)
        {
            if (freezeStepTimer.actionAllowed(currentFrame))
            {
                freezeEnemies();
            }
        }
    }

    public void startFreezing()
    {
        freezing = true;
        currentV = FROZEN_V;
        freezeStep = 1;
    }

    private void freezeEnemies()
    {
        for (Enemy e : targets)
        {
            e.setV(getCurrentV(freezeStep));
        }
        freezeStep += 1;
    }

    private void getCurrentV(int freezeStep)
    {
        currentV = FROZEN_V + freezeStep - 1 * V_PER_STEP;
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
        startShootingFrame = FrameCounter.getCurrentFrame();
        stopShootingFrame = startShootingFrame + FRAMES_FROZEN;
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