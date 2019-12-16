class AutoTimer
{
    private int nextActivationFrame = 0;
    private int actionDuration; 

    public AutoTimer(int actionDuration)
    {
        this.actionDuration = actionDuration;
    }

    public boolean actionAllowed()
    {
        int currentFrame = FrameCounter.getCurrentFrame();
        if (currentFrame - nextActivationFrame > 0)
        {
            nextActivationFrame = currentFrame + actionDuration;
            return true;
        }
        return false;
    }
}