static class UIManager
{
    static UIStats uiStats;

    public static void init()
    {
        uiStats = tDInstance.new UIStats();
    }

    public static void display()
    {
        uiStats.display();
    }
}