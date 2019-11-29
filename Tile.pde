class Tile
{
    Position pos;
    int w;

    Style style;

    Boolean selected;

    Tile(Position _pos)
    {
        pos = _pos;
        w = TILE_WIDTH;
        style = new Style();
    }

    void display()
    {
        fill(style.fillColor);
        rect(pos.getX(), pos.getY(), w, w);
    }

    class Style
    {
        private color fillColor = 255;
        private color fillColorSelected = color(255,0,0);

        private color strokeColor = 255;
        private color strokeColorSelected = 0;

        private final int opacity = 255;
        private final int opacitySelected = 125;

        protected void applyStyle(Boolean selected)
        {
            if (selected)
            {
                stroke(strokeColor);
                fill(fillColor, opacity);
            }
        }

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