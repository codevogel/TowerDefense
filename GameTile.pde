class GameTile extends Tile
{
    private Boolean path = false;
    private Tower tower;

    GameTile(Position pos)
    {
        super(pos);
    }

    protected void setPath(boolean _path)
    {
        path = _path;
        return;
    }

    protected void setTower(Tower _tower)
    {
        tower = _tower;
    }

    protected Tower getTower()
    {
        return tower;
    }
}