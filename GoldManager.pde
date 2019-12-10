static class GoldManager
{
    private static int gold = 0;
    private static int previousFrame = 0;

    private static final int GOLD_INCREMENT = 1;

    public static boolean purchase(int cost)
    {
        if (gold >= cost)
        {
            removeGold(cost);
            return true;
        }
        return false;
    }
    
    public static int getGold()
    {
        return gold;
    }

    public static void addGold(int amount)
    {
        gold += amount;
    }

    public static void removeGold(int amount)
    {
        gold -= amount;
    }

    public static void incrementGold(int frameCount)
    {
        if (frameCount >= previousFrame + FRAME_RATE)
        {
            gold += GOLD_INCREMENT;
            previousFrame = frameCount;
        }
    }
}