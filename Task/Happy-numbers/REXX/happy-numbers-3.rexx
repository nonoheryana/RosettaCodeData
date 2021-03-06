/*REXX program displays  eight (or a specified range of) happy  numbers.*/
parse arg L H .                        /*get optional args:  low & high */
if L=='' | L==',' then L=8             /*Not specified? Set L to default*/
if H=='' | H==',' then do; H=L; L=1; end  /*use a range for the showing.*/
haps=0                                 /*count of happy numbers so far. */
@.=0;     !.=0                         /*sparse array: happy&unhappy #s.*/
out=                                   /*the output line (of happy nums)*/
sw=linesize()                          /*obtain the linesize of term scr*/

  do n=1  while haps<H;   q=n;  a.=0   /*search integers starting at  1.*/
  if !.n  then iterate                 /*if  N  is unhappy, try another.*/

    do  until q==1                     /*see if  Q  is a happy number.  */
    s=0                                /*prepare to add squares of digs.*/
            do j=1  for length(q)      /*sum the squares of the digits. */
            s=s+substr(q,j,1)**2       /*add the square  of  a  digit.  */
            end   /*j*/

    if @.s  then do; q=1; iterate; end /*we have found a  happy  number.*/
    if !.s  then iterate n             /*Sum unhappy?  Then Q is unhappy*/
    if a.s  then do                    /*If already summed? Q is unhappy*/
                 !.q=1;   !.s=1        /*mark  Q & S  as unhappy numbers*/
                 iterate n             /*if already summed, Q is unhappy*/
                 end
    a.s=1;  q=s                        /*mark sum as found, try  Q  sum.*/
    end   /*until*/

  @.n=1                                /*mark   N  as a happy number.   */
  haps=haps+1                          /*bump the count of happy numbers*/
  if haps<L  then iterate              /*don't display,  N  is too low. */
  if length(out n)>sw  then do         /*maybe display the happy number.*/
                            say strip(out)   /*line is too long, tell it*/
                            out=             /*nullify the  OUT  (line).*/
                            end
  out=out n                            /*append the happy number to OUT.*/
  end     /*n*/

if out\==''  then say strip(out)       /*handle any residuals for  OUT. */
                                       /*stick a fork in it, we're done.*/
