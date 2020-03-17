#define _GNU_SOURCE
#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/fail.h>
#include <caml/memory.h>

#include <sys/mount.h>
#include <sched.h>
#include <stdlib.h>
#include <unistd.h>


CAMLprim value unshare_low(value unit)
{
  CAMLparam1(unit);
  CAMLreturn (Val_int(unshare(CLONE_NEWUSER | CLONE_NEWNS)));
}

CAMLprim value mount_bind_low(value src, value dst)
{
  CAMLparam2(src, dst);
  CAMLreturn (Val_int(mount(String_val(src), String_val(dst), NULL, MS_BIND, NULL)));
}
