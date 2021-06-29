program simple
    implicit none
    include 'mpif.h'

    ! Variables for MPI process info
    integer:: rank, comm_size, len_hostname, mpi_version_major, mpi_version_minor
    character(MPI_MAX_PROCESSOR_NAME) hostname

    ! Program variables
    integer ierr

    ! Initialize MPI and get process info
    call mpi_init(ierr)
    call mpi_comm_size(MPI_COMM_WORLD, comm_size, ierr)
    call mpi_comm_rank(MPI_COMM_WORLD, rank, ierr)
    call mpi_get_processor_name(hostname, len_hostname, ierr)
    call mpi_get_version(mpi_version_major, mpi_version_minor, ierr)

    ! Print process info
    if (rank == 0) then
        print '("Environment info")'
        print '(2x,"* mpi_version:",5x,i0,".",i0)', mpi_version_major, mpi_version_minor
        print '(2x,"* mpi_comm_world:",2x,i0)', comm_size
        print *
    end if
    call mpi_barrier(MPI_COMM_WORLD, ierr)

    print '("Proc(rank: ",i0.5,", hostname: ",a,")")',rank,trim(hostname)
    call mpi_barrier(MPI_COMM_WORLD, ierr)

    ! done with MPI
    call mpi_finalize(ierr)
    
    ! Print done
    if (rank == 0) then
        print '(/,"Done.")'
    end if
end