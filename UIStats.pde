class UIStats
{
    private final Position pos = new Position(0,0);

    final int WIDTH = TILE_WIDTH * 5;
    final int HEIGHT = TILE_WIDTH * 2;

    final int TEXT_HEIGHTPOS_ONE = int(TILE_WIDTH * .3f);
    final int TEXT_HEIGHTPOS_TWO = TEXT_HEIGHTPOS_ONE + TILE_WIDTH;

    final int TEXT_WIDTHPOS_ONE = int(TILE_WIDTH * .2f);

    static final int TEXT_SIZE = SIZE_X / 50;
    static final color COLOR_BORDER = WHITE;
    static final int OPACITY_BORDER = 125;
    static final int WEIGHT_BORDER = 2;
    static final int WEIGHT_WAVE_BAR = 4;
    static final color COLOR_BACKGROUND = WHITE;
    static final int OPACITY_BACKGROUND = 25;

    public UIStats()
    {
    }

    void display()
    {
        rectMode(CORNER);
        textAlign(LEFT, CENTER);
        textSize(TEXT_SIZE);
        drawContainer();
        displayWave();
        rectMode(CENTER);
    }

    void drawContainer()
    {
        fill(COLOR_BACKGROUND, OPACITY_BACKGROUND);
        stroke(COLOR_BORDER, OPACITY_BORDER);
        strokeWeight(WEIGHT_BORDER);
        rect(pos.getX(), pos.getY(), WIDTH, HEIGHT);
    }

    private final int WAVE_BAR_LEFT_X = int(TILE_WIDTH * .5f);
    private final int WAVE_BAR_Y = int(HEIGHT - WAVE_BAR_LEFT_X);
    private final int WAVE_BAR_RIGHT_X = int(WIDTH - TILE_WIDTH * .5f);

    void displayWave()
    {
        fill(WHITE);
        float percentile = WaveManager.getPercentCompleted();
        float xPos = WAVE_BAR_LEFT_X + (WAVE_BAR_RIGHT_X - WAVE_BAR_LEFT_X) * percentile;
        text(String.format("Wave: %f", percentile), pos.getX() + TEXT_WIDTHPOS_ONE, pos.getY() + TEXT_HEIGHTPOS_ONE);
        strokeWeight(WEIGHT_WAVE_BAR);
        line(WAVE_BAR_LEFT_X, WAVE_BAR_Y, WAVE_BAR_RIGHT_X, WAVE_BAR_Y);
        if (percentile > 0)
        {
            stroke(RED);
            line(WAVE_BAR_LEFT_X, WAVE_BAR_Y, xPos, WAVE_BAR_Y);
        }
    }
}