#!/bin/sh

# container_cmd=podman
container_cmd=docker
container_args="-w /board -v $(pwd):/board --rm"

rm -rf output
npm run gen
${container_cmd} run ${container_args} soundmonster/kicad-automation-scripts:latest /usr/lib/python2.7/dist-packages/kicad-automation/pcbnew_automation/export_dsn.py output/pcbs/board.kicad_pcb output/pcbs/board.dsn
# ${container_cmd} run ${container_args} soundmonster/freerouting_cli:v0.1.0 java -jar /opt/freerouting_cli.jar -de output/pcbs/board.dsn -do output/pcbs/board.ses
# pcbdraw also supports a style file as JSON
# ${container_cmd} run ${container_args} soundmonster/kicad-automation-scripts:latest /usr/lib/python2.7/dist-packages/kicad-automation/pcbnew_automation/import_ses.py output/pcbs/board.kicad_pcb output/pcbs/board.ses --output-file output/pcbs/board-routed.kicad_pcb
# ${container_cmd} run ${container_args} soundmonster/kicad-automation-scripts:latest /usr/lib/python2.7/dist-packages/kicad-automation/pcbnew_automation/run_drc.py output/pcbs/board-routed.kicad_pcb output/pcbs/drc/
