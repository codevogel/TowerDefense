static class WaveManager
{
    private static boolean active = false;

    private static int wave = 1;

    private static int numUnitsSpawned;
    private static int numUnitsToSpawn;

    private static int frameToSpawnNextUnit;

    private final static int UNITS_PER_WAVE = 5;

    private static final int FRAMES_BETWEEN_UNITS = 50;

    static protected void startWave()
    {
        active = true;
    }

    static protected void stopWave()
    {
        active = false;
    }

    static protected void incrementWave()
    {
        wave++;
    }

    static protected void initWave(int frameNo)
    {
        EnemyManager.clearEnemyList();
        setNumUnitsToSpawn(getUnitsToSpawn());
        setNumUnitsSpawned(0);
        setFrameToSpawnNextUnit(frameNo + FRAMES_BETWEEN_UNITS);
        startWave();
    }

    static protected void spawnUnit(int frameCount)
    {
        if (frameCount >= frameToSpawnNextUnit)
        {
            // EnemyManager.addEnemy(new Enemy(new Position(500, 500)));
        }
    }

    static protected int getUnitsToSpawn()
    {
        return wave * UNITS_PER_WAVE;
    }

    static protected void setNumUnitsToSpawn(int _numUnitsToSpawn)
    {
        numUnitsToSpawn = _numUnitsToSpawn;
    }

    static protected void setNumUnitsSpawned(int _numUnitsSpawned)
    {
        numUnitsSpawned = _numUnitsSpawned;
    }

    static protected void setFrameToSpawnNextUnit(int _frameToSpawnNextUnit)
    {
        frameToSpawnNextUnit = _frameToSpawnNextUnit;
    }
}