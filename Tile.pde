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

    public boolean isSelected()
    {
        return selected;
    }

    public void setSelected(Boolean selected)
    {
        this.selected = selected;
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

        protected color getColor(Color type)
        {
            switch(type)
            {
                case FILL:
                    return fillColor;
                case FILL_SELECTED:
                    return fillColorSelected;
                case STROKE:
                    return strokeColor;
                case STROKE_SELECTED:
                    return strokeColorSelected;
                default:
                    return fillColor;
            }
        }

        protected void setColor(Color type, color value)
        {
            switch(type)
            {
                case FILL:
                    fillColor = value;
                    break;
                case FILL_SELECTED:
                    fillColorSelected = value;
                    break;
                case STROKE:
                    strokeColor = value;
                    break;
                case STROKE_SELECTED:
                    strokeColorSelected = value;
                    break;
                default:
                    break;
            }
            return;
        }
    }
}