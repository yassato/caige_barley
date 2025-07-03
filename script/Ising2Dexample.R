##############################################
# spatial simulations based on the Ising model

# define functions
XiXj1 = function(id,dmat,range) {
  xi = Xi[id]
  if(xi==0) { xi = 1 } else { xi = xi }
  j = as.numeric(which((dmat[,id]<=range)&(dmat[,id]>0)))
  xj = Xi[j]
  xj[xj==0] = 1
  return(xi*sum(xj))
}

# set coefficients
J = -3.0 #= beta_2; 0.3 for (A) and -0.3 for (A)
h = 0.5 #= beta_1

# set a field
rect = 25
N = rect*rect
Xi = sample(c(-1,1),N,replace=T)

smap = cbind(rep(1:rect,each=rect),
             rep(1:rect,rect)
)
dmat = as.matrix(dist(smap))

group = rep(1,rect*rect)


xixj = c()
for(i in 1:N) xixj = c(xixj, XiXj1(i,dmat=dmat,range=sqrt(16)))
Ei_t0 = (J*xixj+h*Xi)

# MCMC by Gibbs sampling
for(j in 1:100) {
  Xi_t0 = Xi
  
  perm = sample(1:N,N)
  for(i in perm) {
    Xi[i] = sample(c(-1,1),1)
    xi = Xi[i]
    if(xi==0) { xi = 1 }
    Ei = -(J*XiXj1(i,dmat=dmat,range=sqrt(16))+h*xi) # set the energy negative to minimize itself
    
    # Metropolis algorithm
    if(Ei_t0[i]<=Ei) {
      Xi[i] = Xi[i]; Ei_t0[i] = Ei
    } else if(runif(1,0,1)<exp(Ei-Ei_t0[i])) {
      Xi[i] = Xi[i]; Ei_t0[i] = Ei
    } else {
      Xi[i] = Xi_t0[i]
    }
  }
  E = mean(Ei_t0)
  image(matrix(Xi,rect,rect),main=paste(j,E),col=c("black","white"))
}


pdf(file=paste0("./output/IsingJ",J,"_h",h,"cnt_d4.pdf"), width=5, height=5)
image(t(matrix(Xi,rect,rect)),main=paste(j,E),col=c("black","white"),las=1,xaxt="n",yaxt="n")
dev.off()
