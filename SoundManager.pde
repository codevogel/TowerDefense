static class SoundManager
{

    static private SoundFile[] sounds = new SoundFile[2];

    public static void loadSounds()
    {
        String[] lines = tDInstance.loadStrings("soundsToBeLoaded.cfg");

        final int FIRST_CHAR_INDEX = 0;

        for (String line : lines)
        {
            if (line.charAt(FIRST_CHAR_INDEX) == '#')
            {
                continue;
            }
            StringBuilder buffer = new StringBuilder();
            Boolean readingFileName = true;

            int fileID = -1;
            String filename = "";

            for (int i = 0; i < line.length(); i++)
            {
                char currentChar = line.charAt(i);
                if (readingFileName)
                {
                    if (currentChar == ',')
                    {
                        filename = buffer.toString();
                        buffer = new StringBuilder();
                        readingFileName = false;
                    }
                    else {
                        buffer.append(currentChar);
                    }
                }
                else
                {
                    if (currentChar == ' ')
                    {
                        continue;
                    }
                    if (currentChar == ';')
                    {
                        fileID = int(buffer.toString());
                    }
                    else {
                        buffer.append(currentChar);
                    }
                }
            }
            if (fileID != -1)
            {
                sounds[fileID] = new SoundFile(tDInstance, filename);
            }
        }
    }

    // Calls the corresponding playSound(int) overload method
    public static void playSound(Sounds soundType)
    {
        switch(soundType)
        {
            case LASER:
                int soundID = 0;
                playSound(soundID);
                break;
        }
    }

    // Plays the soundfile belonging to soundID if it's not playing
    public static void playSound(int soundID)
    {
        SoundFile sound = sounds[soundID];
        if (!sound.isPlaying())
        {
            sound.play();
        }
    }
}