# Smoke tests for the SKY130 environment. Run inside the container.

ifneq ($(PDK),sky130A)
$(error PDK is '$(PDK)', expected sky130A. Run 'sak-pdk sky130A' first)
endif

MAGICRC := $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc

.PHONY: smoke
smoke:
	   @echo "=== 1/3 ngspice: NMOS transfer curve ==="
	   cd sim/smoke && ngspice -b nfet_idvg.spice | tee nfet_idvg.log
	   awk '/^id_on/ {v = $$3; found = 1} END {exit !(found && v > 1e-4 && v < 1e-3)}' sim/smoke/nfet_idvg.log
	   @echo "=== 2/3 Magic: DRC must find the narrow strip ==="
	   magic -dnull -noconsole -rcfile $(MAGICRC) layout/smoke/drc_smoke.tcl | tee layout/smoke/drc.log
	   grep -Eq '^DRC_COUNT [1-9]' layout/smoke/drc.log
	   @echo "=== 3/3 KLayout: SKY130 technology registered ==="
	   klayout -b -r scripts/klayout_tech.py
	   @echo "=== make smoke: all three checks passed ==="
