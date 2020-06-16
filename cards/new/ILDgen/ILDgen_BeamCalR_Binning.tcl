#P.Sopicki: based on plots from D.Jeans:
# corrected by A.F.Zarnecki

set pi [expr {acos(-1)}]
    
# BeamCal eta range 4.0 - 5.8 -> 2.099-0.347 =1.752deg
# 1.752/20=0.0876
# 360/0.0876/cosh(4.9) = ~61 => 64 bins
  #Rear part
  set PhiBins {}
  for {set i -32} {$i <= 32} {incr i} {
    add PhiBins [expr {$i * $pi/32.0}]
  }
  for {set i 0} {$i <= 20} {incr i} {
    set eta [expr {-5.8 + $i * 1.8/20.0}]
    add EtaPhiBins $eta $PhiBins
  }
