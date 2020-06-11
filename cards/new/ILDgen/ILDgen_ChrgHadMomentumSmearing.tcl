<<<<<<< HEAD

# Track momentum resolution dpt/pt 
#  based on parametrisation of ILD IDR results (Figure 8.1a)
#  A.F.Zarnecki, June 12, 2020


set ResolutionFormula {

(abs(eta) <= 2.0) *
  exp( -6.82012  - 0.284133*abs(eta) + 0.64585*eta*eta
     + (0.829675 -0.188197*abs(eta) +  0.106226 * eta*eta  - 1.0) * log(pt)
     + (0.0766417-0.00435667*abs(eta) + 0.00174804*eta*eta) * log(pt)*log(pt))

+

(abs(eta) > 2.0 && abs(eta) <= 3.0) *
  exp(  -4.54609
     + ( 0.87526 - 1.0) * log(pt)
     + (-0.0800672 + 0.0891669 * abs(eta)) * log(pt)*log(pt))

}

=======
  # set ResolutionFormula {resolution formula as a function of eta and pt}

  # resolution formula for charged hadrons
  set ResolutionFormula {    (abs(eta) <= 1.0)                   * sqrt(0.001^2 + pt^2*1.e-5^2) +
                             (abs(eta) > 1.0 && abs(eta) <= 2.4) * sqrt(0.01^2 + pt^2*1.e-4^2)}


>>>>>>> Implementing new model, work in progress...
