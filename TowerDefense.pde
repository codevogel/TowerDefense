

final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static int DEFAULT_STROKE_SIZE = 1;

static Tile[][] grid = new Tile[GRID_SIZE_X][GRID_SIZE_Y];

private StartMenu startMenu = new StartMenu();

private Levels levels = new Levels();

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    rectMode(CENTER);
    initGrid();
}

void draw()
{
    if (GameManager.gameState == 1)
    {
        showGrid();
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
    initGrid();
    GameManager.setGameState(1);
}

void initGrid()
{
    int posX = TILE_WIDTH / 2;
    int posY = posX;
    for (int x = 0; x < GRID_SIZE_X; x++)
    {
        for (int y = 0; y < GRID_SIZE_Y; y++)
        {
            grid[x][y] = new Tile(new Position(posX, posY));
            posY += TILE_WIDTH;
        }
        posX += TILE_WIDTH;
        posY = TILE_WIDTH / 2;
    }

    levels.initLevels();
    adjustTileColors();
}

void adjustTileColors()
{
    Position[] tileIndeces = levels.levels[0].tileIndeces;
    final color pathColor = 125;
    for (Position pos : tileIndeces)
    {
        grid[pos.x][pos.y].style.setColor("fillColor", pathColor);
    }
}

void showGrid()
{   
    strokeWeight(1);
    for (Tile[] tileList : grid)
    {
        for (Tile t : tileList)
        {
            t.display();
        }
    }
}