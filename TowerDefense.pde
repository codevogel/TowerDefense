final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;

final static int GRID_SIZE_X = 15;
final static int GRID_SIZE_Y = 9;

final static int TILE_WIDTH = SIZE_X / 16;

final static private int FRAME_RATE = 30;

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

void draw()
{
    if (GameManager.playing())
    {
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


        SideMenu.display();
        EnemyManager.handleEnemies();
        TowerManager.displayTowers();
        TowerManager.fireTowers();

        ActionManager.handlePlayingInput();
    }
    else if (GameManager.startOfWave())
    {
        Map.display();
        TowerManager.displayTowers();
        SideMenu.display();
        text("hit j to start wave", SIZE_X / 2, SIZE_Y / 2);

        ActionManager.handleStartOfWaveInput(frameCount);
    }
    else if (GameManager.inStartMenu())
    {
        startMenu.display();
    }
    fill(255);
    text(String.format("Gamestate: %d", GameManager.getGameState()), 100 , 100);
    text(String.format("Wave: %d", WaveManager.getWaveCount()), 100 , 200);
}

void mousePressed()
{
    if (GameManager.inStartMenu())
    {
        if (startMenu.checkForStart())
        {
            startNewGame();
        }
    }
    else if (GameManager.playing())
    {
        
    }
}


void selectCurrentTiles()
{
    if (InputTimer.inputAllowed(frameCount))
    {
        PlayerController.setSelection();
        ActionManager.getSelectedTile();
    }
}

void keyPressed()
{
    setInput();
    if (key == ' ')
    {
        PlayerController.swapSelection();
    }
}

void setInput()
{
    PlayerController.setKeyState(key, true);
    selectCurrentTiles();
}

void keyReleased()
{
    PlayerController.setKeyState(key, false);
}

void startNewGame()
{
    // Set the current level
    LevelManager.setCurrentLevel(1);
    // Initialize the map
    Map.initGrid();
    WaveManager.setFirstPositions();
    // Initialize the sidemenu
    SideMenu.initMenu();
    // Select the initially selected tiles
    ActionManager.initSelectedTiles();
    // Change the gamestate to paused
    GameManager.setGameState(2);
}