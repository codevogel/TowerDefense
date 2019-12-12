static class GameManager
{
    protected static int gameState = 0;
    private static int currentLevel = 0;

    private final static int START_MENU_STATE = 0;

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
        return gameState == START_MENU_STATE;
    }

    public static Boolean playing()
    {
        return gameState == 1;
    }

    public static Boolean startOfWave()
    {
        return gameState == 2;
    }

    public static Boolean gameOver()
    {
        if (BaseManager.getBase() != null)
        {
            if (BaseManager.getBase().isAlive())
            {
                return false;
            }
            gameState = 3;
            return true;
        }
        return false;
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