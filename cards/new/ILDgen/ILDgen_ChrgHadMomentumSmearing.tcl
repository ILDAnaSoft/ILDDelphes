  # set ResolutionFormula {resolution formula as a function of eta and pt}

  # resolution formula for charged hadrons
  set ResolutionFormula {    (abs(eta) <= 1.0)                   * sqrt(0.001^2 + pt^2*1.e-5^2) +
                             (abs(eta) > 1.0 && abs(eta) <= 2.4) * sqrt(0.01^2 + pt^2*1.e-4^2)}


