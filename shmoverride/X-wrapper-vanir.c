#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

#ifndef SHMOVERRIDE_LIB_PATH
#define SHMOVERRIDE_LIB_PATH "shmoverride.so"
#endif
#define XORG_PATH "/usr/bin/Xorg"
#define XORG_PATH_NEW "/usr/libexec/Xorg.bin"
#define XORG_PATH_NEWER "/usr/libexec/Xorg" /* Fedora 23 */

int main(int argc __attribute__((__unused__)), char **argv) {
    putenv("LD_PRELOAD=" SHMOVERRIDE_LIB_PATH);

    if (access(XORG_PATH_NEWER, X_OK) == 0)
        execv(XORG_PATH_NEWER, argv);
    else if (access(XORG_PATH_NEW, X_OK) == 0)
        execv(XORG_PATH_NEW, argv);
    else
        execv (XORG_PATH, argv);

    perror("X-wrapper-vanir: execv");
    return 1;
}
