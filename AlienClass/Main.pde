final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int SCREENX = 700;
final int SCREENY = 700;
final int PLAYERWIDTH = 50;
final int PLAYERHEIGHT = 15;
final int ALIENWIDTH = 50;
final int ALIENHEIGHT = 50;
final int BARRIERHEIGHT = 60;
final int BARRIERWIDTH = 100;
final int GAP=10;

Alien[] aliens;
ArrayList<Bullet> bullets;
Player player;
int offScreenIndex;
int collideIndex;
boolean[] haspowers;
boolean[][] destroyed;
PImage alienImageMain;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
    aliens = new Alien[10];
    player = new Player(SCREENX - 30);
    bullets = new ArrayList<Bullet>();
    haspowers = new boolean[3];
    offScreenIndex = -1;
    collideIndex = -1;
    alienImageMain = loadImage("invader.gif");
    init_aliens(alienImageMain);

    destroyed = new boolean[10][2];
    for(int i = 0; i < 10; i++)
    {
        destroyed[i][0] = false;
        destroyed[i][1] = false;
    }

    frameRate(30);
}

void mousePressed()
{
    loop();
    bullets.add(new Bullet(player.xpos+PLAYERWIDTH/2, player.ypos-PLAYERHEIGHT/2, 10));
}

void reset()
{
    background(0);

    textSize(64);
    fill(255, 0, 0);
    background(0);
    text("GAME OVER", SCREENX/4, SCREENY/2);
    textSize(30);
    fill(255, 0, 0);
    text("Click anywhere to restart", 173, 400);

    aliens = new Alien[10];
    player = new Player(SCREENX - 30);
    bullets = new ArrayList<Bullet>();
    init_aliens(alienImageMain);

    noLoop();
}

void init_aliens(PImage alienImage){
    int xpos = 40;
    int ypos = 30;
    for(int i = 0; i < aliens.length; i++){
        aliens[i] = new Alien(xpos, ypos, alienImage);
        xpos += 60;
    }
}

void draw()
{
    //Start alien draw
    background(0);
    if (aliens[aliens.length-1].xpos + ALIENWIDTH < SCREENX && aliens[aliens.length-1].direction == A_FORWARD || aliens[0].xpos == 0 && aliens[0].direction == A_FORWARD)
    {
        for(Alien a : aliens)
        {
            a.direction = A_FORWARD;
        }
    } 
    else if (aliens[0].xpos < SCREENX && aliens[0].xpos > 0 && aliens[0].direction == A_BACKWARD || aliens[aliens.length-1].xpos ==  SCREENX - ALIENWIDTH && aliens[aliens.length-1].direction == A_BACKWARD)
    {
        for(Alien a : aliens)
        {
            a.direction = A_BACKWARD;
        }
    } 
    else if (aliens[0].direction != A_DOWN || aliens[aliens.length - 1].direction != A_DOWN)
    {
        for(Alien a : aliens)
        {
            a.direction = A_DOWN;
            a.ysaved = a.ypos;
        }
    }

    int i = 0;
    for(Alien a : aliens)
    {
        if(i%2 == 1) tint(150, 100, 100);
        else tint(100, 100, 150);
        a.move();
        if(a.exploded && !destroyed[i][0])
        {
          destroyed[i][0] = true;
        }
        a.draw();
        if(a.hasBomb && a.bombObject != null)
        {
            

            if(!a.bombObject.collide(player) && !destroyed[i][1])
            {
                a.bombObject.move();
                a.bombObject.draw();

                if(a.bombObject.ypos > SCREENY)
                {
                    a.hasBomb = false;
                    a.bombObject = null;
                }
            }
            else if(!destroyed[i][1])
            {
                reset();
                return;
            }
        }
        i++;
    }
    //End alien draw

    //Draw bullets
    for(Bullet bullet : bullets)
    {
        if(!bullet.collide(aliens))
        {
            if(bullet.ypos <= 0-BULLETHEIGHT)
            {
                offScreenIndex = bullets.indexOf(bullet);
            }
            if(!haspowers[0] && !haspowers[1] && !haspowers[2])
            {
                bullet.move();
                bullet.draw();
            }
            else
            {
                if (haspowers[0])
                {
                    bullet.moveRandom();
                    bullet.draw();
                }
                else if (haspowers[1])
                {
                    bullet.moveBall();
                    bullet.draw();
                }
                else if (haspowers[2])
                {
                    bullet.yvel = 40;
                    bullet.move();
                    bullet.draw();
                }
            }
        }
    }

    if(offScreenIndex != -1)
    {
        bullets.remove(offScreenIndex);
        offScreenIndex = -1;
    }
    //End drawing bullets

    //Draw player
    player.move(mouseX);
    player.draw();
    //End drawing player
}
