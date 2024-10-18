## Resource

[https://sysprog21.github.io/lkmpg/#the-proc-file-system](https://sysprog21.github.io/lkmpg/#the-proc-file-system)

[https://devarea.com/linux-kernel-development-creating-a-proc-file-and-interfacing-with-user-space/#.Y8WkBHZKhD8](https://devarea.com/linux-kernel-development-creating-a-proc-file-and-interfacing-with-user-space/#.Y8WkBHZKhD8)

## Useful Commands:

lsmod - list the current list kernel module

insmodded - add a kernel module

rmmodded - remove a kernel module

## Kernel Module

Must have at least 2 functions:

1. `init_module()`, called when module is insmodded into kernal
2. `clean_up()`, called just before the module is remodded

Macro Functions, doesn’t have to follow naming convention

- `module_init()`
- `module_exit()`

## Namespace

- the kernel model is linked against the entire kernel: namespace pollution, variable names clash
- the best practice is to define your variable as `static`

## Functions Used:

### proc_create()

```
struct proc_dir_entry *proc_create
(const char *name, umode_t mode, 
struct proc_dir_entry *parent, 
const struct proc_ops *proc_ops);
```

Define struct proc_ops:

```
static const struct proc_ops proc_file_fops = { 
    .proc_read = read_method, 
};
```

Define read method:

```
// part of the proc_ops parameter
ssize_t (*read) 
(struct file *filePointer, 
char __user *buffer, 
size_t buffer_length,
loff_t *offset);
```

Two parameters of this function are very important:

- the buffer (the second parameter) and the offset (the fourth one).
- The content of the buffer will be returned to the application which read it (for example the `cat` command).
- The offset is the current position in the file.
- If the return value of the function is not null, then this function is called again. So be careful with this function, if it never returns zero, the read function is called endlessly.

### create_proc_single_data()

- shortcut to create a process when the only operation is read

[https://subscription.packtpub.com/book/programming/9781801079518/3/ch03lvl1sec45/a-few-misc-procfs-apis](https://subscription.packtpub.com/book/programming/9781801079518/3/ch03lvl1sec45/a-few-misc-procfs-apis)

### copy_to_user()

```
unsigned long __copy_to_user (
	void __user *to,
 	const void *from,
 	unsigned long n);
// *to points to destination address, in user space
// *from points to source address in kernel space
// n is the number of bytes to copy
```

Copy data from kernel space to user space. Caller must check the specified block with `access_ok` before calling this function.

Returns number of bytes that could not be copied. **On success, this will be zero.**