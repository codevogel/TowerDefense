

final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static int DEFAULT_STROKE_SIZE = 1;

private StartMenu startMenu = new StartMenu();

private Levels levels;
private Map map;

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
        map.display();
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
}

void startNewGame()
{
    map = new Map();
    map.setLevel(levels.levels[0]);
    map.initGrid();
    GameManager.setGameState(1);
}