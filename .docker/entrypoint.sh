#!/bin/sh

set -e

if [ "$1" = "build" ]; then
    mkdir -p /build /dist
    chmod -R 777 /build /dist
    pyinstaller --clean --onefile --distpath /dist --workpath /build --specpath /build main.py
elif [ "$1" = "run" ]; then
    /entrypoint.sh build
    /entrypoint.sh main
elif [ "$1" = "main" ]; then
    /dist/main
elif [ "$1" = "test" ]; then
    python3 -m unittest discover
else
    exec "$@"
fi