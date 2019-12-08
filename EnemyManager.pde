static class EnemyManager
{
    protected static ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

    protected static void addEnemy(Enemy e)
    {
        enemyList.add(e);
    }

    public static void removeEnemyAt(int index)
    {
        enemyList.remove(index);
    }

    protected static void handleEnemies()
    {
        removeEnemies();
        for (Enemy e : enemyList)
        {
            e.move();
            e.display();
        }
    }

    private static void removeEnemies()
    {
        IntList indexesToRemove = new IntList();
        int index = 0;
        for (Enemy e: enemyList)
        {
            if (!e.isAlive())
            {
                indexesToRemove.append(index);
            }
            index++;
        }

        for (int i : indexesToRemove)
        {
            enemyList.remove(i);
        }
    }

    protected static void clearEnemyList()
    {
        enemyList = new ArrayList<Enemy>();
    }
}