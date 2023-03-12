from shutil import copyfile
import os

SKYWATER130_HOME = os.environ['SKYWATER130_HOME']
TOP = os.environ['TOP']
LIBS = ['sky130_fd_sc_hd__ss_100C_1v40.lib',
        'sky130_fd_sc_hd__tt_025C_1v80.lib',
        'sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib']

for LIB in LIBS:
    copyfile(SKYWATER130_HOME + '/libs.ref/sky130_fd_sc_hd/lib/' + LIB, TOP + '/generate_lib/' + LIB)

    with open(LIB, 'r') as f:
        fdata = f.read()

    # Hotfix for issue #183
    fdata = fdata.replace(
    """
            internal_node : "M0";
            related_ground_pin : "VNB";
    """,
    """
            internal_node : "M0";
            related_ground_pin : "VGND";
    """
    )

    with open(LIB, 'w') as f:
        f.write(fdata)
