static class FrameCounter
{
    private int currentFrame = 0;

    public static void setCurrentFrame(int frameCount)
    {   
        currentFrame = frameCount;
    }

    public static int getCurrentFrame()
    {
        return currentFrame;
    }
}