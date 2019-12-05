static class LevelManager
{
    final static private int NUM_LEVELS = 2;
    static private int currentLevelNo = 0;
    static private Level currentLevel;

    final static private Level[] levels = new Level[NUM_LEVELS];

    protected static void initLevels()
    {
        for (int i = 0; i < NUM_LEVELS; i++)
        {
            levels[i] = loadLevel(i + 1);
        }
    }

    public static Level getLevel(int levelIndex)
    {
        return levels[levelIndex];
    }

    public static void setCurrentLevel(int levelNo)
    {
        currentLevelNo = levelNo;
        setCurrentLevel();
    }

    public static void setCurrentLevel()
    {
        currentLevel = levels[currentLevelNo - 1];
    }

    public static Level getCurrentLevel()
    {
        return levels[currentLevelNo - 1];
    }

    private static Level loadLevel(int levelNo)
    {
        if (levelNo == 1)
        {
            return readLevelFile("levelOne.level");
        }
        else if (levelNo == 2)
        {
            return readLevelFile("levelTwo.level");
        }
        return null;
    }

    private static Level readLevelFile(String filename)
    {
        int resultLevelNo = 0;
        Boolean firstLine = true;
        String[] lines = tDInstance.loadStrings(filename);
        ArrayList<Position> waypointsArrayList = new ArrayList<Position>();
        for (String s : lines)
        {
            // Skip comment lines
            if (s.charAt(0) == '#')
            {
                continue;
            }
            // Handle the first line case (level number)
            if (firstLine)
            {
                firstLine = false;
                resultLevelNo = parseFirstLine(s);
            }
            // Handle the coordinates
            else
            {
                waypointsArrayList.add(parseCoordLine(s));
            }
        }

        Position[] waypointsArray = new Position[waypointsArrayList.size()];
        int index = 0;
        for (Position p : waypointsArrayList)
        {
            waypointsArray[index] = p;
            index++;
        }
        return tDInstance.new Level(resultLevelNo, waypointsArray);
    }

    private static int parseFirstLine(String line)
    {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < line.length(); i++)
        {
            char c = line.charAt(i);
            if (c == ';')
            {
                return int(result.toString());
            }
            result.append(c);
        }
        return -1;
    }

    private static Position parseCoordLine(String line)
    {
        StringBuilder parsedLine = new StringBuilder("");
        int posX = 0;
        int posY = 0;
        for (int i = 0; i < line.length(); i++)
        {
            char c = line.charAt(i);
            if (c == ',')
            {
                String toParse = parsedLine.toString();
                posX = Integer.parseInt(toParse);
                parsedLine = new StringBuilder("");
            }
            else if (c == ' ')
            {
                continue;
            }
            else if (c == ';')
            {
                String toParse = parsedLine.toString();
                posY = Integer.parseInt(toParse);
                return new Position(posX, posY);
            }
            else {
                parsedLine.append(c);
            }
        }
        return null;
    }
}