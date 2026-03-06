// CS380 Ping-Pong Program in xv6
// Jadon Polete

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

// Ping-pong a single byte between parent and child over two pipes.
// One exchange = parent sends one byte to child, child sends one byte back.

int
main(int argc, char *argv[])
{
  int p2c[2];   // parent to child pipe
  int c2p[2];   // child to parent pipe
  int N = 10000; // default number of exchanges

  if (argc >= 2) {
    N = atoi(argv[1]);
    if (N <= 0) {
      printf("Usage: pingpong [num_exchanges]\n");
      exit(1);
    }
  }

  if (pipe(p2c) < 0 || pipe(c2p) < 0) {
    printf("pipe failed\n");
    exit(1);
  }

  int pid = fork();
  if (pid < 0) {
    printf("fork failed\n");
    exit(1);
  }

  char b = 'x';

  if (pid == 0) {
    // Child process
    close(p2c[1]); // close unused write end
    close(c2p[0]); // close unused read end

    for (int i = 0; i < N; i++) {
      if (read(p2c[0], &b, 1) != 1) {
        printf("child read failed\n");
        exit(1);
      }
      if (write(c2p[1], &b, 1) != 1) {
        printf("child write failed\n");
        exit(1);
      }
    }

    close(p2c[0]);
    close(c2p[1]);
    exit(0);
  }

  // Parent process
  close(p2c[0]); // close unused read end
  close(c2p[1]); // close unused write end

  int start = uptime();

  for (int i = 0; i < N; i++) {
    if (write(p2c[1], &b, 1) != 1) {
      printf("parent write failed\n");
      exit(1);
    }
    if (read(c2p[0], &b, 1) != 1) {
      printf("parent read failed\n");
      exit(1);
    }
  }

  int end = uptime();
  int ticks = end - start;

  close(p2c[1]);
  close(c2p[0]);

  wait(0);

  printf("Exchanges: %d\n", N);
  printf("Elapsed ticks: %d\n", ticks);

  if (ticks == 0) {
    printf("Too fast to measure with current tick resolution.\n");
    printf("Try a larger number, such as: pingpong 200000\n");
  } else {
    // xv6 timer tick is about 0.1 seconds
    // exchanges/sec = N / (ticks * 0.1) = (N * 10) / ticks
    int exchanges_per_sec = (N * 10) / ticks;
    printf("Performance: %d exchanges/sec (approx)\n", exchanges_per_sec);
  }

  exit(0);
}
