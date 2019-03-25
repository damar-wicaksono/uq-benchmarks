ZIP=zip
all: uq_rosenbrock.zip uq_expTanh.zip

uq_rosenbrock.zip: ./rosenbrock/uq_rosenbrock.m ./rosenbrock/uq_Example_rosenbrock.m LICENSE
	$(ZIP) -j ./rosenbrock/$@ $^
uq_expTanh.zip: ./expTanh/uq_expTanh.m ./expTanh/uq_Example_expTanh.m LICENSE
	$(ZIP) -j ./expTanh/$@ $^
