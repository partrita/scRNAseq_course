#!/usr/bin/env bash

set -eu

function checkout_repository {
    if [[ -d /tmp/scRNA.seq.course ]]; then
        echo "[*] Cleaning up old temporary files..."
        rm -rf /tmp/scRNA.seq.course
    fi
    echo "[*] Getting files from GitHub..."
    git clone --quiet --depth=1 https://github.com/cellgeni/scRNA.seq.course.git /tmp/scRNA.seq.course
}

function copy_course_files {
    echo "[*] Copying course files to ${COURSE}..."
    mv /tmp/scRNA.seq.course/course_files "${COURSE}"
}

function download_data {
    echo "[*] Downloading course data..."
    cd "${COURSE}"
    /tmp/scRNA.seq.course/poststart.sh > /dev/null
}

function cleanup {
    echo "[*] Cleaning up..."
    rm -f $COURSE/*.yml
    rm -f $COURSE/book.bib
    rm -f $COURSE/*.html
    rm -f $COURSE/*.tex
    rm -f $COURSE/*.css
    rm -rf /tmp/scRNA.seq.course
}

COURSE="${HOME}/course"
CWD="${PWD}"
checkout_repository
copy_course_files
download_data
cleanup
echo "[*] Done"
cd "${CWD}"
