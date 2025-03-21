#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid1, pid2;

    printf("Grandparent (Original Parent) PID: %d\n", getpid());

    // First fork: Create Parent process
    pid1 = fork();

    if (pid1 < 0) {
        perror("Fork failed");
        exit(1);
    } else if (pid1 == 0) {
        // This is the Parent process
        printf("Parent Process PID: %d, PPID: %d\n", getpid(), getppid());

        // Second fork: Create Child process
        pid2 = fork();

        if (pid2 < 0) {
            perror("Fork failed");
            exit(1);
        } else if (pid2 == 0) {
            // This is the Child process
            printf("Child Process PID: %d, PPID: %d\n", getpid(), getppid());
            printf("I am the child of Parent (PID: %d) and grandchild of Grandparent (PID: %d)\n", getppid(), getppid());
            exit(0);
        }

        // Parent process waiting for the Child to finish
        wait(NULL);
        printf("Parent (PID: %d) has finished executing.\n", getpid());
        exit(0);
    }

    // Grandparent waits for Parent to finish
    wait(NULL);
    printf("Grandparent (PID: %d) has finished executing.\n", getpid());

    return 0;
}
