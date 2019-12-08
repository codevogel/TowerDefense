// Defines what a Tower is and can do.
class Tower 
{ 
    GameTile parent;

    // Has an x and y position
    Position pos;

    // diameter and radius for the tower itself
    int d;
    int r;

    // Is the tower shooting?
    Boolean shooting;

    // radius for the towers shooting range
    int range;
    // and it's shooting range diameter
    int rangeD;

    // Constructor function for a tower
    Tower(GameTile parent)
    {
        this.parent = parent;
        this.pos = parent.pos;
        d = TILE_WIDTH;
        r = d / 2;
        shooting = false;
        range = d * 3;
        rangeD = range * 2;
    }
}