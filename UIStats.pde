class UIStats
{
    private final Position pos = new Position(0,0);

    final int WIDTH = TILE_WIDTH * 5;
    final int HEIGHT = TILE_WIDTH * 2;

    final int TEXT_HEIGHTPOS_ONE = int(TILE_WIDTH * .5f);
    final int TEXT_HEIGHTPOS_TWO = TEXT_HEIGHTPOS_ONE + TILE_WIDTH;

    final int TEXT_WIDTHPOS_ONE = int(TILE_WIDTH * .2f);

    static final int TEXT_SIZE = SIZE_X / 50;
    static final color COLOR_BORDER = WHITE;
    static final int OPACITY_BORDER = 125;
    static final int WEIGHT_BORDER = 2;
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

    void displayWave()
    {
        fill(WHITE);
        text(String.format("Wave: %d", WaveManager.getWaveCount()), TEXT_WIDTHPOS_ONE, TEXT_HEIGHTPOS_ONE);
    }
}