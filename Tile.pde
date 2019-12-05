class Tile
{
    protected Position pos;
    private final int w = TILE_WIDTH;

    Style style;

    Boolean selected = false;

    Tile(Position _pos)
    {
        pos = _pos;
        style = new Style();
    }

    public Position getPos()
    {
        return pos;
    }

    public void setSelected(Boolean _selected)
    {
        selected = _selected;
    }

    void display()
    {
        stroke(style.strokeColor, style.strokeOpacity);
        fill(style.fillColor, style.opacity);
        rect(pos.getX(), pos.getY(), w, w);
        if (selected)
        {
            stroke(style.strokeColorSelected, style.strokeOpacitySelected);
            fill(style.fillColorSelected, style.opacitySelected);
            rect(pos.getX(), pos.getY(), w, w);            
        }
    }

    class Style
    {
        private color fillColor = 0;
        private color fillColorSelected = color(255,0,0);

        private color strokeColor = 255;
        private color strokeColorSelected = 0;

        private int opacity = 255;
        private int opacitySelected = 125;

        private int strokeOpacity = 50;
        private int strokeOpacitySelected = 255;

        protected color getColor(String type)
        {
            switch(type)
            {
                case "fill":
                    return fillColor;
                case "fillSelected":
                    return fillColorSelected;
                case "stroke":
                    return strokeColor;
                case "strokeSelected":
                    return strokeColorSelected;
                default:
                    return fillColor;
            }
        }

        protected void setColor(String type, color c)
        {
            switch(type)
            {
                case "fill":
                    fillColor = c;
                case "fillSelected":
                    fillColorSelected = c;
                case "stroke":
                    strokeColor = c;
                case "strokeSelected":
                    strokeColorSelected = c;
                default:
                    fillColor = c;
            }
            return;
        }
    }
}