#include <Compiler.h>
#include <Example.h>


void intersection() {
  Reg i, j, total;
  Addr a(1024);
  Addr b(1024);

  a = 0;
  b = 1024;

  i = 0;
  WHILE i < 1024 DO
    a[i] = input;
    ++i;
  END

  i = 0;
  WHILE (i < 1024) DO
    b[i] = input;
    ++i;
  END


  i = 0;
  j = 0;
  total = 0;
  WHILE (i < 1024) & (j < 1024) DO
    IF a[i] < b[j]
    THEN
      i++;
    ELSE IF b[j] < a[i]
      THEN
        j++;
      ELSE
        i++;
        total++;
      END
    END
  END
  Program::generate(total);
}


void cond() {
  Reg i, j;

  IF i < j
    THEN
    i = 5;
  ELSE
    i = j;
  END;
  Program::generate(i);
}

void multi() {
  Reg i, j, k;
  i = input;
  j = input;

  k = i + j + 4;
}

void lp() {
  Reg i, j, k;
  WHILE i
  DO
    ++i;
  END
  Program::generate(i);
}

void loopcond() {
  Reg i, j, k;
  WHILE i < k
  DO
    IF i < j
      THEN
      i = 5;
    ELSE
      i = j;
    END;
  END
  Program::generate(i);
}


int main() {
  /* loopcond(); */
  /* intersection(); */
  example();
}
