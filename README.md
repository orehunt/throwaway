# throwaway

#### for dropbear
either compile dropbear without `/etc/shells` check (in `svr-auth.c` superseed with `goto: goodshells;`)
or run dropbear in its own roont with `proot` because `fakechroot` hard coded system glib which makes it unusable on older systems.
