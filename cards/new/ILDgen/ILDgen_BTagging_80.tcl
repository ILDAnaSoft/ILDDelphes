  # Test b-tagging configuration

  # misidentification rate (uds)
  add EfficiencyFormula {0} {
    ( abs(cos(theta))<0.7 )*( energy<30 )*( 0.0357394 )+ \
    ( abs(cos(theta))<0.7 )*( 30<=energy && energy<60 )*( 0.00649829 )+ \
    ( abs(cos(theta))<0.7 )*( 60<=energy && energy<100 )*( 0.00348779 )+ \
    ( abs(cos(theta))<0.7 )*( 100<=energy && energy<150 )*( 0.00210418 )+ \
    ( abs(cos(theta))<0.7 )*( 150<=energy )*( 0.00254973 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( energy<30 )*( 0.111225 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 30<=energy && energy<60 )*( 0.0168131 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 60<=energy && energy<100 )*( 0.00646659 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 100<=energy && energy<150 )*( 0.00331302 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 150<=energy )*( 0.00243346 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( energy<30 )*( 0.272537 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 30<=energy && energy<60 )*( 0.0408349 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 60<=energy && energy<100 )*( 0.0134139 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 100<=energy && energy<150 )*( 0.00643634 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 150<=energy )*( 0.0029458 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( energy<30 )*( 0.354286 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 30<=energy && energy<60 )*( 0.163744 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 60<=energy && energy<100 )*( 0.0477407 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 100<=energy && energy<150 )*( 0.0262949 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 150<=energy )*( 0.01424 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( energy<30 )*( 0.604573 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 30<=energy && energy<60 )*( 0.384993 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 60<=energy && energy<100 )*( 0.232971 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 100<=energy && energy<150 )*( 0.131915 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 150<=energy )*( 0.122438 )+ \
    ( 0.995<=abs(cos(theta)) )*( energy<30 )*( 0.758615 )+ \
    ( 0.995<=abs(cos(theta)) )*( 30<=energy && energy<60 )*( 0.661271 )+ \
    ( 0.995<=abs(cos(theta)) )*( 60<=energy && energy<100 )*( 0.55199 )+ \
    ( 0.995<=abs(cos(theta)) )*( 100<=energy && energy<150 )*( 0.531619 )+ \
    ( 0.995<=abs(cos(theta)) )*( 150<=energy )*( 0.471657 )
  }
  
  # misidentification rate (c)
  add EfficiencyFormula {4} {
    ( abs(cos(theta))<0.7 )*( energy<30 )*( 0.238583 )+ \
    ( abs(cos(theta))<0.7 )*( 30<=energy && energy<60 )*( 0.0676611 )+ \
    ( abs(cos(theta))<0.7 )*( 60<=energy && energy<100 )*( 0.0400979 )+ \
    ( abs(cos(theta))<0.7 )*( 100<=energy && energy<150 )*( 0.0207426 )+ \
    ( abs(cos(theta))<0.7 )*( 150<=energy )*( 0.024863 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( energy<30 )*( 0.423413 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 30<=energy && energy<60 )*( 0.146848 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 60<=energy && energy<100 )*( 0.0707474 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 100<=energy && energy<150 )*( 0.0379644 )+ \
    ( 0.7<=abs(cos(theta)) && abs(cos(theta))<0.9 )*( 150<=energy )*( 0.0257094 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( energy<30 )*( 0.516319 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 30<=energy && energy<60 )*( 0.273657 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 60<=energy && energy<100 )*( 0.1352 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 100<=energy && energy<150 )*( 0.0751616 )+ \
    ( 0.9<=abs(cos(theta)) && abs(cos(theta))<0.95 )*( 150<=energy )*( 0.0482712 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( energy<30 )*( 0.57449 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 30<=energy && energy<60 )*( 0.449595 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 60<=energy && energy<100 )*( 0.284322 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 100<=energy && energy<150 )*( 0.208733 )+ \
    ( 0.95<=abs(cos(theta)) && abs(cos(theta))<0.98 )*( 150<=energy )*( 0.139291 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( energy<30 )*( 0.657538 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 30<=energy && energy<60 )*( 0.543106 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 60<=energy && energy<100 )*( 0.458906 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 100<=energy && energy<150 )*( 0.399575 )+ \
    ( 0.98<=abs(cos(theta)) && abs(cos(theta))<0.995 )*( 150<=energy )*( 0.392917 )+ \
    ( 0.995<=abs(cos(theta)) )*( energy<30 )*( 0.769392 )+ \
    ( 0.995<=abs(cos(theta)) )*( 30<=energy && energy<60 )*( 0.699301 )+ \
    ( 0.995<=abs(cos(theta)) )*( 60<=energy && energy<100 )*( 0.641574 )+ \
    ( 0.995<=abs(cos(theta)) )*( 100<=energy && energy<150 )*( 0.657384 )+ \
    ( 0.995<=abs(cos(theta)) )*( 150<=energy )*( 0.592252 )
  }
  
  # b-tagging efficiency
  add EfficiencyFormula {5} {0.8}

