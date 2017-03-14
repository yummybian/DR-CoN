#!/bin/bash

service nginx start
consul-template -consul=$CONSUL_URL -template "$CT_FILE:$NX_FILE:service nginx reload"



