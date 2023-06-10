# CSE 549 - Final Project
=========================================================
## Implementation of a lightweight helper thread in vanilla core
=========================================================
## Team - Sushree Subhasmita Jena and Pranav S Murali
=========================================================

This repository contains all the changes that were made to implement a lightweight helper thread for the hammerblade. Please refer to the project report for details regarding the implementation. Changes were made to the files vanilla_core.v and icache.v files.

### Instructions to run the project

1. Copy the files vanilla_core.v and icache.v files over to your existing hammerblade repository
2. Copy the main.S assembly file to the path /bsg_bladerunner/bsg_manycore/software/spmd/finish_asm
3. Navigate to /bsg_bladerunner/bsg_replicant and open machine.mk
4. Set BSG_MACHINE_PATH ?= $(BSG_F1_DIR)/machines/pod_X1Y1_ruche_X4Y2_hbm_one_pseudo_channel
5. Navigae to bsg_bladerunner/bsg_replicant/examples/Makefile
6. Change "TARGETS = library spmd cuda python" to just "TARGETS = spmd" 
7. Navigate to bsg_bladerunner/bsg_replicant/examples/spmd/Makefile
8. Comment out all "TESTS +=" lines and add "TESTS += finish_asm"
9. Navigate to bsg_bladerunner/bsg_replicant/examples/spmd/loader.mk
10. Change "regression: exec.log" to "regression: debug.log"
11. Navigate to bsg_bladerunner/bsg_replicant/libraries/platforms/bigblade-vcs/link.mk
12. Comment out all "REGRESSION_PREBUILD += $(BSG_MACHINExPLATFORM_PATH)/X/simv" with X= exec, repl, profile, saifgen, pc-histogram.
13. Navigate to bsg_replicant/examples/
14. Run "make regression"
15. Navigate to examples/spmd/finish_asm
16. debug.fsdb can be opened on Verdi

