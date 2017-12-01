#include <unistd.h>
#include <sys/stat.h>
#include "syscall.h"
#include "libc.h"
#define _GNU_SOURCE
#include <grp.h>
#include <limits.h>

int setegid(gid_t egid)
{
        return 0;
}

int seteuid(uid_t euid)
{
        return 0;
}

int setgid(gid_t gid)
{
        return 0;
}

int setuid(uid_t uid)
{
        return 0;
}

int chown(const char *path, uid_t uid, gid_t gid)
{
        return 0;
}

int chmod(const char *path, mode_t mode)
{
        return 0;
}

int initgroups(const char *user, gid_t gid)
{
        return 0;
}
