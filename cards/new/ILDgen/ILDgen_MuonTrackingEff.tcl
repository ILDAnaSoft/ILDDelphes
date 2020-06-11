
  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

  # tracking efficiency formula for muons
  set EfficiencyFormula {                                                    (pt <= 0.1)   * (0.00) +
                                           (abs(eta) <= 2.4)               * (pt > 0.1)    * (0.99) +
                                           (abs(eta) >  2.4)                               * (0.00)}
