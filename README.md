[200~# 10-bit SAR ADC in SKY130

Fully differential 10-bit, 1 MS/s SAR ADC taken from specification to
post-layout sign-off with open-source tools. Fabrication is out of scope.

## Environment

- Image: `hpretl/iic-osic-tools@sha256:<digest>` (release `<tag>`)
- PDK: sky130A
- Host: Windows 11, Docker Desktop (WSL2)

## Quick start

In the container:

    cd /foss/designs/10-bit_SAR_ADC
    make smoke

## Repository layout

- `docs/notebook/` weekly lab notebook
- `docs/spec/` specification and verification plan
- `model/` Python behavioural model and tests
- `xschem/` schematics and symbols
- `sim/` testbenches
- `layout/` Magic and KLayout views
- `netgen/` LVS setup
- `rtl/` SAR controller
- `scripts/` helper scripts

## Status

Week 1: environment, smoke tests, ADC metrics.

## Licence

Apache-2.0
