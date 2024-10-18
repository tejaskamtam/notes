### Functions to use:

`pipe(int fd[2])`

- create a pipe between 2 processes
- fd[0] = read end
- fd[1] = write end

`ssize_t read(int fd, void *buf, size_t count);`

`**ssize_t write(int**` `_fd_``**, const void ***``_buf_``**, size_t**` `_count_``**);**`

`getpid()`

`execlp()`

when is successful, it doesn't return; otherwise, it returns -1 and sets errno