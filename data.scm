((fork
  (features
   thunk
   thread-safe)

  (implementation
   chicken
   process-fork
   (thunk))

  (implementation
   gambit
   sys-fork
   ()))

 (spawn
  (features
   fork
   double-fork
   setsid
   exec
   wait
   path-search
   arg-shell
   arg-list
   arg-syms
   arg-nums
   arg-zero
   arg-w32-quote
   env
   dir
   sig-mask
   new-pgrp
   pty
   timeout
   raise-exit-code
   text-ports
   stdin-pipe
   stdout-pipe
   stderr-pipe
   any-fd-dup
   any-fd-close
   other-fd-close)

  (implementation
   chibi
   execute
   (exec
    path-search
    arg-list
    arg-zero))

  (implementation
   chibi
   system
   (fork
    exec
    wait
    path-search
    arg-list
    arg-zero))

  (implementation
   chibi
   call-with-process-io
   (fork
    exec
    arg-shell
    arg-list
    arg-syms
    arg-nums
    arg-zero
    stdin-pipe
    stdout-pipe
    stderr-pipe))

  (implementation
   chicken
   process-execute
   (path-search
    arg-list
    arg-w32-quote
    env))

  (implementation
   chicken
   process-run
   (fork
    exec
    path-search
    arg-shell
    arg-list))

  (implementation
   gambit
   open-process
   (env
    dir
    pty
    stdin-pipe
    stdout-pipe
    stderr-pipe))

  (implementation
   gauche
   sys-system
   (fork
    exec
    wait
    arg-shell))

  (implementation
   gauche
   sys-exec
   (exec
    arg-list
    arg-zero
    dir
    sig-mask
    any-fd-dup
    other-fd-close))

  (implementation
   gauche
   sys-fork-and-exec
   (fork
    double-fork
    setsid
    exec
    dir
    any-fd-dup
    other-fd-close
    sig-mask
    new-pgrp
    ))

  (implementation
   go
   os.StartProcess
   (path-search
    arg-list
    arg-zero
    dir
    env
    any-fd-dup
    any-fd-close))

  (implementation
   python
   subprocess.run
   (fork
    exec
    wait
    timeout
    raise-exit-code
    text-ports)))

 (wait
  (features
   process-object
   any-pid
   any-pgrp
   timeout
   no-hang
   get-exit-code)

  (implementation
   gambit
   process-status
   (process-object
    timeout
    get-exit-code))

  (implementation
   gauche
   sys-wait
   ())

  (implementation
   gauche
   sys-waitpid
   (any-pid
    any-pgrp
    no-hang)))

 (readdir
  (features
   in-path
   in-dir-object
   no-dot-dot
   no-dotfiles
   no-w32-hidden
   sort
   out-fullpaths)

  (implementation
   gambit
   open-directory
   (in-path
    no-dot-dot
    no-dotfiles
    no-w32-hidden))

  (implementation
   gauche
   sys-readdir
   (in-path)))

 (delete-file
  (features
   delete-dir
   error-if-not-exist
   try-to-change-perms
   delete-w32-junction)

  (implementation
   gambit
   sys-remove
   (error-if-not-exist
    delete-w32-junction))

  (implementation
   gauche
   sys-unlink
   ())

  (implementation
   racket
   delete-file
   (try-to-change-perms)))

 (delete-directory
  (features
   delete-nonempty)

  (implementation
   gauche
   sys-rmdir
   ()))

 (create-directory
  (features
   create-parents
   perm-bits)

  (implementation
   gauche
   sys-mkdir
   (perm-bits))

  (implementation
   gauche
   make-directory*
   (create-parents
    perm-bits))))
