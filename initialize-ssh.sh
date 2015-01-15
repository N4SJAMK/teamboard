#!/bin/bash

# Default to N4SJAMK if no user is given.
USER=${1-N4SJAMK}

# Clone our repositories.
git clone git@github.com/$USER/teamboard-io.git     io
git clone git@github.com/$USER/teamboard-api.git    api
git clone git@github.com/$USER/teamboard-client.git client

# Set 'upstream' to the original repository.
(cd io     && git remote add upstream git@github.com/N4SJAMK/teamboard-io.git)
(cd api    && git remote add upstream git@github.com/N4SJAMK/teamboard-api.git)
(cd client && git remote add upstream git@github.com/N4SJAMK/teamboard-client.git)
