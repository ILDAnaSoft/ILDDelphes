# ILCDelphes/doc/Model.md
### Description of the generic ILC detector model 


Description of the detector geometry is significantly simplified 
in Delphes. All components are assumed to have projective geometry
and are described in angular coordinates (&eta;,&phi;).


### Acceptance

Acceptance of the tracking detectors extends up to |&eta;|=3.

Calorimeter system is divided into 5 components 
covering following angular ranges

| &vert;&eta;&vert; coverage | EM  | HAD |
| -------------  | --- | --- |
| Central    | ECAL: &nbsp; &nbsp; &nbsp; up to 3.0  | HCAL: &nbsp; up to 2.8 |
| Forward    | LumiCal: &nbsp; 3.0 - 4.0 | LHCal: &nbsp; 2.8 - 3.8 |
| BeamCal    | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.0 - 5.8 |           |

Deposits in central and forward calorimeters are included in particle flow
reconstruction. BeamCal deposits (classified as photons by Delphes, as BeamCal
is outside of the tracking acceptance) are stored in a separate output 
branch/collection and are not included in particle flow or jet clustering.

### Jet clustering ###

Durham (ee_kt_algorithm in FastJet) is not implemented in Delphes.
However, exclusive clustering results can be exactly reproduced with 
proper settings of the VLC algorithm (R=2, &beta;=1, &gamma;=0). 
Exclusive clustering is run for N=2...6.

Comparison of jet transverse momenta from Delphes (configured VLC algorithm) 
and from external FastJet clustering with Durham algorithm,
for e<sup>+</sup>e<sup>-</sup>&rarr;qq events and exclusive 
clustering into two jets:
![Durham - Delphes](files/jet_comparison_n2_dpt.png)

