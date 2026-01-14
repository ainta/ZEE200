#include <Compiler.h>
#include <Example.h>

#include <iostream>

Reg theAssertion;
Reg mallocPtr;

void setup() {
  theAssertion = 1;
  mallocPtr = 0;
}


void check(const Reg& r) {
  theAssertion &= r;
}


struct Block {
  Reg size;
  Reg content;


  template <typename T>
  Cell operator[](const T& offset) const {
    check(offset < size);
    return content[offset];
  }

};


template <typename T>
Block malloc_(const T& n) {
  Block out;
  out.size = n;
  out.content = mallocPtr;
  mallocPtr += n;
  return out;
}


Expr strncmp_(const Block& s0, const Block& s1, const Reg& n) {
  Reg i;
  Reg c0;
  Reg c1;

  i = 0;

  c0 = s0[i];
  c1 = s1[i];


  WHILE ((c0 == c1) & (c0 != '\0') & (c1 != '\0') & (i < n-1)) DO
    ++i;
    c0 = s0[i];
    c1 = s1[i];
  END;

  Reg out;

  return c0 == c1;
}


Reg strlen_(Block& s) {
  Reg i;
  Reg c;

  i = 0;

  c = s[i];

  WHILE (c != '\0') DO
    ++i;
    c = s[i];
  END

  return i;
}


void copyLit(Block& dst, const char * src) {
  std::size_t n = strlen(src);
  dst = malloc_(n+1);
  for (size_t i = 0; i < n+1; ++i) {
    dst[i] = src[i];
  }
}

Block SMALL_BOARD;

Block alloc_resources(const Block& board_type) {
  Reg block_size;
  Reg size;
  size = 4;
  IF (strncmp_(board_type, SMALL_BOARD, size))
  THEN
    block_size = 10;
  ELSE
    block_size = 100;
  END
  Reg malloc_size;
  malloc_size = block_size * 4;
  return malloc_(malloc_size);
}


Reg incr_clock(const Block& board_type, Block& resources) {
  Reg clock_loc;
  IF (strncmp_(board_type, SMALL_BOARD, strlen_(SMALL_BOARD)))
  THEN
    clock_loc = 0;
  ELSE
    clock_loc = 64;
  END
  Reg clock = resources[clock_loc];
  ++clock;
  return clock;
}


void snippet() {
  copyLit(SMALL_BOARD, "small_board_v11");

  Block board_type = malloc_(20);
  Reg i;
  Reg done;
  i = 0;
  done = 0;

  WHILE (i < 20 & ~done) DO
    Reg t;
    t = input;
    IF (t == 0) THEN
      done = 1;
    ELSE
    END
    board_type[i] = t;
    ++i;
  END

  Block res = alloc_resources(board_type);
  incr_clock(board_type, res);
}


Reg partition(Block& arr, const Reg& l, const Reg& h) {
  Reg x, i;
  x = arr[h];
  i = l;

  Reg j;
  j = l;
  WHILE (j < h) DO
    Reg t1;
    t1 = arr[j];

    IF (t1 <= x)
    THEN
      Reg t0;
      t0 = arr[i];
      arr[i] = t1;
      arr[j] = t0;
      ++i;
    ELSE
    END

    ++j;
  END

  Reg t;
  t = arr[i];
  arr[i] = x;
  arr[h] = t;
  return i;
}


void quick_sort(Block& arr, Reg& l, Reg& h) {
  Reg size;
  size = h - l + 1;
  Block stack = malloc_(size);

  Reg top;
  top = 0;
  stack[0] = l;
  stack[1] = h;
  top = 2;
  WHILE (top != 0) DO
    top--;
    h = stack[top];
    top--;
    l = stack[top];

    Reg p = partition(arr, l, h);

    IF (p > l + 1) THEN
      stack[top] = l;
      top++;
      stack[top] = p - 1;
      top++;
    ELSE
    END

    IF (p + 1 < h) THEN
      stack[top] = p + 1;
      top++;
      stack[top] = h;
      top++;
    ELSE
    END
  END
}


void bubble_sort(Block& arr, const Reg& n) {
  Reg i, j;

  i = 0;
  WHILE (i + 1 < n) DO

    j = i+1;
    WHILE (j < n) DO
      Reg t0, t1;
      t0 = arr[i];
      t1 = arr[j];

      IF (t0 > t1)
      THEN
        arr[j] = t0;
        arr[i] = t1;
      ELSE
      END
      ++j;
    END

    ++i;
  END
}


int partition(std::vector<int>& arr, const int& l, const int& h) {
  int x, i;
  x = arr[h];
  i = l;

  int j;
  j = l;
  while (j < h) {
    int t1;
    t1 = arr[j];

    if (t1 <= x) {
      int t0;
      t0 = arr[i];
      arr[i] = t1;
      arr[j] = t0;
      ++i;
    }

    ++j;
  }

  int t;
  t = arr[i];
  arr[i] = x;
  arr[h] = t;
  return i;
}


void quick_sort(std::vector<int>& arr, int l, int h) {
  std::vector<int> stack((h + 1) - l);

  int top = 0;
  top = 0;
  stack[0] = l;
  stack[1] = h;
  top = 2;
  while (top != 0) {
    top--;
    h = stack[top];
    top--;
    l = stack[top];
    std::cout << top << '\n';

    int p = partition(arr, l, h);

    if (p > l + 1) {
      stack[top] = l;
      top++;
      std::cout << p << '\n';
      stack[top] = p - 1;
      top++;
    }

    if (p + 1 < h) {
      stack[top] = p + 1;
      top++;
      stack[top] = h;
      top++;
    }
  }
}




/* void example() { */
/*   setup(); */

/*   snippet(); */

/*   Program::generate(~theAssertion); */
/* } */


void example() {
  srand (time(NULL));
  setup();

  int n = 100;
  Block test = malloc_(n);
  for (int i = 0; i < n; ++i) {
    test[i] = rand();
  }
  Reg size;
  size = n;


  Reg l;
  l = 0;
  size--;
  quick_sort(test, l, size);

  snippet();

  Program::generate(~theAssertion);
}
