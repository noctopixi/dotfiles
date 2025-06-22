#!/usr/bin/env python3

import os
import shutil
import subprocess
from pathlib import Path

# Base paths
PURE = Path.home() / "Music" / "PURE"
LITE = Path.home() / "Music" / "LITE"

# Supported extensions
LOSSLESS_EXT = {".flac", ".wav", ".alac", ".aiff"}
LOSSY_COPY_EXT = {".mp3", ".m4a", ".aac"}
OPUS_EXT = {".opus"}

# Counters
converted_count = 0
copied_count = 0
skipped_count = 0

def needs_update(src: Path, dest: Path) -> bool:
    return not dest.exists() or src.stat().st_mtime > dest.stat().st_mtime

def convert_to_mp3(src: Path, dest: Path, warn_opus=False):
    global converted_count
    dest.parent.mkdir(parents=True, exist_ok=True)
    print(f"🎧 Converting: {src} → {dest}")
    if warn_opus:
        print("🚨 OPUS file detected in LOSSY! This should not happen. Converting as fallback... 🚨")
    subprocess.run([
        "ffmpeg",
        "-i", str(src),
        "-c:a", "libmp3lame",
        "-qscale:a", "0",  # MP3 V0 – VBR máxima calidad
        "-map_metadata", "0",
        "-y",
        str(dest)
    ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    converted_count += 1

def copy_file(src: Path, dest: Path):
    global copied_count
    dest.parent.mkdir(parents=True, exist_ok=True)
    print(f"📥 Copying: {src} → {dest}")
    shutil.copy2(src, dest)
    copied_count += 1

def get_lite_path(src_path: Path, mode: str) -> Path:
    relative = src_path.relative_to(PURE / mode)
    ext = src_path.suffix.lower()
    if ext in OPUS_EXT or ext in LOSSLESS_EXT:
        relative = relative.with_suffix(".mp3")
    return LITE / relative

def process_directory(mode: str):
    global skipped_count
    src_root = PURE / mode
    for root, _, files in os.walk(src_root):
        for filename in files:
            src = Path(root) / filename
            ext = src.suffix.lower()

            if filename.startswith("."):
                continue

            dest = get_lite_path(src, mode)

            if mode == "LOSSLESS" and ext in LOSSLESS_EXT:
                if needs_update(src, dest):
                    convert_to_mp3(src, dest)
                else:
                    skipped_count += 1

            elif mode == "LOSSY":
                if ext in LOSSY_COPY_EXT:
                    if needs_update(src, dest):
                        copy_file(src, dest)
                    else:
                        skipped_count += 1
                elif ext in OPUS_EXT:
                    if needs_update(src, dest):
                        convert_to_mp3(src, dest, warn_opus=True)
                    else:
                        skipped_count += 1

def main():
    print("🌿 Starting LITE regeneration from PURE (MP3 V0)...\n")
    process_directory("LOSSLESS")
    process_directory("LOSSY")
    print("\n🌷 LITE library is now up to date.")
    print(f"🧾 Files converted: {converted_count}")
    print(f"🧾 Files copied:    {copied_count}")
    print(f"🫥 Files already up to date: {skipped_count}")

if __name__ == "__main__":
    main()
#
#
#
# #!/usr/bin/env python3
#
# import os
# import shutil
# import subprocess
# from pathlib import Path
#
# # Base paths
# PURE = Path.home() / "Music" / "PURE"
# LITE = Path.home() / "Music" / "LITE"
#
# # Supported extensions
# LOSSLESS_EXT = {".flac", ".wav", ".alac", ".aiff"}
# LOSSY_COPY_EXT = {".ogg", ".mp3", ".m4a", ".aac"}
# OPUS_EXT = {".opus"}
#
# # Global counters
# converted_count = 0
# copied_count = 0
# skipped_count = 0
#
# def needs_update(src: Path, dest: Path) -> bool:
#     return not dest.exists() or src.stat().st_mtime > dest.stat().st_mtime
#
# def convert_to_ogg(src: Path, dest: Path, warn_opus=False):
#     global converted_count
#     dest.parent.mkdir(parents=True, exist_ok=True)
#     print(f"🎧 Converting: {src} → {dest}")
#     if warn_opus:
#         print("🚨 OPUS file detected in LOSSY! This should not happen. Converting as fallback... 🚨")
#     subprocess.run([
#         "ffmpeg",
#         "-i", str(src),
#         "-map", "0:a",
#         "-c:a", "libvorbis",
#         "-q:a", "6",
#         "-map", "0:v?",
#         "-c:v", "libtheora",
#         "-q:v", "10",
#         "-disposition:v", "attached_pic",
#         "-y",
#         str(dest)
#     ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
#     converted_count += 1
#
# def copy_file(src: Path, dest: Path):
#     global copied_count
#     dest.parent.mkdir(parents=True, exist_ok=True)
#     print(f"📥 Copying: {src} → {dest}")
#     shutil.copy2(src, dest)
#     copied_count += 1
#
# def get_lite_path(src_path: Path, mode: str) -> Path:
#     # Remove PURE/LOSSLESS or PURE/LOSSY prefix and normalize extension if needed
#     relative = src_path.relative_to(PURE / mode)
#     if src_path.suffix.lower() in OPUS_EXT or src_path.suffix.lower() in LOSSLESS_EXT:
#         relative = relative.with_suffix(".ogg")
#     return LITE / relative
#
# def process_directory(mode: str):
#     global skipped_count
#     src_root = PURE / mode
#     for root, _, files in os.walk(src_root):
#         for filename in files:
#             src = Path(root) / filename
#             ext = src.suffix.lower()
#
#             if filename.startswith("."):
#                 continue  # ignore hidden files
#
#             dest = get_lite_path(src, mode)
#
#             if mode == "LOSSLESS" and ext in LOSSLESS_EXT:
#                 if needs_update(src, dest):
#                     convert_to_ogg(src, dest)
#                 else:
#                     skipped_count += 1
#
#             elif mode == "LOSSY":
#                 if ext in LOSSY_COPY_EXT:
#                     if needs_update(src, dest):
#                         copy_file(src, dest)
#                     else:
#                         skipped_count += 1
#                 elif ext in OPUS_EXT:
#                     if needs_update(src, dest):
#                         convert_to_ogg(src, dest, warn_opus=True)
#                     else:
#                         skipped_count += 1
#
# def main():
#     print("🌿 Starting LITE refresh / regen from PURE...\n")
#     process_directory("LOSSLESS")
#     process_directory("LOSSY")
#     print("\n🌷 LITE library is now up to date.")
#     print(f"🧾 Files converted: {converted_count}")
#     print(f"🧾 Files copied:    {copied_count}")
#     print(f"🫥 Files already up to date: {skipped_count}")
#
# if __name__ == "__main__":
#     main()
#
