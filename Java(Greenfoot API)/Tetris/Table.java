import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)


public class Table extends World
{
    /**
     * Main Tetris functions - all here
     * 
     */
    Core[] Cores = new Core[5];
    Core[] NextCores = new Core[5];
    Core[][] Map = new Core[10][20];
    boolean IsActorAlive = false;
    int NextActor;
    boolean CanMove = true;
    boolean end = false;
    double Boost = 0;
    int timer = 0;
    int Rotation;
    int CurActor;
    int Difficulty = 27;
    int Score = 0;
    long MoveCdown = 0;
    long CurTime;
    String debug = "";
    public Table()
    {    
        // 
        super(20, 20, 35); 
        NextActor = Greenfoot.getRandomNumber(7);
        addObject(new Border(), 15,10);
    }
    
    public void act() 
    {
    if (end != true) {
        if (!IsActorAlive) {
           NewActors(); 
           NextActor = Greenfoot.getRandomNumber(7);
           DrawNext();
           CanMove = true;
        }
        CurTime = System.currentTimeMillis();
        
        showText("Сложность игры: "+(28-Difficulty), 13, 5);
        showText("Ваш счет: "+Score, 12, 6);
        showText("Следующая фигура:", 13, 8);

        if (MoveCheck() == false) {
            CanMove = false;
        }
        if (timer > Difficulty*1.2-(Boost*1.2)) {
            if (CanMove) {
               for (int i = 1; i < 5; i++) {
                   Cores[i].DoMove();
               }   
            } else {
               IsActorAlive = false;
               for (int i = 1; i < 5; i++) {
                   Map[Cores[i].getX()][Cores[i].getY()] = Cores[i];
               }  
            }
            timer = 0;
        }
        
        if (MoveCdown < CurTime && IsActorAlive == true && CanMove == true) {
            CheckKeys();
        }
        
        CheckMap();
        showText(debug, 5, 8);
        timer = timer + 1;
        
        
        
    } else {
        addObject(new end(), 10,9);
        showText(null, 13, 5);
        showText(null, 12, 6);
        showText(null, 13, 8);
        showText("Игра окончена! Ваш счет: "+Score, 10, 12);
        Greenfoot.stop();
    }
    }   
    
    public void NewActors() { // New Figure
        IsActorAlive = true;
        Cores[1] = new Core();
        Cores[2] = new Core();
        Cores[3] = new Core();
        Cores[4] = new Core();
        Rotation = 1;
        CurActor = NextActor;
        
        for (int i = 1; i<5; i++) {
            removeObject(NextCores[i]);
        }
        
        switch ( NextActor ) {
            case 0: // Pyramide
                addObject(Cores[1], 4,0);
                addObject(Cores[2], 5,0);
                addObject(Cores[3], 6,0);
                addObject(Cores[4], 5,1);
                
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(240+Greenfoot.getRandomNumber(15),0+Greenfoot.getRandomNumber(40),0+Greenfoot.getRandomNumber(30),180) );
                    Cores[i].getImage().fill();
                }
                
                
            break;
            case 1: // Brench
                addObject(Cores[1], 5,0); 
                addObject(Cores[2], 5,1);
                addObject(Cores[3], 5,2);
                addObject(Cores[4], 5,3);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(199+Greenfoot.getRandomNumber(50), 21+Greenfoot.getRandomNumber(50), 133+Greenfoot.getRandomNumber(50),180) );
                    Cores[i].getImage().fill();
                }
            break;
            case 2: // Z
                addObject(Cores[1], 4,0);
                addObject(Cores[2], 5,0);
                addObject(Cores[3], 5,1);
                addObject(Cores[4], 6,1);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(107+Greenfoot.getRandomNumber(50), 230+Greenfoot.getRandomNumber(15), 192+Greenfoot.getRandomNumber(25),180) );
                    Cores[i].getImage().fill();
                }
            break;
            case 3: // Cube
                addObject(Cores[1], 5,0);
                addObject(Cores[2], 6,0);
                addObject(Cores[3], 5,1);
                addObject(Cores[4], 6,1);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(0+Greenfoot.getRandomNumber(50), 0+Greenfoot.getRandomNumber(50), 255,180) );
                    Cores[i].getImage().fill();
                }
            break;
            case 4: // Г 
                addObject(Cores[1], 4,0);
                addObject(Cores[2], 5,0);
                addObject(Cores[3], 6,0);
                addObject(Cores[4], 6,1);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(124+Greenfoot.getRandomNumber(50), 252, 0+Greenfoot.getRandomNumber(50),180) );
                    Cores[i].getImage().fill();
                }
            break;
            case 5: // reversed Z
                addObject(Cores[1], 6,0);
                addObject(Cores[2], 5,0);
                addObject(Cores[3], 5,1);
                addObject(Cores[4], 4,1);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(245+Greenfoot.getRandomNumber(10), 165+Greenfoot.getRandomNumber(50), 0+Greenfoot.getRandomNumber(25),180) );
                    Cores[i].getImage().fill();
                }
            break;
            case 6: // reversed Г 
                addObject(Cores[1], 6,0);
                addObject(Cores[2], 5,0);
                addObject(Cores[3], 4,0);
                addObject(Cores[4], 4,1);
                for (int i = 1; i<5; i++) {
                    Cores[i].getImage().setColor( new Color(220+Greenfoot.getRandomNumber(20), 20+Greenfoot.getRandomNumber(10), 60+Greenfoot.getRandomNumber(10), 180) );
                    Cores[i].getImage().fill();
                }
            break;
        } 
    }
    
    
    
    public boolean MoveCheck() {
        boolean checker = true;
        for (int i = 1; i<5; i++) {
            if (Cores[i].getY()+1 >= 20 || Map[Cores[i].getX()][Cores[i].getY()+1] != null) {
                checker = false;
            }
        }
        return checker;
    }
    
    public void CheckKeys() {
        boolean CanMove = true;
        MoveCdown = CurTime + 150;
        if (Greenfoot.isKeyDown("down")) {
            Boost = Difficulty/1.2; 
        } else {
            Boost = 0;   
        }
        
        if (Greenfoot.isKeyDown("up")) {
            DoRotation();
        }
        
        if (Greenfoot.isKeyDown("right")) {
            
            boolean CanTurn = true;
            for (int i = 1; i<5; i++) {
                if (Cores[i].getX() == 9) { 
                    CanTurn = false;
                } else if (Map[Cores[i].getX()+1][Cores[i].getY()] != null) {
                    CanTurn = false;
                }
            }
            if (CanTurn == true) {
                for (int i = 1; i<5; i++) {
                    Cores[i].setLocation(Cores[i].getX()+1, Cores[i].getY());
                }
            }

        }
        if (Greenfoot.isKeyDown("left")) {
            boolean CanTurn = true;
            for (int i = 1; i<5; i++) {
                if (Cores[i].getX() == 0) {
                    CanTurn = false;
                } else if (Map[Cores[i].getX()-1][Cores[i].getY()] != null) {
                    CanTurn = false;
                }
            }
            if (CanTurn == true) {
                for (int i = 1; i<5; i++) {
                    Cores[i].setLocation(Cores[i].getX()-1, Cores[i].getY());
                }
            }
        }
    }
    
    public void CheckMap() {
        for (int j = 0; j<20; j++) {
            boolean isLine = true;
            for (int i = 0; i < 10; i++) { 
                if (Map[i][j] == null) isLine = false;
            }
            if (isLine == true) {
                for (int i = 0; i < 10; i++) { 
                    removeObject(Map[i][j]);
                    Map[i][j] = null;
                    
                }
                Score++;
                Difficulty = Difficulty - 1;
                Greenfoot.delay(11);
                for (int k = j-1; k >= 0; k=k-1) {
                    for (int i = 0; i < 10; i++) { 
                       if (Map[i][k] != null) {
                           Map[i][k].setLocation(i,k+1);
                       }
                        Map[i][k+1] = Map[i][k];
                        Map[i][k] = null;
                    }       
                }
            }
        } 
        for (int i = 0; i <= 9; i++) {
            if (Map[i][0] != null) {
                end = true;
            }
        }
    }
    
    public void DoRotation() {
        
        switch(CurActor) {
            case 0:
                switch(Rotation) {
                    case 1:
                        if (Cores[2].getY()-1 >= 0) {
                            if (Map[Cores[2].getX()][Cores[2].getY()-1] == null) {
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY()-1);
                                Cores[4].setLocation(Cores[4].getX()-1, Cores[4].getY()-1);
                                Cores[3].setLocation(Cores[3].getX()-1, Cores[3].getY()+1);
                                Rotation = 2;
                            }
                        }
                    
                    break;
                    case 2:
                        if (Cores[2].getX()+1 <= 9) {
                            if (Map[Cores[2].getX()+1][Cores[2].getY()] == null) {
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY()+1);
                                Cores[4].setLocation(Cores[4].getX()+1, Cores[4].getY()-1);
                                Cores[3].setLocation(Cores[3].getX()-1, Cores[3].getY()-1);
                                Rotation = 3;
                            }
                        }
                    break;
                    case 3:
                        if (Cores[2].getY()+1 <= 19) {
                            if (Map[Cores[2].getX()][Cores[2].getY()+1] == null) {
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY()+1);
                                Cores[4].setLocation(Cores[4].getX()+1, Cores[4].getY()+1);
                                Cores[3].setLocation(Cores[3].getX()+1, Cores[3].getY()-1);
                                Rotation = 4;
                            }
                        }
                    break;
                    case 4:
                        if (Cores[2].getX()-1 >= 0) {
                            if (Map[Cores[2].getX()-1][Cores[2].getY()] == null) {
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY()-1);
                                Cores[4].setLocation(Cores[4].getX()-1, Cores[4].getY()+1);
                                Cores[3].setLocation(Cores[3].getX()+1, Cores[3].getY()+1);
                                Rotation = 1;
                            }
                        }
                    break;
                }
            break;
            case 1:
                switch(Rotation) {
                    case 1:
                        if (Cores[3].getX()+2 <= 9 && Cores[3].getX()-1 >= 0) {
                            if (Map[Cores[3].getX()+1][Cores[3].getY()] == null && Map[Cores[3].getX()+2][Cores[3].getY()] == null && Map[Cores[3].getX()-1][Cores[3].getY()] == null) {
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY()+2);
                                Cores[2].setLocation(Cores[2].getX()+1, Cores[2].getY()+1);
                                Cores[4].setLocation(Cores[4].getX()+2, Cores[4].getY()-1);
                                Rotation = 2;
                            }
                        }
                    break;
                    case 2:
                        if (Cores[3].getY()-2 >=0 && Cores[3].getY()+1 <= 19) {
                            if (Map[Cores[3].getX()+1][Cores[3].getY()] == null && Map[Cores[3].getX()+2][Cores[3].getY()] == null && Map[Cores[3].getX()-1][Cores[3].getY()] == null) {
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY()-2);
                                Cores[2].setLocation(Cores[2].getX()-1, Cores[2].getY()-1);
                                Cores[4].setLocation(Cores[4].getX()-2, Cores[4].getY()+1);
                                Rotation = 1;
                            }
                        }
                    break;
                    
                    
                }
            break;
            case 2:
                switch(Rotation) {
                    case 1:
                        if (Cores[2].getY()-1 >= 0) {
                            if (Map[Cores[3].getX()][Cores[3].getY()-2] == null && Map[Cores[4].getX()-2][Cores[4].getY()] == null) {
                                Cores[3].setLocation(Cores[3].getX(), Cores[3].getY()-2);
                                Cores[4].setLocation(Cores[4].getX()-2, Cores[4].getY());
                                Rotation = 2;
                            }
                        }
                    break;
                    case 2:
                        if (Cores[2].getX()+1 <= 9) {
                            if (Map[Cores[3].getX()][Cores[3].getY()+2] == null && Map[Cores[4].getX()+2][Cores[4].getY()] == null) {
                                Cores[3].setLocation(Cores[3].getX(), Cores[3].getY()+2);
                                Cores[4].setLocation(Cores[4].getX()+2, Cores[4].getY());
                                Rotation = 1;
                            }
                        }
                    break;
                    
                    
                }
            break;
            case 4:
                switch(Rotation) {
                    case 1:
                        if (Cores[3].getY()-1 >= 0) {
                            if (Map[Cores[2].getX()][Cores[2].getY()+1] == null && Map[Cores[1].getX()+2][Cores[1].getY()-1] == null) {
                                Cores[1].setLocation(Cores[1].getX()+2, Cores[1].getY()-1);
                                Cores[2].setLocation(Cores[2].getX(), Cores[2].getY()+1);
                                Rotation = 2;
                            }
                        }
                    break;
                    case 2:
                        if (Cores[2].getX()-1 >= 0) {
                            if (Map[Cores[3].getX()-2][Cores[3].getY()+1] == null && Map[Cores[1].getX()-2][Cores[1].getY()+1] == null) {
                                Cores[3].setLocation(Cores[3].getX()-2, Cores[3].getY()+1);
                                Cores[1].setLocation(Cores[1].getX()-2, Cores[1].getY()+1);
                                Rotation = 3;
                            }
                        }
                    break;
                    case 3:
                        if (Cores[1].getY()-1 >= 0) {
                            if (Map[Cores[2].getX()][Cores[2].getY()-2] == null && Map[Cores[4].getX()][Cores[4].getY()-2] == null && Map[Cores[3].getX()+1][Cores[3].getY()] == null && Map[Cores[1].getX()+1][Cores[1].getY()] == null) {
                                Cores[2].setLocation(Cores[2].getX(), Cores[2].getY()-2);
                                Cores[4].setLocation(Cores[4].getX(), Cores[4].getY()-2);
                                
                                Cores[3].setLocation(Cores[3].getX()+1, Cores[3].getY());
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY());
                                Rotation = 4;
                            }
                        }
                    break;
                    case 4:
                        if (Cores[2].getX()-1 >= 0) {
                            if (Map[Cores[3].getX()+1][Cores[3].getY()-1] == null && Map[Cores[4].getX()][Cores[4].getY()+2] == null && Map[Cores[1].getX()-1][Cores[1].getY()] == null && Map[Cores[2].getX()][Cores[2].getY()+1] == null) {
                                Cores[3].setLocation(Cores[3].getX()+1, Cores[3].getY()-1);
                                Cores[4].setLocation(Cores[4].getX(), Cores[4].getY()+2);
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY());
                                
                                Cores[2].setLocation(Cores[2].getX(), Cores[2].getY()+1);
                                Rotation = 1;
                            }
                        }
                    break;
                }
            break;
            case 5:
                switch(Rotation) {
                    case 1:
                        if (Cores[3].getY()+1 <= 19) {
                            if (Map[Cores[1].getX()-2][Cores[1].getY()] == null && Map[Cores[2].getX()][Cores[2].getY()+2] == null) {
                                Cores[1].setLocation(Cores[1].getX()-2, Cores[1].getY());
                                Cores[2].setLocation(Cores[2].getX(), Cores[2].getY()+2);
                                Rotation = 2;
                            }
                        }
                    break;
                    case 2:
                        if (Cores[3].getX()+1 <= 9) {
                            if (Map[Cores[1].getX()+2][Cores[1].getY()] == null && Map[Cores[2].getX()][Cores[2].getY()-2] == null) {
                                Cores[1].setLocation(Cores[1].getX()+2, Cores[1].getY());
                                Cores[2].setLocation(Cores[2].getX(), Cores[2].getY()-2);
                                Rotation = 1;
                            }
                        }
                    break;
                    
                    
                }
            break;
            case 6:
                switch(Rotation) {
                    case 1:
                        if (Cores[2].getY()+2 <= 19 ) {
                            if (Map[Cores[1].getX()-1][Cores[1].getY()+2] == null && Map[Cores[4].getX()+1][Cores[4].getY()] == null) {
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY()+2);
                                Cores[4].setLocation(Cores[4].getX()+1, Cores[4].getY());
                                Rotation = 2;
                            }
                        }
                    break;
                    case 2:
                        if (Cores[2].getX()+1 <= 9 && Cores[2].getY()-1 >= 0) {
                            if (Map[Cores[4].getX()+1][Cores[4].getY()-1] == null && Map[Cores[1].getX()+1][Cores[1].getY()-3] == null) {
                                Cores[4].setLocation(Cores[4].getX()+1, Cores[4].getY()-1);
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY()-3);
                                Rotation = 3;
                            }
                        }
                    break;
                    case 3:
                        if (Cores[1].getY()+1 <= 19) {
                            if (Map[Cores[1].getX()-1][Cores[1].getY()+2] == null && Map[Cores[4].getX()][Cores[4].getY()+1] == null && Map[Cores[3].getX()+1][Cores[3].getY()-1] == null) {
                                Cores[1].setLocation(Cores[1].getX()-1, Cores[1].getY()+2);
                                Cores[4].setLocation(Cores[4].getX(), Cores[4].getY()+1);
                                Cores[3].setLocation(Cores[3].getX()+1, Cores[3].getY()-1);
                                
                                Rotation = 4;
                            }
                        }
                    break;
                    case 4:
                        if (Cores[2].getX()-1 >= 0) {
                            if (Map[Cores[3].getX()-1][Cores[3].getY()+1] == null && Map[Cores[4].getX()-2][Cores[4].getY()] == null && Map[Cores[1].getX()+1][Cores[1].getY()-1] == null) {
                                Cores[3].setLocation(Cores[3].getX()-1, Cores[3].getY()+1);
                                Cores[4].setLocation(Cores[4].getX()-2, Cores[4].getY());
                                Cores[1].setLocation(Cores[1].getX()+1, Cores[1].getY()-1);
                                Rotation = 1;
                            }
                        }
                    break;
                }
            break;
        }
        
        
    }
    
    public void DrawNext() {
        NextCores[1] = new Core();
        NextCores[2] = new Core();
        NextCores[3] = new Core();
        NextCores[4] = new Core();
        switch (NextActor) {
            case 0: // Пирамида
                addObject(NextCores[1], 14,10);
                addObject(NextCores[2], 15,10);
                addObject(NextCores[3], 16,10);
                addObject(NextCores[4], 15,11);
                
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(255,0+Greenfoot.getRandomNumber(50),0+Greenfoot.getRandomNumber(50),180) );
                    NextCores[i].getImage().fill();
                }
                
                
            break;
            case 1: // Палка
                addObject(NextCores[1], 15,10); 
                addObject(NextCores[2], 15,11);
                addObject(NextCores[3], 15,12);
                addObject(NextCores[4], 15,13);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(199+Greenfoot.getRandomNumber(50), 21+Greenfoot.getRandomNumber(50), 133+Greenfoot.getRandomNumber(50),180) );
                    NextCores[i].getImage().fill();
                }
            break;
            case 2: // Зига
                addObject(NextCores[1], 14,10);
                addObject(NextCores[2], 15,10);
                addObject(NextCores[3], 15,11);
                addObject(NextCores[4], 16,11);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(107+Greenfoot.getRandomNumber(50), 235, 192+Greenfoot.getRandomNumber(25),180) );
                    NextCores[i].getImage().fill();
                }
            break;
            case 3: // Куб
                addObject(NextCores[1], 15,10);
                addObject(NextCores[2], 16,10);
                addObject(NextCores[3], 15,11);
                addObject(NextCores[4], 16,11);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(0+Greenfoot.getRandomNumber(50), 0+Greenfoot.getRandomNumber(50), 255,180) );
                    NextCores[i].getImage().fill();
                }
            break;
            case 4: // Г 
                addObject(NextCores[1], 14,10);
                addObject(NextCores[2], 15,10);
                addObject(NextCores[3], 16,10);
                addObject(NextCores[4], 16,11);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(124+Greenfoot.getRandomNumber(50), 252, 0+Greenfoot.getRandomNumber(50),180) );
                    NextCores[i].getImage().fill();
                }
            break;
            case 5: // ОБРАТНАЯ зига
                addObject(NextCores[1], 16,10);
                addObject(NextCores[2], 15,10);
                addObject(NextCores[3], 15,11);
                addObject(NextCores[4], 14,11);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(245+Greenfoot.getRandomNumber(10), 165+Greenfoot.getRandomNumber(50), 0+Greenfoot.getRandomNumber(25),180) );
                    NextCores[i].getImage().fill();
                }
            break;
            case 6: // ОБРАТНАЯ Г 
                addObject(NextCores[1], 16,10);
                addObject(NextCores[2], 15,10);
                addObject(NextCores[3], 14,10);
                addObject(NextCores[4], 14,11);
                for (int i = 1; i<5; i++) {
                    NextCores[i].getImage().setColor( new Color(220+Greenfoot.getRandomNumber(20), 20+Greenfoot.getRandomNumber(10), 60+Greenfoot.getRandomNumber(10), 180) );
                    NextCores[i].getImage().fill();
                }
            break;
        }
    }
        
        
}
