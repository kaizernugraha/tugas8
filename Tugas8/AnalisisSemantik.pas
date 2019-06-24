Program Compiler;

uses crt;

type
typeToken = record
              isi,jenis : string;
            end;
typToken = array [1..1000] of typeToken;

var
f : text;
s : char;
i,j : integer;
token,Ttoken,masukan,hasil : String;
stack,temp : array [1..1000] of string;
tyToken : typToken;

procedure input;
begin
     read(f,s);
end;

procedure output;
begin
     //writeln(token:35,' = ',Ttoken);
end;

procedure scan;
begin
     //clrscr;
     assign(f,'C:\Dev-Pas\Tugas8\Hitung.pas');
     reset(f);
     i := 1;
     while not eof(f) do
     begin
           input;
           if (s in['A'..'Z','a'..'z']) then
           begin
                repeat
                begin
                     token := token + s;
                     input;

                     if token = 'program' then
                     begin
                        Ttoken := 'program';
                        break;
                     end
                     else if token = 'begin' then
                     begin
                        Ttoken := 'begin';
                        break;
                     end
                     else if token = 'end' then
                     begin
                        Ttoken := 'end';
                        break;
                     end
                     else if token = 'integer' then
                     begin
                        Ttoken := 'integer';
                        break;
                     end
                     else if token = 'real' then
                     begin
                        Ttoken := 'real';
                        break;
                     end
                     else if token = 'char' then
                     begin
                        Ttoken := 'char';
                        break;
                     end
                     else if token = 'string' then
                     begin
                        Ttoken := 'string';
                        break;
                     end
                     else if token = 'const' then
                     begin
                        Ttoken := 'const';
                        break;
                     end
                     else if token = 'var' then
                     begin
                        Ttoken := 'var';
                        break;
                     end
                     else if token = 'function' then
                     begin
                        Ttoken := 'function';
                        break;
                     end
                     else if token = 'procedure' then
                     begin
                        Ttoken := 'procedure';
                        break;
                     end
                     else if token = 'array' then
                     begin
                        Ttoken := 'array';
                        break;
                     end
                     else if token = 'record' then
                     begin
                        Ttoken := 'record';
                        break;
                     end
                     else if token = 'if' then
                     begin
                        Ttoken := 'if';
                        break;
                     end
                     else if token = 'case' then
                     begin
                        Ttoken := 'case';
                        break;
                     end
                     else if token = 'repeat' then
                     begin
                        Ttoken := 'repeat';
                        break;
                     end
                     else if token = 'while' then
                     begin
                        Ttoken := 'while';
                        break;
                     end
                     else if token = 'for' then
                     begin
                        Ttoken := 'for';
                        break;
                     end
                     else if token = 'else' then
                     begin
                        Ttoken := 'else';
                        break;
                     end
                     else if token = 'until' then
                     begin
                        Ttoken := 'until';
                        break;
                     end
                     else if token = 'of' then
                     begin
                        Ttoken := 'of';
                        break;
                     end
                     else if token = 'do' then
                     begin
                        if token+s ='dow' then
                        begin
                             repeat
                                   token := token + s;
                                   input;
                             until token = 'downto';
                             Ttoken := 'downto';
                             break;
                        end
                        else
                        begin
                             Ttoken := 'do';
                             break;
                        end;
                     end
                     else if token = 'to' then
                     begin
                        Ttoken := 'to';
                        break;
                     end
                     else if token = 'then' then
                     begin
                        Ttoken := 'then';
                        break;
                     end
                     else if token = 'and' then
                     begin
                        Ttoken := 'and';
                        break;
                     end
                     else if token = 'or' then
                     begin
                        Ttoken := 'or';
                        break;
                     end
                     else if token = 'not' then
                     begin
                        Ttoken := 'not';
                        break;
                     end
                     else if token = 'div' then
                     begin
                        Ttoken := 'div';
                        break;
                     end
                     else if token = 'mod' then
                     begin
                        Ttoken := 'mod';
                        break;
                     end
                     else
                         Ttoken := 'identifier';
                end;
                until (not(s in['A'..'Z','a'..'z','_','0'..'9']));
                
                stack[i] := token;
                tyToken[i].isi := token;
                tyToken[i].jenis := Ttoken;
                i := i+1;
                output;
                token := '';
           end;

           if (s = chr(39)) then
              begin
                   token := token + s;
                   input;
                   if (s in ['0'..'9','A'..'Z','a'..'z',chr(39)]) then
                   begin
                        repeat
                        token := token + s;
                        input;
                        until (not(s = chr(39)));
                   end;
                   Ttoken := 'TYPECHAR';
                   stack[i] := token;
                   tyToken[i].isi := token;
                   tyToken[i].jenis := Ttoken;
                   i := i+1;
                   output;
                   token := '';
              end;

           if (s in['0'..'9']) then
           begin
                repeat
                begin
                     token := token + s;
                     input;

                end;
                until (not(s in['0'..'9']));

                if (s = '.') then
                     begin
                          repeat
                          begin
                               token := token + s;
                               input;
                          end;
                          until (not(s in['0'..'9']));
                          
                          Ttoken := 'TYPEREAL';
                          stack[i] := token;
                          tyToken[i].isi := token;
                          tyToken[i].jenis := Ttoken;

                          i := i+1;
                          output;
                          token := '';
                     end
                else
                begin
                Ttoken := 'TYPEINT';
                stack[i] := token;
                tyToken[i].isi := token;
                tyToken[i].jenis := Ttoken;
                i := i+1;
                output;
                token := '';
                end;
           end;



           if (s in [':','=','<','>']) then
           begin
                token := token + s;

                if token = '=' then
                   begin
                        input;
                        if token+s = '==' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator';
                           end
                        else
                        Ttoken := 'Operator';
                   end
                else if token = '<' then
                   begin
                        input;
                        if token+s = '<>' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator';
                           end
                        else if token+s = '<=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator';
                           end
                        else
                        Ttoken := 'Operator';
                   end
                else if token = '>' then
                   begin
                        input;
                        if token+s = '>=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator';
                           end
                        else
                        Ttoken := 'Operator';
                   end
                else if token = ':' then
                   begin
                        input;
                        if token+s = ':=' then
                           begin
                                token := token + s;
                                Ttoken := 'Operator';
                           end
                        else
                        Ttoken := 'Operator';
                   end;
                
                stack[i] := token;
                tyToken[i].isi := token;
                tyToken[i].jenis := Ttoken;

                i := i+1;
                output;
                token := '';
           end;

           if (s in[';','.','(',')','[',']','^',',','+','-','/','*']) then
           begin
                token := s;

                if token = ';' then
                   Ttoken := 'Semicolon'
                else if token = '.' then
                   Ttoken := 'Dot'
                else if token = '(' then
                   Ttoken := 'LParent'
                else if token = ')' then
                   Ttoken := 'RParent'
                else if token = '[' then
                   Ttoken := 'LBracket'
                else if token = ']' then
                   Ttoken := 'RBracket'
                else if token = '^' then
                   Ttoken := 'Pointer'
                else if token = ',' then
                   Ttoken := 'Comma'
                else if token = '+' then
                   Ttoken := 'Operator'
                else if token = '-' then
                   Ttoken := 'Operator'
                else if token = '/' then
                   Ttoken := 'Operator'
                else if token = '*' then
                   Ttoken := 'Operator';

                
                stack[i] := token;
                tyToken[i].isi := token;
                tyToken[i].jenis := Ttoken;

                i := i+1;
                output;
                token := '';
           end;


     end;
     j := i;
     close(f);
end;


procedure cek(terminal : string);

begin
     writeln('terminal ',terminal);
     writeln('cek j ',j);
     writeln('cek i ',i);

     masukan := stack[i];
     writeln('masukan : ',masukan);
     if terminal = masukan then
     begin
        i := i + 1;
        masukan := stack[i];
        writeln('masukan 1 :',stack[i]);
     end
     else if not(terminal = masukan) then
        begin
           writeln('Parser Gagal');
           readln();
        end;

end;

procedure empty;
begin

end;

procedure letter;
begin
     case(masukan[i])of
     'A' : cek('A');
     'B' : cek('B');
     'C' : cek('C');
     'D' : cek('D');
     'E' : cek('E');
     'F' : cek('F');
     'G' : cek('G');
     'H' : cek('H');
     'I' : cek('I');
     'J' : cek('J');
     'K' : cek('K');
     'L' : cek('L');
     'M' : cek('M');
     'N' : cek('N');
     'O' : cek('O');
     'P' : cek('P');
     'Q' : cek('Q');
     'R' : cek('R');
     'S' : cek('S');
     'T' : cek('T');
     'U' : cek('U');
     'V' : cek('V');
     'W' : cek('W');
     'X' : cek('X');
     'Y' : cek('Y');
     'Z' : cek('Z');
     'a' : cek('a');
     'b' : cek('b');
     'c' : cek('c');
     'd' : cek('d');
     'e' : cek('e');
     'f' : cek('f');
     'g' : cek('g');
     'h' : cek('h');
     'i' : cek('i');
     'j' : cek('j');
     'k' : cek('k');
     'l' : cek('l');
     'm' : cek('m');
     'n' : cek('n');
     'o' : cek('o');
     'p' : cek('p');
     'q' : cek('q');
     'r' : cek('r');
     's' : cek('s');
     't' : cek('t');
     'u' : cek('u');
     'v' : cek('v');
     'w' : cek('w');
     'x' : cek('x');
     'y' : cek('y');
     'z' : cek('z');
     end;
end;

procedure digit;
begin
     case(masukan[i])of
     '0' : cek('0');
     '1' : cek('1');
     '2' : cek('2');
     '3' : cek('3');
     '4' : cek('4');
     '5' : cek('5');
     '6' : cek('6');
     '7' : cek('7');
     '8' : cek('8');
     '9' : cek('9');
     end;
end;

procedure identifier;
begin
     letter;
end;

procedure unsignedint;
begin
     digit;
end;

procedure p_string;
begin
     i := 2;
     cek(chr(39));
     repeat
           temp[i] := masukan[i];
           letter;
           i := i + 1;
     until i= length(masukan);
end;

procedure sign;
begin
     case (masukan[1]) of
     '+' : cek('+');
     '-' : cek('-');
     end;
end;

procedure unsignedreal;
begin
     i := 1;
     if not(masukan[1] = '-') then
     begin
          unsignedint;
          repeat
          begin
               temp[i] := masukan[i];
               i := i + 1;
               if temp[i] = '.' then
               begin
                    cek('.');
               end
          end;
          until i = length(masukan);
          unsignedint;
     end;
end;

procedure unsignednumber;
begin
      i := 1;
          repeat
          begin
               temp[i] := masukan[i];
               i := i + 1;
               if temp[i] = '.' then
               begin
                    unsignedreal;
                    break;
               end
               else if (not(temp[i] = '.')) and (i = length(masukan)) then
               unsignedint;
          end;
          until i = length(masukan);
end;

procedure constIdent;
begin
     identifier;
end;

procedure constant;
begin
     if not(masukan[1] = '-') then
     begin
         unsignednumber;
     end
     else if (masukan[1] = '-') then
     begin
          sign;
          unsignednumber;
     end
     else if (masukan[1] = '-') and (masukan[2] in ['0'..'9']) then
     begin
          sign;
          constIdent;
     end
     else if masukan = chr(39) then
          p_string;

end;

procedure constDef;
begin
     identifier;
     cek('=');
     constant;
end;

procedure constDefPart;
begin
     if masukan = 'const' then
     begin
          cek('const');
          constDef;
          cek(';');
          while not(masukan = 'type') or not(masukan = 'var') do
          begin
                constDef;
                cek(';');
          end;
     end;
end;

procedure p_label;
begin
     unsignedint;
end;

procedure labelDecPart;
begin
     if masukan = 'label' then
     begin
          cek('label');
          p_label;
          cek(',');
          repeat
                p_label;
                cek(',');
          until masukan = ';' ;
          cek(';');
     end;
end;

procedure varDeclaration;
begin
     identifier;
     repeat
           cek(',');
           identifier;
     until masukan = ';';
     cek(':');
end;

procedure varDefPart;
begin
     cek('var');
     varDeclaration;
end;

procedure block; Forward;
procedure statement; Forward;
procedure expression; Forward;
procedure variable; Forward;

procedure relationalOp;
begin
     if masukan = 'in' then
        cek('in')
     else if masukan = '=' then
        cek('=')
     else if masukan = '>' then
        cek('>')
     else if masukan = '>=' then
        cek('>=')
     else if masukan = '<>' then
        cek('<>')
     else if masukan = '<' then
        cek('<')
     else if masukan = '<=' then
        cek('<=');
end;

procedure constantIdent;
begin
     identifier;
end;

procedure unsignedconst;
begin
     if masukan[1] in ['0'..'9'] then
        unsignednumber
     else if masukan[1] = chr(39) then
        p_string
     else
     begin
          constantIdent;
          cek('nil');
     end
end;

procedure varIdent;
begin
     identifier;
end;

procedure arrayvar;
begin
     variable;
end;

procedure indexedvar;
begin
     arrayvar;
     cek('[');
     expression;
     repeat
           cek(',');
           expression;
     until masukan = ']';
     cek(']');
end;

procedure fieldIdent;
begin
     identifier;
end;

procedure recordvar;
begin
     variable;
end;

procedure fieldDesignator;
begin
     recordvar;
     cek('.');
     fieldIdent;
end;

procedure componentvar;
begin
     if masukan = '[' then
        indexedvar
     else if masukan = '.' then
        fieldDesignator;
end;

procedure entirevar;
begin
     varIdent;
end;

procedure variable;
begin
     if masukan = '[' then
        componentvar
     else
     entirevar;
end;

procedure funcIdent;
begin
     identifier;
end;

procedure actualParam;
begin
     expression;
end;

procedure funcDesignator;
begin
     funcIdent;
     if masukan = '(' then
     begin
          cek('(');
          actualParam;
          repeat
                cek(',');
                actualParam;
          until masukan = ')';
     end;
end;

procedure factor;
begin
     if masukan = '(' then
     begin
          cek('(');
          expression;
          cek(')');
     end
     else if masukan = 'not' then
         begin
              cek('not');
              factor;
         end
     else if masukan[1] in [chr(39),'0'..'9'] then
          unsignedconst
     else if masukan = '[' then
          variable
     else
         funcDesignator;
end;

procedure multiOp;
begin
     if masukan = '*' then
        cek('*')
     else if masukan = '/' then
        cek('/')
     else if masukan = 'div' then
        cek('div')
     else if masukan = 'mod' then
        cek('mod')
     else if masukan = 'and' then
        cek('and');
end;

procedure term;
begin
     if (masukan = '*') or (masukan = '/') or (masukan = 'div') or (masukan = 'mod') or (masukan = 'and') then
     begin
          term;
          multiOp;
     end;
     factor;
end;

procedure addOp;
begin
     if masukan = '+' then
        cek('+')
     else if masukan = '-' then
        cek('-')
     else if masukan = 'or' then
        cek('or');
end;

procedure simpleEx;
begin
     if(masukan = '-') or (masukan = '+') then
     begin
          sign;
     end
     else
     begin
          simpleEx;
          addOp;
     end;
     term;
end;

procedure expression;
begin
     simpleEx;
     if (masukan = 'in') or (masukan = '=') or (masukan = '>') or (masukan = '>=') or (masukan = '<>') or (masukan = '<') or (masukan = '<=') then
     begin
          relationalOp;
          simpleEx;
     end;
end;

procedure ifstmt;
begin
     cek('if');
     expression;
     cek('then');
     statement;
     if masukan = 'else' then
     begin
          cek('else');
          statement;
     end;
end;

procedure caseLabel;
begin
     constant;
end;

procedure caseLabelList;
begin
     caseLabel;
end;

procedure caseListElement;
begin
     caseLabel;
     cek(':');
     statement;
end;

procedure casestmt;
begin
     cek('case');
     expression;
     cek('of');
     caseListElement;
     repeat
           cek(';');
           caseListElement;
     until masukan = 'end';
     cek('end');
     cek(';');
end;

procedure conditionalstmt;
begin
     if masukan = 'if'
     then
         ifstmt
     else
         casestmt;
end;

procedure compoundstmt;
begin
     cek('begin');
     statement;
     repeat
           cek(';');
           statement;
     until masukan = 'end';
     cek('end');
end;

procedure initialvalue;
begin
     expression;
end;

procedure finalvalue;
begin
     expression;
end;

procedure forList;
begin
     initialvalue;
     if masukan = 'to' then
        cek('to')
     else
         cek('downto');
     finalvalue;
end;

procedure controlvar;
begin
     identifier;
end;

procedure forstmt;
begin
     cek('for');
     controlvar;
     cek(':=');
     forList;
     cek('do');
     statement;
end;

procedure repeatstmt;
begin
     cek('repeat');
     statement;
     repeat
           cek(';');
           statement;
     until masukan = 'until';
     cek('until');
     expression;
end;

procedure whilestmt;
begin
     cek('while');
     expression;
     cek('do');
     statement;
end;

procedure repetitivestmt;
begin
     if masukan = 'while' then
        whilestmt
     else if masukan = 'repeat' then
        repeatstmt
     else if masukan = 'for' then
        forstmt;
end;

procedure structuredstmt;
begin
     if masukan = 'begin' then
        compoundstmt
     else if(masukan = 'if') or (masukan = 'case') then
          conditionalstmt
     else
          repetitivestmt;
end;

procedure procIdent;
begin
     identifier;
end;

procedure procstmt;
begin
     procIdent;
     if masukan = '(' then
     cek('(');
     actualParam;
     repeat
           cek(',');
           actualParam;
     until masukan = ')';
     cek(')');
end;

procedure gotostmt;
begin
     cek('goto');
     p_label;
end;

procedure assignstmt;
begin
     if masukan = '[' then
        variable
     else
         funcIdent;
     cek(':=');
     expression;
end;

procedure simplestmt;
begin
     if masukan = '[' then
        assignstmt
     else if masukan = 'goto' then
        gotostmt
     else
        procstmt;
end;

procedure unlabelledstmt;
begin
     if masukan = 'begin' then
         structuredstmt
     else
         simplestmt;
end;

procedure statement;
begin
     if masukan[1] = '-' then
     begin
          p_label;
          cek(':');
     end
     else
         unlabelledstmt;
end;

procedure typeIdent;
begin
     identifier;
end;

procedure parameterGroup;
begin
     identifier;
     repeat
          cek(',');
          identifier;
     until masukan = ':';
     cek(':');
     typeIdent;
end;

procedure formalParam;
begin
     if masukan = 'var' then
     begin
          cek('var');
          parameterGroup;
     end
     else if masukan = 'function' then
     begin
          cek('function');
          parameterGroup;
     end
     else if masukan = 'procedure' then
     begin
          cek('procedure');
          identifier();
     end
     else
         parameterGroup;
end;

procedure procHeading;
begin
     cek('procedure');
     identifier;
     if masukan = '(' then
     begin
          cek('(');
          formalParam;
          repeat
                cek(';');
                formalParam;
          until masukan = ')';
     end;
     cek(';');
end;

procedure procDeclaration;
begin
     procHeading;
     block;
end;

procedure resultType;
begin
     typeIdent;
end;

procedure funcHeading;
begin
     cek('function');
     identifier();
     if masukan = '(' then
     begin
          cek('(');
          formalParam;
          repeat
                cek(';');
                formalParam;
          until masukan = ')';
     end;
     cek(':');
     resultType;
end;

procedure funcDeclaration;
begin
     funcHeading;
     block;
end;

procedure procFuncDec;
begin
     if masukan= 'procedure' then
         procDeclaration
     else
         funcDeclaration;
end;

procedure procFuncDecPart;
begin
     procFuncDec;
     cek(';');
end;

procedure p_type; Forward;

procedure pointerType;
begin
     typeIdent;
end;

procedure componentType;
begin
     p_type;
end;

procedure subrangeType;
begin
     constant;
     cek('.');
     cek('.');
     constant;
end;

procedure scalarType;
begin
     cek('(');
     identifier;
     repeat
           cek(',');
           identifier;
     until masukan = ')';
end;

procedure simpleType;
begin
     if masukan = '(' then
         scalarType
     else if masukan[1] in ['a'..'z','A'..'Z'] then
         typeIdent
     else
         subrangeType;
end;

procedure indexType;
begin
     simpleType;
end;

procedure arrayType;
begin
     cek('array');
     cek('[');
     indexType;
     repeat
           cek(',');
           indexType;
     until masukan = ']';
     cek(']');
     cek('of');
     componentType;
end;

procedure recordSection;
begin
     fieldIdent;
     repeat
           cek(',');
           fieldIdent;
     until masukan = ':';
     cek(':');
     p_type;
end;

procedure fieldList; Forward;

procedure variantPart;
begin
     caseLabelList;
     cek(':');
     cek('(');
     fieldList;
     cek(')');
     
end;

procedure fixedPart;
begin
     recordSection;
     cek(';');
     recordSection;
end;

procedure fieldList;
begin
     if masukan = 'case' then
         variantPart
     else
         begin
              fixedPart;
              if masukan = ';' then
              begin
                   cek(';');
                   variantPart;
              end;
         end;
end;

procedure recordType;
begin
     cek('record');
     fieldList;
     cek('end');
end;

procedure structuredType;
begin
     if masukan = 'array' then
         arrayType
     else
         recordType;
end;

procedure p_type;
begin
     if masukan = '^' then
        pointerType
     else if (masukan = 'array') or (masukan = 'record') then
        structuredType
     else
        simpleType;
end;

procedure typeDef;
begin
     identifier;
     cek('=');
     p_type;
end;

procedure typeDecPart;
begin
     if masukan = 'type' then
     begin
          cek('type');
          typeDef;
          repeat
               cek(';');
               typeDef;
          until masukan = ';';
          cek(';');
     end
     else
         empty;
end;

procedure block;
begin
     labelDecPart;
     constDefPart;
     varDefPart;
     typeDecPart;
     procFuncDecPart;
end;

procedure p_program;
begin
     cek('program');
     identifier;
     cek(';');
     block;
     cek('.');
end;

procedure parser;
begin
     p_program;
     hasil := 'DITERIMA';
     writeln(hasil);
end;

procedure uniqueCek;
var
   temp : string;
begin
    writeln();
    writeln('Uniqueness Check');
    i := 1;
    j := 1;
    if (tyToken[i].jenis = 'program') then
       begin
       i := 2 ;
       j := 3;
       writeln('masuk if program');
          while ((not(tyToken[i].jenis = 'procedure')) or (not(tyToken[i].jenis = 'function')) or (not(tyToken[i].jenis = 'begin'))) do
             begin
                writeln ('masuk while');
                writeln('Token j : ',tyToken[j].jenis);
                writeln('Token i : ',tyToken[i].jenis);

                if (tyToken[i].jenis = 'identifier') then
                   begin
                      writeln('masuk Ident');
                      writeln('ty Token : ',tyToken[j].jenis);
                      temp := tyToken[i].isi;
                      if (tyToken[j].jenis = 'identifier') then
                         begin
                             writeln('masuk identifier');
                             if (tyToken[j].isi = temp) then
                                begin
                                    writeln('Identifier Tidak Boleh Sama');
                                    break;
                                end
                         end;
                   end;
                i := i+1;
                j := j+1;
                readln();
             end;
       end;
end;


procedure cek()


begin
     writeln('Scanner');
     scan;
     for i := 1 to j do
        begin
            writeln('Isi :',tyToken[i].isi);
            writeln('Jenis : ',tyToken[i].jenis);
            writeln('Stack : ',stack[i]);
            writeln();
        end;
     {writeln('Parser');
     parser;
     writeln('Hasil');
     writeln(hasil);}

     writeln('Unique');
     writeln('i : ',i);
     writeln('j : ',j);
     
     readln();
     uniqueCek;
     readln;
end.
