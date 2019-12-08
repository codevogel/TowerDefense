static class PlayerController
{

    static protected Boolean upDown = false;
    static protected Boolean leftDown = false;
    static protected Boolean downDown = false;
    static protected Boolean rightDown = false;

    static private boolean placeTowerDown = false;
    static private boolean startWaveDown = false;

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

    // For buttons that shouldn't be able to be held down
    static protected void resetSinglePresses()
    {
        placeTowerDown = false;
        startWaveDown = false;
    }

    static protected void setKeyState(char k, boolean down)
    {
        resetSinglePresses();
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
            case 'j':
                if (down)
                {
                    startWaveDown();
                }
                return;
            case 'k':
                if (down)
                {
                    placeTowerDown();
                }
            default:
                return;
        }
    }

    static public boolean getStartWaveDown()
    {
        return startWaveDown;
    }
    
    static public void setStartWaveDown(boolean down)
    {
        startWaveDown = down;
    }

    static private void startWaveDown()
    {
        startWaveDown = true;
    }

    static public boolean getPlaceTowerDown()
    {
        return placeTowerDown;
    }
    
    static public void setPlaceTowerDown(boolean down)
    {
        placeTowerDown = down;
    }

    static private void placeTowerDown()
    {
        placeTowerDown = true;
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
                // if not on top row
                if (selectionMap.getY() != 0)
                {
                    // move selection up
                    selectionMap.setY(selectionMap.getY() - 1);
                }
                else 
                {   
                    // overflow to bottom row of board
                    selectionMap.setY(GRID_SIZE_Y - 1);
                }
            }
            if (leftDown)
            {
                // if not on leftmost row
                if (selectionMap.getX() != 0)
                {
                    // move selection left
                    selectionMap.setX(selectionMap.getX() - 1);
                }
                else 
                {
                    // overflow to rightmost row of board
                    selectionMap.setX(GRID_SIZE_X - 1);
                }
            }
            if (downDown)
            {
                // if not on bottom row
                if (selectionMap.getY() != GRID_SIZE_Y - 1)
                {
                    // move selection down
                    selectionMap.setY(selectionMap.getY() + 1);
                }
                else 
                {
                    // overflow to top row of board
                    selectionMap.setY(0);
                }
            }
            if (rightDown)
            {
                // if not on the rightmost row
                if (selectionMap.getX() != GRID_SIZE_X - 1)
                {
                    // move selection right
                    selectionMap.setX(selectionMap.getX() + 1);
                }
                else 
                {
                    // overflow to left row of board
                    selectionMap.setX(0);
                }          
            }
        }
        else 
        {
            if (upDown)
            {
                // if selection not on top button
                if (selectionMenu != 0)
                {
                    // move selection up
                    selectionMenu -=1;
                }
                else
                {
                    // overflow to the bottom button
                    selectionMenu = GRID_SIZE_Y -1;
                }
            }
            if (leftDown || rightDown)
            {
                // swap back to game grid
                swapSelection();
            }
            if (downDown)
            {
                // if selection not on bottom button
                if (selectionMenu != GRID_SIZE_Y - 1)
                {
                    // move selection down
                    selectionMenu += 1;
                }
                else
                {
                    // overflow to the top button
                    selectionMenu = 0;
                }
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