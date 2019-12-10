// Manages the base object
static class BaseManager
{
    static private Base base;

    /**
     * @return the base the BaseManager is managing
     */
    public static Base getBase()
    {
        return base;
    }

    /**
     * Sets the base the BaseManager is managing
     * @param _base the base to manage
     */
    public static void setBase(Base _base)
    {
        base = _base;
    }

    /**
     * Display the base the BaseManager is managing.
     */
    public static void display()
    {
        base.display();
    }
}