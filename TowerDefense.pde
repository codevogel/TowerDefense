final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static int DEFAULT_STROKE_SIZE = 1;

private StartMenu startMenu = new StartMenu();

private ActionManager actionManager;

/**
Processing parses this contents of this .pde file into a TowerDefense class
All other .pde files are then parsed into nested classes of the TowerDefense class
For instance, what we see as a 'LevelManager' class is in reality a
'TowerDefense.LevelManager' class. Due to this behaviour, is it sometimes 
required to get a reference to the TowerDefense instance to be able to
instantiate TowerDefense's nested classes or make use of Processing's methods.
*/
public static TowerDefense towerDefenseInstance;

void settings()
{
    // Get a reference to this TowerDefense object
    towerDefenseInstance = this;
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    LevelManager.initLevels();
}

void draw()
{
    if (GameManager.gameState == 1)
    {
        Map.display();
        SideMenu.display();
        EnemyManager.displayEnemies();
    }
    else if (GameManager.gameState == 0)
    {
        startMenu.display();
    }
}

void mousePressed()
{
    if (GameManager.gameState == 0)
    {
        if (startMenu.checkForStart())
        {
            startNewGame();
        }
    }
    else if (GameManager.gameState == 1)
    {
        for (GameTile[] tList : Map.grid)
        {
            for (GameTile t : tList)
            {
                print(String.format("Tile on x: %d, y: %d, is a path: %b\n", t.pos.x, t.pos.y, t.path));
            }
        }
    }
}

void keyPressed()
{
    PlayerController.setKeyState(key, true);
    if (InputTimer.inputAllowed(frameCount))
    {
        PlayerController.setSelection();
        ActionManager.getSelectedTile();
    }

    if (key == ' ')
    {
        PlayerController.swapSelection();
    }
}

void keyReleased()
{
    PlayerController.setKeyState(key, false);
}

void startNewGame()
{
    LevelManager.setCurrentLevel(1);
    Map.initGrid();
    SideMenu.initMenu();
    ActionManager.initSelectedTile(0);
    ActionManager.initSelectedTile(1);
    GameManager.setGameState(1);
    EnemyManager.addEnemy(new Enemy(new Position(500, 500)));
}
