class Player 
{
    int xpos;
    int ypos;
    color paddlecolour = color(50);
    
    Player(int screen_y)
    {
        xpos=SCREENX/2;
        ypos=screen_y;
    }
    
    void move(int x)
    {
        if(x > SCREENX-PLAYERWIDTH)
        {
          xpos = SCREENX-PLAYERWIDTH;
        }
        else 
        {
          xpos=x;
        }
    }
    
    void draw()
    {
    fill(paddlecolour);
    rect(xpos, ypos, PLAYERWIDTH, PLAYERHEIGHT);
    }
}
