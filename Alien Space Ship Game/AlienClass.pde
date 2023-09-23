 class Alien {
    
    int xpos;
    int ypos;
    int ysaved;
    int vel;
    int direction;
    boolean exploded;
    boolean reachedHeight;
    int explodeRender;
    boolean hasBomb;
    Bomb bombObject;
    PImage alienImage;

    Alien(int xpos, int ypos, PImage alienImage)
    {
        this.xpos = xpos;
        this.ypos = ypos;
        this.alienImage = alienImage;
        direction = A_FORWARD;
        exploded = false;
        vel = 2;
        hasBomb = false;
        imageMode(CORNER);
    }

    void explode()
    {
        exploded = true;    
    }
    
    void move()
    {
        if(direction == A_DOWN)
        {
            if(ypos - ysaved < ALIENHEIGHT) 
            {
                ypos += vel;
            }
            else if(xpos <= SCREENX /2)
            {
                direction = A_FORWARD;
            }
            else if(xpos >= SCREENX /2)
            {
                 direction = A_BACKWARD;
            }
        }

        else if(direction == A_FORWARD)
        {
            xpos += vel;
            if(xpos >= (SCREENX - ALIENWIDTH))
            {
                direction = A_DOWN;
                ysaved = ypos;
            }
        }
        else if(direction == A_BACKWARD)
        {
             xpos -= vel;
             if(xpos <= 0)
            {
                direction = A_DOWN;
                ysaved = ypos;
            }
        }
    }

    PImage explosionImage;
    long explosionStartTime;
    int explosionDuration = 2000;
    
    void draw()
    {
        if(!exploded)
        {
            image(alienImage, xpos, ypos, ALIENWIDTH, ALIENHEIGHT);
            if(!hasBomb)
            {
                if((int)random(500) == 1)
                {
                    bombObject = new Bomb(xpos, ypos);
                    hasBomb = true;
                }
            }
        }
        else 
        {
          if (millis() - explosionStartTime < explosionDuration)
          {
            image(explosionImage, xpos, ypos, ALIENWIDTH, ALIENHEIGHT);
          }
          else
          {
            exploded = true;
            alienDestroyed();
          }
    }
     if (numAliens == 0 && youWin) {
    youWin = true;
    background(0); // Optional: Clear the screen or set a background color
    textSize(32);
    fill(255, 0, 0); // Set text color to red
    text("You Win!", width/2 - 80, height/2);
}
    }

int numAliens = 10; // Set the initial number of aliens
boolean youWin = false;


// Call this function to decrement the number of aliens when one is destroyed
void alienDestroyed() 
{
  if (numAliens > 0) {
    numAliens--;
  }
  
  if (numAliens == 0 && youWin)
  {
    youWin = true;
  }
}

     void startExplosion() 
     {
         exploded = true;
         alienDestroyed();
         explosionImage = loadImage("exploding.GIF");
         explosionStartTime = millis();
     }
}
