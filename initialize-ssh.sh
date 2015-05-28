#!/bin/bash
#
# Clones the repositories using 'ssh'. Use the 'initialize-https' if you prefer
# to use 'https' in cloning the repositories.

# Default to N4SJAMK if no user is given.
USER=${1-N4SJAMK}

# Clone our repositories.
git clone git@github.com:$USER/teamboard-io.git           io
git clone git@github.com:$USER/teamboard-api.git          api
# git clone git@github.com:$USER/teamboard-client.git       client
git clone git@github.com:$USER/teamboard-client-react.git client-react
git clone git@github.com:$USER/teamboard-img.git 	  img

# Set 'upstream' to the original repository.
(cd io           && git remote add upstream git@github.com:N4SJAMK/teamboard-io.git)
(cd api          && git remote add upstream git@github.com:N4SJAMK/teamboard-api.git)
# (cd client       && git remote add upstream git@github.com:N4SJAMK/teamboard-client.git)
(cd client-react && git remote add upstream git@github.com:N4SJAMK/teamboard-client-react.git)
(cd img && git remote add upstream git@github.com:N4SJAMK/teamboard-img.git)
