static class Position
{
    private int x, y;

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

    protected void setX(int _x)
    {
        x = _x;
    }

    protected void setY(int _y)
    {
        y = _y;
    }
}