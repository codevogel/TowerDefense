class GameTile extends Tile
{
    private boolean path = false;
    private Tower tower;

    GameTile(Position pos)
    {
        super(pos);
    }

    public boolean isPath()
    {
        return path;
    }

    public boolean hasTower()
    {
        return tower != null;
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