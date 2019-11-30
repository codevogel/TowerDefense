class Enemy
{
    Position pos;
    private final int d = TILE_WIDTH / 2;
    private final int r = d / 2;
    private Style style;

    Enemy(Position _pos)
    {
        pos = _pos;
        style = new Style();
    }

    void display()
    {
        fill(style.fillColor);
        circle(pos.x, pos.y, d);
    }
    
    class Style
    {
        private final color fillColor = color(0, 0, 255);
    }
}