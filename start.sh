#!/usr/bin/env bash

set -e -o pipefail

if [ -z "$APOLLO_KEY" ]; then
  echo "Must set APOLLO_KEY in the environment to a Consumer key from Apollo Studio"
  exit 1;
fi

if [ -z "$APOLLO_GRAPH_REF" ]; then
  echo "Must set APOLLO_GRAPH_REF in the environment (e.g., my-graph@current)"
  exit 1;
fi

/app/router --config /app/config.yaml --supergraph /app/supergraph.graphql
