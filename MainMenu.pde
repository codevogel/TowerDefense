// static class MainMenu
// {
//     private StartMenu startMenu;

    
//     protected StartButton startButton = new StartButton();

//     void display()
//     {
//         background(0);
//         startButton.display();
//     }

//     Boolean checkForStart()
//     {
//         return startButton.isPressed();
//     } 

//     class StartButton
//     {
//         private final int w = SIZE_X / 8;
//         private final int w_half = w / 2;
//         private final int h = SIZE_Y / 6;
//         private final int h_half = h / 2;
//         private final Position pos = new Position(SIZE_X / 2, SIZE_Y / 2);

//         void display()
//         {
//             rect(pos.x, pos.y, w, h);
//         }

//         Boolean isPressed()
//         {
//             if (mouseX >= pos.x - w_half && mouseX <= pos.x + w_half)
//             {
//                 if (mouseY >= pos.y - w_half && mouseY <= pos.y + h_half)
//                 {
//                     return true;
//                 }
//             }
//             return false;
//         }
//     }
// }