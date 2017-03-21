With Ada.Integer_Text_IO, Ada.Text_IO, Ada.Calendar;
Use Ada.Integer_Text_IO, Ada.Text_IO, Ada.Calendar;

procedure Main is

   protected type Resource is
      entry Seize;
      procedure Release;
   private
      Busy : Boolean := False;
   end Resource;
   protected body Resource is
      entry Seize when not Busy is
      begin
         Busy := True;
      end Seize;
      procedure Release is
      begin
         Busy := False;
      end Release;
   end Resource;

   canal : array(1..6) of Integer;
   vetorResource : array(1..6) of Resource;

   task type versionA;
   task type versionB;
   task type versionC;
   task type driver;

   function send(buf : in Integer; indice : in Integer) return Integer is
   begin
      canal(indice):=buf;
      vetorResource(indice).Release;
      return 0;
   end send;

   function receive(indice : in Integer) return Integer is
   begin
      vetorResource(indice).Seize;
      return canal(indice);
   end receive;


   task body versionA is
      sendA: Integer;
      status : Integer;
      buffer: Integer := 20;
   begin
      delay 1.0;
      Put_Line("Created version a.");
      sendA := send(buffer, 1);
      status := receive(4);
      if status = 0 then
         Put_Line("voto errado version 1");
      else
         Put_Line("version 1 em execucao");
         while True loop
            null;
         end loop;
      end if;
   end versionA;

   task body versionB is
      sendB: Integer;
      status: Integer;
      buffer : Integer:= 20;
   begin
      delay 1.0;
      Put_Line("Created version b.");
      sendB := send(buffer, 2);
      status := receive(5);
      if status = 0 then
         Put_Line("voto errado version 2");
      else
         Put_Line("version 2 em execucao");
         while True loop
            null;
         end loop;
      end if;
   end versionB;

   task body versionC is
      sendC : Integer;
      status: Integer;
      buffer :Integer := 10;
   begin
      delay 1.0;
      Put_Line("Created version c.");
      sendC := send(buffer, 3);
      status := receive(6);
      if status = 0 then
         Put_Line("voto errado version 3");
      else
         Put_Line("version 3 em execucao");
         while True loop
            null;
         end loop;
      end if;
   end versionC;

   task body driver is
      votes : array(1..3) of Integer;
      status: array(1..3) of Integer := (0,0,0);
      sendAll : Integer;
   begin
      delay 1.0;
      for i in 1..3 loop
         votes(i) := receive(i);
      end loop;

      for i in 1..3 loop
         for j in i+1..3 loop
            if votes(i) = votes(j) then
               status(i) := 1;
               status(j) := 1;
            end if;
         end loop;
      end loop;

      for i in 1..3 loop
         if status(i) = 1 then
            Put_Line("version" & Integer'Image(i) & " possui o voto majoritario: " & Integer'Image(votes(i)));
         else
            Put_Line("version" & Integer'Image(i) & " possui o voto minoritario: " & Integer'Image(votes(i)));
         end if;
         sendAll := send(status(i), 3+i);
      end loop;
   end driver;


   A : versionA;
   B : versionB;
   C : versionC;
   D : driver;

begin
   for i in 1..6 loop
      vetorResource(i).Seize;
   end loop;
end Main;
