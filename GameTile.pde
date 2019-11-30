class GameTile extends Tile
{
    Boolean path = false;

    GameTile(Position pos)
    {
        super(pos);
    }

    protected void setPath(boolean _path)
    {
        path = _path;
        return;
    }
}