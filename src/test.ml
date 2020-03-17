let child () =
  Linux.unshare ();
  Linux.mount_bind ~src:"files" ~dst:"mountp";
  let cout = open_out_gen [Open_append] 0o644 "mountp/toto" in
  Printf.fprintf cout "hello\n";
  close_out cout

let () =
  let pid = Unix.fork () in
  if pid = 0 then
    child ()
  else
    let (_, _) = Unix.waitpid [] pid in
    exit 0
