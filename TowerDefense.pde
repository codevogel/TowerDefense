final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static int DEFAULT_STROKE_SIZE = 1;

private StartMenu startMenu = new StartMenu();

private ActionManager actionManager;

private Levels levels;
private Map map;
private SideMenu sideMenu;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    levels = new Levels();
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
        for (GameTile[] tList : map.grid)
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
    Map.setLevel(levels.levels[0]);
    Map.initGrid(this);
    SideMenu.initMenu(this);
    ActionManager.initSelectedTile(0);
    ActionManager.initSelectedTile(1);
    GameManager.setGameState(1);
    EnemyManager.addEnemy(new Enemy(new Position(500, 500)));
}
