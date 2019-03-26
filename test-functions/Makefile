ZIP=zip
all: uq_rosenbrock.zip uq_expTanh.zip uq_gaytonHat.zip uq_branin.zip uq_liquidHydrogenTank.zip uq_fourBranch.zip uq_otlCircuit.zip

uq_rosenbrock.zip: ./rosenbrock/uq_rosenbrock.m ./rosenbrock/uq_Example_rosenbrock.m LICENSE
	$(ZIP) -j ./rosenbrock/$@ $^
uq_expTanh.zip: ./expTanh/uq_expTanh.m ./expTanh/uq_Example_expTanh.m LICENSE
	$(ZIP) -j ./expTanh/$@ $^
uq_gaytonHat.zip: ./gaytonHat/uq_gaytonHat.m ./gaytonHat/uq_Example_gaytonHat.m LICENSE
	$(ZIP) -j ./gaytonHat/$@ $^
uq_branin.zip: ./branin/uq_branin.m ./branin/uq_Example_branin.m LICENSE
	$(ZIP) -j ./branin/$@ $^
uq_liquidHydrogenTank.zip: ./liquidHydrogenTank/uq_liquidHydrogenTank.m ./liquidHydrogenTank/uq_Example_liquidHydrogenTank.m LICENSE
	$(ZIP) -j ./branin/$@ $^
uq_fourBranch.zip: ./fourBranch/uq_fourBranch.m ./fourBranch/uq_Example_fourBranch.m LICENSE
	$(ZIP) -j ./fourBranch/$@ $^
uq_otlCircuit.zip: ./otlCircuit/uq_otlCircuit.m ./otlCircuit/uq_Example_otlCircuit.m LICENSE
	$(ZIP) -j ./otlCircuit/$@ $^
