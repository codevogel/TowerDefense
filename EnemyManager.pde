static class EnemyManager
{
    protected static ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

    protected static void addEnemy(Enemy e)
    {
        enemyList.add(e);
    }

    protected static void moveEnemies()
    {
        Position[] waypointIndeces = Levels.levels[GameManager.getCurrentLevel].waypointIndeces;
        for (Enemy e : enemyList)
        {
            if (e.isMoving())
            {
                e.moveTowards(e.waypointsPassed);
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