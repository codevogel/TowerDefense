class AutoTimer extends Timer
{
    int previousFrame;

    public AutoTimer(int currentFrame)
    {
        super(currentFrame);
    }

    public boolean actionAllowed(int currentFrame)
    {
        if (currentFrame - previousFrame > 0)
        {
            previousFrame = currentFrame;
            return true;
        }
        return false;
    }
}