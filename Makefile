FC = mpifrtpx
FFLAGS= -Kfast
SRC= matmult.f90
OBJ= matmult.exe

ifdef TAU_SOURCE
$(info TAU source based instrumentation)
$(info TAU=$(TAU))
$(info TAU_MAKEFILE=$(TAU_MAKEFILE))
FC = tau_f90.sh
OBJ= matmult_tsrc.exe
endif

ifdef TAU_COMPINST
$(info TAU compiler based instrumentation)
$(info TAU=$(TAU))
$(info TAU_MAKEFILE=$(TAU_MAKEFILE))
FC = tau_f90.sh
TAU_FLAGS= -tau_options=-optCompInst
OBJ= matmult_tcmp.exe
endif

all: $(OBJ)

$(OBJ): $(SRC)
	$(FC) $(TAU_FLAGS) $(FFLAGS) -o $(OBJ) $<

clean:
	rm *.exe
	
cleanall:
	rm *.exe *.o *for_script*