# The user should provide a similar file with configuration variables.

# This file should be put into /config in the container.

GIT_USE_SSH=true

GIT_SERVER=github.com
GIT_USER=git
GIT_REPO=demo/example

# This will only be used if GIT_USE_SSH is false
# useful for public repositories or if you provide the password directly
GIT_URL=

# This is the only variable that can be provided directly to the container
# (because of the password)
MC_HOST_origin=https://Q3AM3UQ867SPQQA43P2F:zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG@play.min.io
# if you do, don't put the variable in config at all

# Path (in server) and destination (relative to git repository)
MC_PATH=/backup/hass_storage.zip
MC_LOCAL_DESTINATION=./
