#!/bin/sh

container_cmd=docker
container_args="-w /board -v $(pwd):/board --rm"

${container_cmd} run ${container_args} yaqwsx/kikit:v1.0.0 pcbdraw --style style.json output/pcbs/board-routed.kicad_pcb images/board-front.png
${container_cmd} run ${container_args} yaqwsx/kikit:v1.0.0 pcbdraw -b --style style.json output/pcbs/board-routed.kicad_pcb images/board-back.png
# ${container_cmd} run ${container_args} yaqwsx/kikit:v0.7 kikit fab jlcpcb --no-assembly output/pcbs/board-routed.kicad_pcb production/pcb/board
