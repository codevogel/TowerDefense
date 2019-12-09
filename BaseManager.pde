static class BaseManager
{
    static private Base base;

    public static Base getBase()
    {
        return base;
    }

    public static void setBase(Base _base)
    {
        base = _base;
    }

    public static void display()
    {
        base.display();
    }
}