static class WaveManager
{

    private static int previousFrame;

    private static Boolean started = false;

    private static final int FRAMES_BETWEEN_UNITS = FRAME_RATE * 2;

    private static Position firstEnemyPosition;
    private static Position firstWaypointPosition;

    private static final int ENEMIES_PER_WAVE = 5;

    private static int waveCount = 1;
    private static int numEnemiesPassed = 0;
    private static int numEnemiesAdded = 0;
    private static int numEnemiesDead = 0;
    private static int numEnemiesToAdd = ENEMIES_PER_WAVE;
    
    public static int getWaveCount()
    {
        return waveCount;
    }

    public static float getPercentCompleted()
    {
        return (numEnemiesDead + float(numEnemiesPassed)) / numEnemiesToAdd;
    }

    public static void startWave(int frameNo)
    {
        previousFrame = frameNo;
        started = true;
    }

    public static void enemyKilled()
    {
        numEnemiesDead += 1;
    }

    public static void enemyPassed()
    {
        numEnemiesPassed += 1;
    }

    public static void setFirstPositions()
    {
        Position firstIndex = LevelManager.getCurrentLevel().getWaypointIndeces()[0];
        firstWaypointPosition = Map.getTileAt(firstIndex.getX(), firstIndex.getY()).getPos();
        firstEnemyPosition = new Position(firstWaypointPosition.getX() - TILE_WIDTH, firstWaypointPosition.getY());
    }

    public static Boolean started()
    {
        return started;
    }

    public static Boolean waveOver()
    {
        return numEnemiesDead + numEnemiesPassed == numEnemiesToAdd;
    }

    public static void nextWave()
    {
        EnemyManager.clearEnemyList();
        GameManager.setGameState(2);
        numEnemiesPassed = 0;
        numEnemiesAdded = 0;
        numEnemiesDead = 0;
        waveCount++;
        numEnemiesToAdd = waveCount * ENEMIES_PER_WAVE;
    }

    public static void spawnEnemies(int currentFrame)
    {
        
        if (currentFrame >= previousFrame + FRAMES_BETWEEN_UNITS)
        {
            // print(String.format("Current frame: %d, previousFrame - FRAMES_BETWEEN_UNITS: %d\n", currentFrame, previousFrame - FRAMES_BETWEEN_UNITS));
            previousFrame = currentFrame;
            // print("ADDING ENEMY\n");

            // Ensure we pass the standard position as it's own object
            Position uniquePosition = new Position(firstEnemyPosition.getX(), firstEnemyPosition.getY());
            EnemyManager.addEnemy(tDInstance.new Enemy(uniquePosition, firstWaypointPosition));
            // print("positions: ", firstEnemyPosition.getX(), "   ", firstEnemyPosition.getY(), "\n");
            numEnemiesAdded += 1;
        }
        if (numEnemiesAdded == numEnemiesToAdd)
        {
            started = false;
        } 
    }
}