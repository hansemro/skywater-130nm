# Generates db file
# Author: Charles Tsao

# Generate db file using lc_shell
lib_to_db () {
    lc_shell -x "read_lib $1; \
        write_lib [get_object_name [get_libs]] -format db -output ${1%.lib}.db; \
        exit"
}

lib_to_db $TOP/generate_db/sky130_fd_sc_hd__ss_100C_1v40.lib
lib_to_db $TOP/generate_db/sky130_fd_sc_hd__tt_025C_1v80.lib
lib_to_db $TOP/generate_db/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib

cp $TOP/generate_db/sky130_fd_sc_hd__ss_100C_1v40.db $TOP/view-standard/stdcells-wc.db
cp $TOP/generate_db/sky130_fd_sc_hd__tt_025C_1v80.db $TOP/view-standard/stdcells.db
cp $TOP/generate_db/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.db $TOP/view-standard/stdcells-bc.db
