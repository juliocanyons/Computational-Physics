PROGRAM newtonrampson
  IMPLICIT NONE
  INTEGER ::  d
  INTEGER :: i
  REAL, ALLOCATABLE, DIMENSION(:) :: x
  REAL, EXTERNAL :: fx,derv
  WRITE(*,*) "NUMBER OF ITERATION?"
  READ(*,*) d
  ALLOCATE (x(d))
x(1)=5
DO i=1,d
     CALL rampson(x,i,d,fx,derv)
END DO
WRITE(*,*) x
END PROGRAM newtonrampson
!------------------------------------------------------------
SUBROUTINE rampson(x,n,d,fx ,derv)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: n, d
  REAL, DIMENSION(d) :: x
  REAL,  EXTERNAL :: fx ,derv
  x(n+1)=x(n)-fx(x(n))/derv(x(n))
END SUBROUTINE rampson
!------------------------------------------------------------
REAL FUNCTION fx(x)
  IMPLICIT NONE
  REAL, INTENT(IN) :: x
  fx=x**2-4*x-7
END FUNCTION fx
!------------------------------------------------------------
REAL FUNCTION derv(x)
  IMPLICIT NONE
  REAL, INTENT(IN) :: x
  derv=2*x-4
END FUNCTION derv
!------------------------------------------------------------
SUBROUTINE imprimir
  WRITE(*,100)
  WRITE(*,100)
  WRITE(*,110) "NEWTON RAMPSON METHOD"
  WRITE(*,100)

100 FORMAT ("======================================================================")  
110 FORMAT (A40)  

END SUBROUTINE imprimir
!------------------------------------------------------------
