class Waypoint
{
    Position pos;
    Boolean horizontal;
    Boolean moveForwards;

    Waypoint(Position currentPos, Position nextPos)
    {
        pos = nextPos;
        horizontal = currentPos.getY() == nextPos.getY();
        if (horizontal)
        {
            moveForwards = currentPos.getX() <= nextPos.getX();
        }
        else 
        {
            moveForwards = currentPos.getY() <= nextPos.getY();
        }
    }

    public Boolean isHorizontal()
    {
        return horizontal;
    }

    public Boolean isForward()
    {
        return moveForwards;
    }
}