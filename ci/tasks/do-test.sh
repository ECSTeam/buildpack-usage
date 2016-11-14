#!/bin/sh
basedir=`pwd`/gopath/src/github.com/ecsteam/buildpack-usage
outdir=`pwd`/gopath-tested

mkdir -p ${outdir} > /dev/null 2>&1

set -e
set -x

export GOPATH=`pwd`/gopath

apk update && apk upgrade && apk add git

# Install Glide
go get -u github.com/Masterminds/glide/...
go get -u github.com/onsi/ginkgo/...
go get -u github.com/onsi/gomega/...

# Vendor dependencies
cd ${basedir}
$GOPATH/bin/glide install

# Run tests
$GOPATH/bin/ginkgo -r .
#go test `$GOPATH/bin/glide novendor`
cd -

cp -Rvf `pwd`/gopath/src ${outdir}/
cp -Rvf `pwd`/gopath/bin ${outdir}/
cp -Rvf `pwd`/gopath/pkg ${outdir}/
