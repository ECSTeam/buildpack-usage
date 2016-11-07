package main

import (
	"github.com/cloudfoundry/cli/plugin"
	"github.com/tom-collings/buildpack-usage/command"
)

func main() {
	cmd := command.New()
	plugin.Start(cmd)
}
