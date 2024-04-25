RTL_DIR = ./rtl
TB_DIR = ./tb
SV_SOURCES = $(wildcard $(RTL_DIR)/*.sv)
IVERILOG = iverilog
IVERILOG_FLAGS = -Wall -gspecify -g2012

VVP = vvp
VVP_FLAGS =
RUN_DIR = ./run
TOP = alu

sim-top: $(RUN_DIR)/tb_$(TOP).vcd
	gtkwave -6 -a a.gtkw $^ 

$(RUN_DIR):
	mkdir -p "$(RUN_DIR)"

$(RUN_DIR)/$(TOP).vvp: rtl.f | $(RUN_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -f rtl.f -o $@

$(RUN_DIR)/tb_%.vvp: rtl.f | $(RUN_DIR)
	$(IVERILOG) $(IVERILOG_FLAGS) -f rtl.f $(TB_DIR)/tb_$*.sv -o $@

$(RUN_DIR)/tb_%.vcd: $(RUN_DIR)/tb_%.vvp
	cd $(RUN_DIR) && $(VVP) $(VVP_FLAGS) -v ../$^

.PHONY: clean
clean:
	[ -d "$(RUN_DIR)" ] && rm -rf "$(RUN_DIR)" || true

