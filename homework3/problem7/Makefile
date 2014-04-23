# $UWHPSC/codes/fortran/newton/Makefile

OBJECTS_test1 = functions.o newton.o test1.o
OBJECTS_intersections = functions.o newton.o intersections.o
OBJECTS_quartic = functions.o newton.o test_quartic.o
MODULES = functions.mod newton.mod

FFLAGS = -g

.PHONY: test1 clean 

test1: test1.exe
	./test1.exe

test1.exe: $(MODULES) $(OBJECTS_test1)
	gfortran $(FFLAGS) $(OBJECTS_test1) -o test1.exe

intersections: intersections.exe
	./intersections.exe

test_quartic.exe: $(MODULES) $(OBJECTS_quartic)
	gfortran $(FFLAGS) $(OBJECTS_quartic) -o test_quartic.exe

test_quartic: test_quartic.exe
	./test_quartic.exe

intersections.exe: $(MODULES) $(OBJECTS_intersections)
	gfortran $(FFLAGS) $(OBJECTS_intersections) -o intersections.exe


%.o : %.f90
	gfortran $(FFLAGS) -c  $< 

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f *.o *.exe *.mod

