#!/usr/bin/env bash

pub global activate wrike_build_cli '<7.0.0'
pub global run wrike_build_cli $1
