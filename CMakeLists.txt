cmake_minimum_required (VERSION 3.10)
project (SANDBOX
  VERSION 0.0.0
  LANGUAGES Fortran
)

find_package(MPI REQUIRED Fortran)

add_executable(prog sandbox.f90)
target_link_libraries(prog PRIVATE MPI::MPI_Fortran)