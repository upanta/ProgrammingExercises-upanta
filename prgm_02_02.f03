      Program prgm_02_02
!
!
!
      implicit none
      integer::i, n1, n2, delta
      real:: m, l, b, V, PIB_1D_Modified_V_Element

      real,parameter::pi=4.0*ATAN(1.0)
666 format(1X,'Potential energy matrix element ',I5,',',I5,' is ',F12.5,'.')
!
!     write(*,*)' Value of pi=', pi
!
!     Start by asking the user for the parameters.
!
      write(*,*)' What is the mass of the particle?'
      read(*,*) m
      write(*,*)' What is the length of the box?'
      read(*,*) l
      write(*,*)' What is the quantum number of the first eigenstate?'
      read(*,*) n1
      write(*,*)' What is the quantum number of the second eigenstate?'
      read(*,*) n2
      write(*,*)' What is the value of b in V(x)=bx?'
      read(*,*) b
!
!
      V = PIB_1D_Modified_V_Element(b, n1, n2, l) 
      write(*, 666) n1, n2, V

      End Program prgm_02_02




real Function PIB_1D_Modified_V_Element(b, n1, n2, L)
      implicit none
      real,parameter::pi=4.0*atan(1.0)
      integer, intent(IN):: n1,n2
      real, intent(IN)::b, L
      real:: V
    

      if (n1.ne.n2) then     
        V = (b*L/pi**2)*((((-1)**(n1-n2) - 1)/(n1-n2)**2) - (((-1)**(n1+n2) - 1)/(n1+n2)**2))
      else
        V=0
      end if

      PIB_1D_Modified_V_Element = V
      end function
