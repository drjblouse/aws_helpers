#!/bin/bash

docker ps --format "{{.ID}}: {{.Names}} - {{.Status}}"
