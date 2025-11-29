# File System Monitoring Lab (Bash + inotifywait)

This project demonstrates real-time file system monitoring on Linux using two Bash scripts:

1. file-create.sh – generates controlled file and directory activity.
2. file-watcher.sh – monitors a target directory for changes using inotifywait.

The purpose of this lab is to show practical Linux skills, Bash scripting ability, and an understanding of file system events relevant to system administration and cybersecurity operations.

---

## Overview

The lab simulates file activity inside a directory so that monitoring tools can detect and log events. This setup is similar to the basic behaviours monitored by SIEMs, intrusion detection systems, and SOC-level log pipelines.

---

## Scripts

### 1. file-create.sh

This script creates a predictable sequence of file system events. It:

- Creates a directory named sample_data if it does not exist.
- Creates ten subdirectories named newFiles0 through newFiles9.
- Creates a temporary file containing:
  - The current date and time.
  - The current working directory.
- Copies this temporary file into each newly created subdirectory.
- Deletes the temporary file after each copy.
- Adds small delays between actions to make events easier to observe.

Run the script with:

```
./file-create.sh
```

This generates multiple create, write, copy, and delete operations.

---

### 2. file-watcher.sh

This script monitors a specified directory and reports real-time file system events using inotifywait. It detects:

- File creation
- File modification
- File deletion

The script outputs timestamps for each detected event.

Usage:

```
./file-watcher.sh <directory_to_watch>
```

Example:

```
./file-watcher.sh sample_data
```

---

## Requirements

Install inotify-tools:

Fedora:
```
sudo dnf install inotify-tools
```

Ubuntu/Debian:
```
sudo apt install inotify-tools
```

Both scripts require standard Bash and a Linux environment.

---

## How to Use the Lab

1. Start the watcher script in one terminal session.

Example:
```
./file-watcher.sh sample_data
```

2. In a second terminal, run the file-create script:

```
./file-create.sh
```

3. Observe real-time output as events occur inside the monitored directory.

---

## Purpose and Learning Outcomes

This lab demonstrates:

- Bash scripting fundamentals
- Linux file system operations
- Real-time monitoring concepts
- Use of inotifywait for event detection
- Automating system activity for testing and analysis

It is suitable as a foundational exercise in monitoring, SOC analysis, and Linux system behaviour.
