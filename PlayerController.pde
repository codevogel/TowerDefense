static class PlayerController
{

    static protected Boolean upDown = false;
    static protected Boolean leftDown = false;
    static protected Boolean downDown = false;
    static protected Boolean rightDown = false;

    static protected Position selectionMap = new Position(7,4);
    static protected int selectionMenu = 0;

    static protected Boolean selectingMap = true;

    static private char key;

    static public void setSelectionMenu(int y)
    {
        selectionMenu = y;
    }

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

    static private void swapSelection()
    {
        if (selectingMap)
        {
            selectingMap = false;
        }
        else 
        {
            selectingMap = true;
        }
        return;
    }

    static private void setSelection()
    {
        if (selectingMap)
        {
            if (upDown)
            {
                if (selectionMap.getY() == 0)
                {
                    selectionMap.setY(GRID_SIZE_Y - 1);
                }
                else 
                {   
                    selectionMap.setY(constrain(selectionMap.getY() - 1, 0, GRID_SIZE_Y - 1));
                }
            }
            if (leftDown)
            {
                if (selectionMap.getX() == 0)
                {
                    selectionMap.setX(GRID_SIZE_X - 1);
                }
                else 
                {
                    selectionMap.setX(constrain(selectionMap.getX() - 1, 0, GRID_SIZE_X - 1));
                }
            }
            if (downDown)
            {
                if (selectionMap.getY() == GRID_SIZE_Y - 1)
                {
                    selectionMap.setY(0);
                }
                else 
                {
                    selectionMap.setY(constrain(selectionMap.getY() + 1, 0, GRID_SIZE_Y - 1));
                }
            }
            if (rightDown)
            {
                if (selectionMap.getX() == GRID_SIZE_X - 1)
                {
                    selectionMap.setX(0);
                }
                else 
                {
                    selectionMap.setX(constrain(selectionMap.getX() + 1, 0, GRID_SIZE_X - 1));
                }          
            }
        }
        else 
        {
            if (upDown)
            {
                selectionMenu = constrain(selectionMenu - 1, 0, GRID_SIZE_Y - 1);
            }
            if (leftDown || rightDown)
            {
                // swap back to game grid
                swapSelection();
            }
            if (downDown)
            {
                selectionMenu = constrain(selectionMenu + 1, 0, GRID_SIZE_Y - 1);
            }
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

    
}