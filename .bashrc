# Notes
# - mkfile 1g test.txt
# - The `source` command evaluates the script at the specified file path

# This file sets up auto-completion for all users
source /opt/local/etc/bash_completion.d/git-completion.bash

# Rebuild the spotlight when indexing goes south
function rebuildSpotlight (){
    sudo mdutil -E /Volumes/Macintosh\ HD
}

# Setup a simple HTTP server
function simpleServer(){
    python -m SimpleHTTPServer ${1:-3000}
}
