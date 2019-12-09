class GoldManager
{
    private int gold = 0;
    private int previousFrame = 0;

    private final int GOLD_INCREMENT = 1;
    
    public int getGold()
    {
        return gold;
    }

    public int addGold(int amount)
    {
        gold += amount;
    }

    public int removeGold(int amount)
    {
        gold -= amount;
    }

    public int incrementGold(int frameCount)
    {
        if (frameCount >= previousFrame)
        {
            gold += GOLD_INCREMENT;
        }
    }
}