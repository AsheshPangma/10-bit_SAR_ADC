# Magic DRC smoke test: one legal and one illegal metal-1 shape
load drc_smoke
drc on
# 1 um x 1 um square: legal
box 0 0 1um 1um
paint m1
# 0.10 um wide strip: below the metal-1 minimum width
box 2um 0 2.1um 1um
paint m1
select top cell
drc check
drc catchup
puts "DRC_COUNT [drc list count total]"
quit -noprompt
