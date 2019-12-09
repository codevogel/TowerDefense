final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static private int FRAME_RATE = 30;

final static int DEFAULT_STROKE_SIZE = 1;

final static int MINIMUM_POLY_EDGES = 3;

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
public static TowerDefense tDInstance;

void settings()
{
    // Get a reference to this TowerDefense object
    tDInstance = this;
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    frameRate(FRAME_RATE);
    rectMode(CENTER);
    textMode(CENTER);
    textSize(40);
    LevelManager.initLevels();
}

public void polygon(float x, float y, float radius, int npoints) 
{
    if (npoints > 0)
    {
        float angle = TWO_PI / npoints;
        beginShape();
        for (float a = 0; a < TWO_PI; a += angle) 
        {
            float sx = x + cos(a) * radius;
            float sy = y + sin(a) * radius;
            vertex(sx, sy);
        }
        endShape(CLOSE);
    }
}

void draw()
{
    if (GameManager.gameOver())
    {
        background(0);
    }
    else if (GameManager.playing())
    {
        ActionManager.setSelectedTiles();
        handleSelectionInput();

        if (WaveManager.started())
        {
            WaveManager.spawnEnemies(frameCount);

        }
        if (WaveManager.waveOver())
        {
            WaveManager.nextWave();
        }

        // Temporary: set grid stroke
        stroke(125, 125);
        strokeWeight(1);
        Map.display();
        EnemyManager.handleEnemies();
        BaseManager.display();
        SideMenu.display();
        TowerManager.displayTowers();
        TowerManager.fireTowers();
    }
    else if (GameManager.startOfWave())
    {
        ActionManager.setSelectedTiles();
        handleSelectionInput();

        if (PlayerController.getStartWaveDown())
        {
            ActionManager.startWave(frameCount);
        }
        
        Map.display();
        BaseManager.display();
        TowerManager.displayTowers();
        SideMenu.display();
        fill(255);
        text("hit j to start wave", SIZE_X / 2, SIZE_Y / 2);
    }
    else if (GameManager.inStartMenu())
    {
        startMenu.display();
    }
    fill(255);
    text(String.format("Gamestate: %d", GameManager.getGameState()), 100 , 100);
    text(String.format("Wave: %d", WaveManager.getWaveCount()), 100 , 200);
}

void handleSelectionInput()
{
    if (PlayerController.getPlaceTowerDown())
    {
        if (!ActionManager.getSelectedGameTile().hasTower())
        {
            ActionManager.placeTowerAtSelected(1);
        }
        else 
        {
            PlayerController.swapSelection();
        }
    }
}

void mousePressed()
{
    if (GameManager.inStartMenu())
    {
        if (startMenu.checkForStart())
        {
            startNewGame(2);
        }
    }
}

void keyPressed()
{
    if (InputTimer.inputAllowed(frameCount))
    {
        setInput(true);
    }
}

void keyReleased()
{
    setInput(false);
}

void setInput(boolean down)
{
    PlayerController.setKeyState(key, down);
    PlayerController.setSelection();
}

void startNewGame(int currentLevelNo)
{
    // Set the current level
    LevelManager.setCurrentLevel(currentLevelNo);
    // Initialize the map
    Map.initGrid();

    Position[] waypointIndeces = LevelManager.getCurrentLevel().getWaypointIndeces();
    Position lastWaypointIndex = waypointIndeces[waypointIndeces.length - 1];
    Position lastWaypointPos = Map.grid[lastWaypointIndex.getX()][lastWaypointIndex.getY()].getPos();

    EnemyManager.setFinalWaypoint(lastWaypointPos);
    BaseManager.setBase(new Base(lastWaypointPos));

    WaveManager.setFirstPositions();
    // Initialize the sidemenu
    SideMenu.initMenu();
    // Select the initially selected tiles
    ActionManager.initSelectedTiles();
    // Change the gamestate to paused
    GameManager.setGameState(2);
}