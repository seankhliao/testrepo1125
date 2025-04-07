#!/bin/bash

cd $1
go mod init go.seankhliao.com/testrepo1125/$1

cat << EOF >> go.mod

tool go.seankhliao.com/testrepo1125/$1-tool
EOF

cat << EOF > main.go
package indirect

import (
    "fmt"
    _ "go.seankhliao.com/testrepo1125/$1-direct"
)

func init() {
    fmt.Println("$1")
}

var V = "$1"
EOF

cat << EOF > main_test.go
package indirect

import (
    _ "go.seankhliao.com/testrepo1125/$1-direct"
)
EOF
