package kube

import (
  "tool/cli"
)

command dump: {
  task print: cli.Print & {
    text: yaml.MarshalStream(objects)
  }
}

