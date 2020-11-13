uses GraphABC;
type 
    point = ^Spisok;
    
    Spisok = record
        pred: point;
        predx: integer;
        predy: integer;
        x: integer;
        y: integer;
        next: point;
    end;
    
    

var 
food: Record
  valid: boolean;
  x: integer;
  y: integer;
end;
levels: array [0..30] of integer = (30,30,30,20,20,20,20,20,20,20,20,18,16,14,14,14,14,14,14,14,13,13,13,13,13,13,12,12,12,12,12);
phead,mover,lhead: point; 
score,level,speed : integer;
actkey: char;
game_end,delay,isrightpos : boolean;

procedure addHead(var t:point); // идет по LASThead,а не phead
var b:point;
begin
  new(b);
  b^.x := t^.predx;
  b^.y := t^.predy;
  b^.predx := 100;
  b^.predy := 100;

  t^.next := b;
  b^.pred := t; 
  t := b; 

  

end;


//Обработка нажатий клавиш
procedure KeyPress(pressedkey: char); begin

  if delay <> true then begin
    if (pressedkey='d') and (actkey <> 'a') then
      actkey := 'd'
    else if (pressedkey='a') and (actkey <> 'd') then
      actkey := 'a'
    else if (pressedkey='w') and (actkey <> 's') then
      actkey := 'w'
    else if (pressedkey='s') and (actkey <> 'w') then
      actkey := 's';
    
    delay := true;
  end;

end;  

// Процедура отрисовки, совмещеная с процедурой передвижения змейки.
Procedure Draw();
begin
  Redraw;  
  LockDrawing;
  ClearWindow();
  
  
  DrawRectangle(5, 5, 635, 475);
  
  SetBrushColor(rgb(0,0,0));
 
  

  if food.valid = true then begin
    SetBrushColor(rgb(0,255,0));
    Circle(food.x, food.y, 10);
    SetBrushColor(rgb(0,0,0));
  end;
  
  if speed > Levels[level] then begin
    speed := 0;
    mover := phead;
    while mover <> nil do begin
      
      if mover <> phead then begin
        mover^.predx := mover^.x;
        mover^.predy := mover^.y;
        mover^.x := mover^.pred^.predx;
        mover^.y := mover^.pred^.predy;
      end;
      
      if mover = phead then begin
        mover^.predx := mover^.x; 
        mover^.predy := mover^.y; 
        if (actkey = 'd') then
          mover^.x := mover^.x + 20
        else if (actkey = 's') then
          mover^.y := mover^.y + 20
        else if (actkey = 'a') then
          mover^.x := mover^.x - 20
        else if (actkey = 'w') then
          mover^.y := mover^.y - 20;
      end;
      
      if (mover <> phead) and (mover^.x = phead^.x) and (mover^.y = phead^.y) then begin
        game_end := true;
        break
      end;
      
      delay := false;
      
      Circle(mover^.x, mover^.y, 10);
      mover := mover^.next;
    end; 
   end
   else begin
     mover := phead;
     while mover <> nil do begin
       Circle(mover^.x, mover^.y, 10);
       mover := mover^.next;
     end;
   end;
  
  DrawTextCentered(40, 20, 'Счёт: ');
  DrawTextCentered(75, 20, score);
  
end;

Procedure Checker();
begin
  if (phead^.x > 635) or (phead^.x < 5) or (phead^.y > 475) or (phead^.y < 5) then begin
    game_end := true;
  end;
  
  if food.valid = false then begin
    food.valid := true;
    repeat
      isrightpos := true;
      food.x := round((random(20, 620) div 10)*10);
      if ((food.x div 10) mod 2) <> 0 then begin
        if food.x < 610 then food.x := food.x + 10
        else food.x := food.x - 10;
      end;
      food.y := round((random(20, 460) div 10)*10);
      if ((food.y div 10) mod 2) <> 0 then begin
        if food.y < 450 then food.y := food.y + 10
        else food.y := food.y - 10;
      end;
      mover := phead;
      while mover <> nil do begin
        if (abs(food.x - mover^.x) < 20) or (abs(food.y - mover^.y) < 20) then begin
          isrightpos := false;
        end;
        mover := mover^.next;
      end;
    until (isrightpos = true);
  end;
  
  if food.valid = true then
    if Sqrt(Sqr(food.x - phead^.x) + Sqr(food.y - phead^.y)) < 20 then begin
      food.valid := false;
      score := score + 1;
      addHead(lhead);
      if level < 30 then
        level := level + 1;
    end;
      
  
end;

begin
  food.valid := true;
  food.x := round((random(20, 620) div 10)*10);
  if ((food.x div 10) mod 2) <> 0 then begin
    if food.x < 610 then food.x := food.x + 10
    else food.x := food.x - 10;
  end;
  food.y := round((random(20, 460) div 10)*10);
  if ((food.y div 10) mod 2) <> 0 then begin
    if food.y < 450 then food.y := food.y + 10
    else food.y := food.y - 10;
  end;
  game_end := false;
  actkey := 'd';
  new(phead);
  phead^.x := 100;
  phead^.y := 100;
  phead^.next := nil;
  lhead := phead;
  
  while game_end = false do begin  
      speed := speed + 1;
      Checker();
      OnKeyPress := KeyPress;
      Draw();

  end;
  while game_end = true do begin
    Redraw;  
    LockDrawing;
    ClearWindow();
    DrawTextCentered(250, 200, 'Игра окончена! Ваш счет: ');
    DrawTextCentered(360, 200, score);
  end;
end.