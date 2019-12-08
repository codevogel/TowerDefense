static class TowerManager
{
    private static ArrayList<Tower> towerList = new ArrayList<Tower>();

    public static void addTower(Tower t)
    {
        towerList.add(t);
    }

    public static void displayTowers()
    {
        for (Tower t : towerList)
        {
            if (t instanceof LaserTower)
            {
                LaserTower currentTower = (LaserTower) t;
                currentTower.display();
            }
        }
    }

    public static void fireTowers()
    {
        for (Tower tower : towerList)
        {
            if (tower instanceof LaserTower)
            {
                LaserTower currentTower = (LaserTower) tower;
                if (currentTower.isShooting())
                {
                    // attempt to fire at enemy
                    // stops shooting if enemy dies or moves out of range
                    currentTower.shoot();
                }
                else {
                    // search for an enemy and start shooting at it if one is found
                    currentTower.checkForEnemy();
                }
            }
        }
    }
}