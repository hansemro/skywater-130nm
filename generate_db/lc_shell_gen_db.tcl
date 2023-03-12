read_lib sky130_fd_sc_hd__ss_100C_1v40.lib
write_lib "[get_object_name [get_libs]]" -format db -output sky130_fd_sc_hd__ss_100C_1v40.db
remove_lib "[get_object_name [get_libs]]"

read_lib sky130_fd_sc_hd__tt_025C_1v80.lib
write_lib "[get_object_name [get_libs]]" -format db -output sky130_fd_sc_hd__tt_025C_1v80.db
remove_lib "[get_object_name [get_libs]]"

read_lib sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib
write_lib "[get_object_name [get_libs]]" -format db -output sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.db
remove_lib "[get_object_name [get_libs]]"
exit
