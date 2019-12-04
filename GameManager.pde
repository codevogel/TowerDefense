static class GameManager
{
    protected static int gameState = 0;
    private static int currentLevel = 0;

    protected static void setGameState(int state)
    {
        gameState = state;
        return;
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