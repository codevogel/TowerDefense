class Timer
{
    int previousFrame;

    public ActionTimer(int currentFrame)
    {
        previousFrame = currentFrame;
    }

    public boolean actionAllowed(int currentFrame)
    {
        if (currentFrame - previousFrame > 0)
        {
            return true;
        }
        return false;
    }


}