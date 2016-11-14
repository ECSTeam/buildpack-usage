package main

import (
	"github.com/cloudfoundry/cli/plugin"
	"github.com/ecsteam/buildpack-usage/command"
)

func main() {
	cmd := command.New()
	plugin.Start(cmd)
}
