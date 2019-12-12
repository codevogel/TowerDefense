static class InputTimer
{
    static private int previousKeyPress = 0;
    static private final int FRAMES_BETWEEN_INPUTS = 5;

    /**
     * Tells you whether an input is allowed
     * @param frameNo current frame
     * @return true if input is allowed
               false otherwise
     */
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