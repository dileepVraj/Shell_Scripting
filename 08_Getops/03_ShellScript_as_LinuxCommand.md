To convert a shell script into a Linux command, follow these steps:

### 1. **Create the Shell Script**

First, ensure you have a shell script file. For example, let's create a simple script named `example_script.sh`:

```bash
#!/bin/bash
echo "Hello, this is a script!"
```

### 2. **Make the Script Executable**

Change the script's permissions to make it executable. This allows the script to be run as a command.

```bash
chmod +x example_script.sh
```

### 3. **Move the Script to a Directory in Your PATH**

To use the script as a command from anywhere in the terminal, move it to a directory that's included in your system's `PATH` environment variable. Common directories for user scripts are `/usr/local/bin` or `$HOME/bin`.

#### Option A: Move to `/usr/local/bin` (System-wide)

```bash
sudo mv example_script.sh /usr/local/bin/example_command
```

- **Explanation**:
  - `sudo` is used to get superuser privileges needed to write to `/usr/local/bin`.
  - `mv` moves the script.
  - `example_command` is the name you want to use to run the script.

#### Option B: Move to `$HOME/bin` (User-specific)

1. Create the directory if it doesn't exist:

    ```bash
    mkdir -p $HOME/bin
    ```

2. Move the script:

    ```bash
    mv example_script.sh $HOME/bin/example_command
    ```

3. Add `$HOME/bin` to your `PATH` if it isn't already:

    ```bash
    echo 'export PATH="$HOME/bin:$PATH"' >> $HOME/.bashrc
    source $HOME/.bashrc
    ```

### 4. **Run the Script as a Command**

Now you can run your script from anywhere in the terminal using the name you specified:

```bash
example_command
```

### Summary

1. **Create and test your shell script**.
2. **Make it executable** with `chmod +x`.
3. **Move it to a directory in your `PATH`** (`/usr/local/bin` for system-wide access, `$HOME/bin` for user-specific access).
4. **Run the script using its new name**.

By following these steps, you convert a shell script into a command that can be executed from anywhere in the terminal, just like any other Linux command.