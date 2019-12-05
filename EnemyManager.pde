static class EnemyManager
{
    protected static ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

    protected static void addEnemy(Enemy e)
    {
        enemyList.add(e);
    }

    protected static void moveEnemies()
    {
        for (Enemy e : enemyList)
        {
            e.move();
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