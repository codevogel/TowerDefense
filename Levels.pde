class Levels
{
    final private int NUM_LEVELS = 1;

    protected Level[] levels = new Level[NUM_LEVELS];

    Levels()
    {
        initLevels();
    }

    protected void initLevels()
    {
        initLevelOne();
    }

    private void initLevelOne()
    {
        Position[] tileList = {
            new Position(0, 5),
            new Position(1, 5),
            new Position(2, 5)
            };
        levels[0] = new Level(tileList);
    }
}