#!/bin/bash

if [ -z "$AZP_URL" ]; then
  echo "Error: AZP_URL environment variable is not set"
  exit 1
fi

if [ -z "$AZP_TOKEN" ]; then
  echo "Error: AZP_TOKEN environment variable is not set"
  exit 1
fi

if [ -z "$AZP_AGENT_NAME" ]; then
  AZP_AGENT_NAME=$(hostname)
fi

if [ -z "$AZP_POOL" ]; then
  AZP_POOL="Default"
fi

./config.sh --unattended \
  --agent "${AZP_AGENT_NAME}" \
  --url "${AZP_URL}" \
  --auth PAT \
  --token "${AZP_TOKEN}" \
  --pool "${AZP_POOL}" \
  --work _work \
  --replace

# Start the agent
./run.sh
