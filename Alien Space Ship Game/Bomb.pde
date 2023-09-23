class Bomb
{
    float xpos;
    float ypos;

    Bomb(float xpos, float ypos)
    {
        this.xpos = xpos;
        this.ypos = ypos;
    }

    boolean collide(Player player)
    {
        if(player.ypos + PLAYERHEIGHT >= ypos
            && player.ypos <= ypos
            && player.xpos <= xpos && player.xpos + PLAYERWIDTH >= xpos)
            {
                return true;
            }
            return false;
    }

    void move()
    {
        ypos += 10;
    }

    void draw()
    {
        fill(255, 0, 0);
        ellipse(xpos, ypos, 20, 20);
    }
}
