# Package

version       = "0.1.0"
author        = "Kristian Mandrup"
description   = "RxJS 6.5 bindings for Nim"
license       = "Apache2"
skipDirs      = @["example"]

# Dependencies

requires "nim >= 1.0.0"

task example, "builds example application":
  --define: release
  switch("out", "example/app.js")
  --path: "."
  setCommand "js", "example/app.nim"