external unshare_low : unit -> int = "unshare_low"
external mount_bind_low : string -> string -> int = "mount_bind_low"

exception Error of string

let unshare () =
  let ret = unshare_low () in
  if ret = -1 then raise (Error "unshare")

let mount_bind ~src ~dst =
  let ret = mount_bind_low src dst in
  if ret = -1 then raise (Error "mount_bind")
