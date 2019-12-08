static class GameManager
{
    protected static int gameState = 0;
    private static int currentLevel = 0;

    protected static void setGameState(int state)
    {
        gameState = state;
        return;
    }

    protected static int getGameState()
    {
        return gameState;
    }

    public static Boolean inStartMenu()
    {
        return gameState == 0;
    }

    public static Boolean playing()
    {
        return gameState == 1;
    }

    public static Boolean startOfWave()
    {
        return gameState == 2;
    }
    
    public static void setCurrentLevel(int levelNo)
    {
        currentLevel = levelNo;
    }

    public static int getCurrentLevel()
    {
        return currentLevel;
    }
}