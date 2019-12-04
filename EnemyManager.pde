static class EnemyManager
{
    protected static ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

    private static Position[] waypointIndeces;

    protected static void addEnemy(Enemy e)
    {
        enemyList.add(e);
    }

    protected static void moveEnemies()
    {
        waypointIndeces = LevelManager.currentLevel.waypointIndeces;
        for (Enemy e : enemyList)
        {
            if (e.isMoving())
            {
                // e.moveTowards(e.waypointsPassed);
            }
            
        }
    }

    protected static void displayEnemies()
    {
        for (Enemy e : enemyList)
        {
            e.display();
        }
    }

    protected static void clearEnemyList()
    {
        enemyList = new ArrayList<Enemy>();
    }
}