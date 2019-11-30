static class PlayerController
{

    static protected Boolean upDown = false;
    static protected Boolean leftDown = false;
    static protected Boolean downDown = false;
    static protected Boolean rightDown = false;

    static protected Position selectionMap = new Position(0,0);
    static protected int selectionMeny = 0;

    static protected Boolean selectingMap = true;

    static private char key;

    static protected void setKey(char k)
    {
        key = k;
    }

    static protected void setKeyState(char k, boolean down)
    {
        setKey(k);
        switch(key)
        {
            case 'w':
                if (down)
                {
                    upDown();
                }
                else {
                    upUp();
                }
                return;
            case 'a':
                if (down)
                {
                    leftDown();
                }
                else {
                    leftUp();
                }
                return;
            case 's':
                if (down)
                {
                    downDown();
                }
                else {
                    downUp();
                }
                return;
            case 'd':
                if (down)
                {
                    rightDown();
                }
                else {
                    rightUp();
                }
                return;
            default:
                return;
        }
    }


    static private void upDown()
    {
        upDown = true;
    }

    static private void leftDown()
    {
        leftDown = true;
    }

    static private void downDown()
    {
        downDown = true;
    }
    static private void rightDown()
    {
        rightDown = true;
    }

    static private void upUp()
    {
        upDown = false;
    }

    static private void leftUp()
    {
        leftDown = false;
    }

    static private void downUp()
    {
        downDown = false;
    }
    static private void rightUp()
    {
        rightDown = false;
    }

    static private void setMapSelection()
    {
        if (upDown)
        {
            selectionMap.setY(constrain(selectionMap.getY() - 1, 0, GRID_SIZE_Y - 1));
        }
        if (leftDown)
        {
            selectionMap.setX(constrain(selectionMap.getX() - 1, 0, GRID_SIZE_X - 1));
        }
        if (downDown)
        {
            print("down");
            selectionMap.setY(constrain(selectionMap.getY() + 1, 0, GRID_SIZE_Y - 1));
        }
        if (rightDown)
        {
            selectionMap.setX(constrain(selectionMap.getX() + 1, 0, GRID_SIZE_X - 1));
        }
    }
}