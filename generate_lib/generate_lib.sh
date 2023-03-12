# Generates lib file and performs hotfixes for adk
# Author: Charles Tsao

# Generate lib file
python $TOP/generate_lib/generate_lib.py

process_lib() {
    # Hotfix for issue #183
    lines=$(grep -n 'sky130_fd_sc_hd__lpflow_lsbuf_lh_hl_isowell_tap' $1 | cut -f1 -d:)
    offset=0
    for line in $lines; do
        line=$(($line + 22 + offset))
        sed -i "$line a \\
        pg_pin (\"VNB\") {\\
            pg_type : \"pwell\";\\
            physical_connection : \"device_layer\";\\
            voltage_name : \"VNB\";\\
        }" $1
        offset=$(($offset + 5))
    done
    offset=0
    lines=$(grep -n 'sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell_tap' $1 | cut -f1 -d:)
    for line in $lines; do
        line=$(($line + 26 + offset))
        sed -i "$line a \\
        pg_pin (\"VNB\") {\\
            pg_type : \"pwell\";\\
            physical_connection : \"device_layer\";\\
            voltage_name : \"VNB\";\\
        }" $1
        offset=$(($offset + 5))
    done

    lc_shell -x "read_lib $1; exit"

    cp $1 $TOP/generate_db
}

process_lib $TOP/generate_lib/sky130_fd_sc_hd__ss_100C_1v40.lib
process_lib $TOP/generate_lib/sky130_fd_sc_hd__tt_025C_1v80.lib
process_lib $TOP/generate_lib/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib

cp $TOP/generate_lib/sky130_fd_sc_hd__ss_100C_1v40.lib $TOP/view-standard/stdcells-wc.lib
cp $TOP/generate_lib/sky130_fd_sc_hd__tt_025C_1v80.lib $TOP/view-standard/stdcells.lib
cp $TOP/generate_lib/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib $TOP/view-standard/stdcells-bc.lib
