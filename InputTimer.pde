static class InputTimer
{
    static private int previousKeyPress = 0;
    static private final int FRAMES_BETWEEN_INPUTS = 5;

    static public Boolean inputAllowed(int frameNo)
    {
        if (frameNo - previousKeyPress > FRAMES_BETWEEN_INPUTS)
        {
            previousKeyPress = frameNo;
            return true;
        }
        return false;
    }
}