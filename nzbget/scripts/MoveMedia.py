#!/usr/bin/env python

#########################################################################################
### NZBGET POST-PROCESSING SCRIPT

# Move downloaded videos.
#
# This script moves download videos from the download directory to a central location.
# This should be the last script to execute following a download because it may delete
# the download-destination directory upon completion depending upon the `deleteDir`
# option.

### OPTIONS
# Media Extensions
#
# This is a list of file extensions which define what a "video" file is.
#mediaExtensions=.mkv,.avi,.divx,.xvid,.mov,.wmv,.mp4,.mpg,.mpeg,.vob,.iso

# Destination Directory
#
# This is the path to the directory where all media files should be moved.
#destDirectory=/storage/media

# Delete Download Directory
#
# This specifies whether or not the download directory should be removed after the
# file has been moved. (True/False)
#deleteDir=True

### NZBGET POST-PROCESSING SCRIPT
#########################################################################################

import os
import sys
import shutil

## Define the proper exit codes for NZBGet 
POSTPROCESS_SUCCESS = 93
POSTPROCESS_FAILURE = 94
POSTPROCESS_SKIPPED = 95

## A function for logging messages with the appropriate NZBGet formatting.
def log_message(type, msg):
    print "[" + type.upper() + "] " + msg

## A function that checks whether a file pointed at `filePath` is to be considered
## a media file or not.
def is_media_file(filePath):
    ## Check that the given path leads to a file.
    if not os.path.isfile(filePath):
        return False

    ## Get array of file extensions as specified via 'mediaExtensions'.
    extensions = os.environ['NZBPO_MEDIAEXTENSIONS'].split(',')

    ## Retrieve the file extension from the path.
    fileName, fileExtension = os.path.splitext(filePath)

    if fileExtension in extensions:
        return True

    return False

######

## Check status of par-check/repair.
if os.environ['NZBPP_PARSTATUS'] in [1,3]:
    log_message("error", "PAR repair has either failed or has been disabled. Unable to continue.")
    sys.exit(POSTPROCESS_FAILURE)

if os.environ['NZBPP_UNPACKSTATUS'] in [0,1]:
    log_message("error", "Unpack has either failed or has been disabled. Unable to continue.")
    sys.exit(POSTPROCESS_FAILURE)

## If we've made it this far, then it looks like everything is honkeydorey.

## Should we delete the source directory after we're done?
shouldRmSrc = os.environ['NZBPO_DELETEDIR'].upper() == "TRUE"

## Where should we move the files from and to?
sourceDir = os.environ['NZBPP_DIRECTORY']
targetDir = os.environ['NZBPO_DESTDIRECTORY']
nzbName = os.environ['NZBPP_NZBNAME']

## Check if directory paths are valid and mutable.
if not (os.path.isdir(sourceDir) and os.access(sourceDir, os.W_OK)):
    log_message("error", "The source path is either not a directory or is unmutable: " + sourceDir)
    sys.exit(POSTPROCESS_FAILURE)

if not (os.path.isdir(targetDir) and os.access(targetDir, os.W_OK)):
    log_message("error", "The target path is either not a directory or is unmutable: " + targetDir)
    sys.exit(POSTPROCESS_FAILURE)

## Keep track of number of files moved.
moveCount = 0

## Check and move files if necessary
for dirpath, dirnames, filenames in os.walk(sourceDir):
    for file in filenames:
        tFile = file

        ## If the file name isn't long enough, then it's likely invalid (i.e. 123.mkv)
        ## in which case, we would want to prepend it with the NZB name.
#        if len(tFile) < 15:
#          tFile = nzbName + " " + tFile

        srcPath = os.path.join(dirpath, file)

	_, file_ext = os.path.splitext(srcPath)
	tFile = nzbName + file_ext

        dstPath = os.path.join(targetDir, tFile)

        if is_media_file(srcPath):
            log_message("detail", "Moving file to destination: " + srcPath + " -> " + dstPath)

            try:
                os.rename(srcPath, dstPath)
                moveCount += 1
            except:
                log_message("error", "Unable to move file to destination: " + file)
                sys.exit(POSTPROCESS_FAILURE)

## If we've moved a file, then remove the source directory if necessary, before exiting.
if moveCount > 0:
    if shouldRmSrc:
        log_message("detail", "Removing source directory as requested: " + sourceDir)
        try:
            shutil.rmtree(sourceDir)
        except:
            log_message("error", "Unable to remove source directory: " + sourceDir)
            sys.exit(POSTPROCESS_FAILURE)

    log_message("info", "Successfully moved " + str(moveCount) + " files.")
    sys.exit(POSTPROCESS_SUCCESS)

log_message("info", "Nothing moved.")
sys.exit(POSTPROCESS_SKIPPED)


