#!/bin/bash

# --- Usage ---
# Example Usage:
# ./file-watcher.sh [/path/to/your/directory]
#

# Check if a directory argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: No directory specified."
    echo "Usage: $0 <directory_to_watch>"
    exit 1
fi

WATCH_DIR=$1

# Check if the directory exists
if [ ! -d "$WATCH_DIR" ]; then
    echo "Error: Directory '$WATCH_DIR' not found."
    exit 1
fi

echo "Watching for changes in '$WATCH_DIR'... Press Ctrl+C to stop."
echo "------------------------------------------------------------"

# The `while true` loop ensures that inotifywait restarts after each event,
# allowing it to catch more than one change.
#
# -m: Monitor mode, runs indefinitely.
# -r: Recursive, watch subdirectories as well.
# -e: Specify events to watch for (modify, create, delete).
# --format: How to print the event information.
# %w: The watched directory path.
# %f: The event-related filename.
# %e: The event name.
inotifywait -m -r -e modify,create,delete --format '%w%f %e' "$WATCH_DIR" | while read -r CHANGED_FILE
do
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Event detected: $CHANGED_FILE"
done
