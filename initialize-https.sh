#!/bin/bash

# Default to N4SJAMK if no user is given.
USER=${1-N4SJAMK}

# Clone our repositories.
git clone https://github.com/$USER/teamboard-io     io
git clone https://github.com/$USER/teamboard-api    api
git clone https://github.com/$USER/teamboard-client client

# Set 'upstream' to the original repository.
(cd io     && git remote add upstream https://github.com/N4SJAMK/teamboard-io)
(cd api    && git remote add upstream https://github.com/N4SJAMK/teamboard-api)
(cd client && git remote add upstream https://github.com/N4SJAMK/teamboard-client)
