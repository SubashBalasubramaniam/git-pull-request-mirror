# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM gcr.io/google_appengine/golang

ENV GOPATH "/go/"
RUN apt-get update -yq && \
    apt-get install -yq git-core

COPY . /go/src/github.com/google/git-pull-request-mirror
COPY . /go/src

RUN export GOPATH="/go/" && \
    go get github.com/google/go-github/github && \
    go get github.com/google/git-appraise/git-appraise && \
    go get google.golang.org/appengine && \
    go get golang.org/x/oauth2 && \
    go-wrapper install -tags appenginevm
