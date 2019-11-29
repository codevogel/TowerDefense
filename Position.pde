static class Position
{
    int x, y;

    Position(int _x, int _y)
    {
        x = _x;
        y = _y;
    }

    protected int getX()
    {
        return x;
    }

    protected int getY()
    {
        return y;
    }
}