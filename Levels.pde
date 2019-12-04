// static class Levels
// {
//     final private int NUM_LEVELS = 1;
//     final private int currentLevel = 0;

//     protected Level[] levels;

//     Levels()
//     {
//         initLevels();
//     }

//     protected void initLevels()
//     {
//         levels = new Level[NUM_LEVELS];
//         levels[0] = loadLevel(1);
//     }

//     private Level loadLevel(int levelNo)
//     {
//         if (levelNo == 1)
//         {
//             return readLevelFile("levelOne.level");
//         }
//         return null;
//     }

//     private Level readLevelFile(String filename)
//     {
//         int resultLevelNo = 0;
//         Boolean firstLine = true;
//         String[] lines = loadStrings(filename);
//         ArrayList<Position> waypointsArrayList = new ArrayList<Position>();
//         for (String s : lines)
//         {
//             // Skip comment lines
//             if (s.charAt(0) == '#')
//             {
//                 continue;
//             }
//             // Handle the first line case (level number)
//             if (firstLine)
//             {
//                 firstLine = false;
//                 resultLevelNo = parseFirstLine(s);
//             }
//             // Handle the coordinates
//             else
//             {
//                 waypointsArrayList.add(parseCoordLine(s));
//             }
//         }

//         Position[] waypointsArray = new Position[waypointsArrayList.size()];
//         int index = 0;
//         for (Position p : waypointsArrayList)
//         {
//             waypointsArray[index] = p;
//             index++;
//         }
//         return new Level(resultLevelNo, waypointsArray);
//     }

//     private int parseFirstLine(String line)
//     {
//         String result = "";
//         for (int i = 0; i < line.length(); i++)
//         {
//             char c = line.charAt(i);
//             if (c == ';')
//             {
//                 return int(result);
//             }
//             result += c;
//         }
//         return int(result);
//     }

//     private Position parseCoordLine(String line)
//     {
//         StringBuilder parsedLine = new StringBuilder("");
//         int posX = 0;
//         int posY = 0;
//         for (int i = 0; i < line.length(); i++)
//         {
//             char c = line.charAt(i);
//             if (c == ',')
//             {
//                 String toParse = parsedLine.toString();
//                 posX = Integer.parseInt(toParse);
//                 parsedLine = new StringBuilder("");
//             }
//             else if (c == ' ')
//             {
//                 continue;
//             }
//             else if (c == ';')
//             {
//                 String toParse = parsedLine.toString();
//                 posY = Integer.parseInt(toParse);
//                 return new Position(posX, posY);
//             }
//             else {
//                 parsedLine.append(c);
//             }
//         }
//         return null;
//     }
// }