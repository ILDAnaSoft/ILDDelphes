# ILCDelphes/doc/Data.md
### Documentation for output data structure from generic ILC detector model 

This description is valid for both the Delphes simulation results stored in 
mini-DST format  (LCIO; see [Delphes2LCIO](https://github.com/iLCSoft/LCIO/tree/master/examples/cpp/delphes2lcio)
repository for details), as well as in the native root format.

## Output data structures

Results of the detector response simulation in Delphes are available at three levels:

1.  raw detector response: reconstructed tracks and deposits in calorimeter towers
2.  particle flow: reconstructed particle flow tracks, photons and neutral hadrons
3.  final reconstruction results: isolated electrons, muons and photon, and hadronic jets

We strongly recommend use of the final reconstruction results in analysis 
based on Delphes simulation. Following collections/branches of Delphes output 
should be used:

| root branch | LCIO name       | description |
| ----------  | --------------  | ----------  |
| Electron    | Electrons       | reconstructed isolated electrons |
| Muon        | Muons           | reconstructed isolated muons |
| Photon      | Photons         | reconstructed isolated photons |
| Jet_N2      | Durham2Jets     | N=2 exclusive jet clustering with Durham algroithm | 
| Jet_N3      | Durham3Jets     | N=3 exclusive jet clustering with Durham algroithm | 
| Jet_N4      | Durham4Jets     | N=4 exclusive jet clustering with Durham algroithm | 
| Jet_N5      | Durham5Jets     | N=5 exclusive jet clustering with Durham algroithm | 
| Jet_N6      | Durham6Jets     | N=6 exclusive jet clustering with Durham algroithm | 
| Jet         | Jets            | inclusive clustering with anti-kt algorithm |

### Isolated objects

Isolated electrons and muons are selected based on the 
true particle ID of reconstructed track (misidentification 
is not simulated!). Isolation criteria (looking for other particle flow 
objects within the cone of &Delta;R=0.5) and reconstruction efficiency are 
taken into account. Minimum energy for isolated object reconstruction is 2 GeV. 

Note that electron and muon identification is based on the track reconstruction
and limited to the tracking acceptance region (|&eta;|<3). 
Electrons entering calorimeters at smaller angles are reconstructed as photons.

### Jet Clustering

We recommen using "exclusive" jet clustering results (clustering into the fixed
number of jets). **Durham algorithm** is used, as the standard choice for 
exclusive clustering in ILC studies (as it is not directly implemented in Delphes,
we use VLC algoritm with settings exactly reproducing Durham algorithm results).
As different studies consider different jet multiplicities, 
ILCDelphes model contains clustering results for N=2,...,6. Results are stored 
in five separate jet collections, **Jet_N2**, ... , **Jet_N6**. 
The users should pick the one most suitable for their analysis. 
In most cases, N should correspond to the number of partons expected 
in the tree level final state. 

For special cases, inclusive jet clustering is also available (**Jet** collection),
run with **anti-kt** algorithm with R=1 and p<sub>T</sub><sup>min</sup>= 5 GeV. 

For details of the jet clustering algorithms, please refer to 
[FastJet](http://fastjet.fr/) documentation.

### Jet Flavour tagging

Both b- and c-tagging is implemented for all jet collections with 3 working points 
(loose, medium and tight selection). They correspond (approximately) to 
80%, 70% and 50% efficiency of b-tagging for b-quark-initiated jets and
55%, 30% and 20% efficiency of c-tagging for c-quark-initiated jets. Efficiencies
are implemented in tabular form, in energy-rapidity bins, based on the full 
simulation results. Results of b- and c-tagging simulation are stored as 
separate bits in a **BTag** word of Jet class:

| bit  | expression (returning 0 or 1) | tag | level |
| ---- | ---------  | --- | ----- |
|  0   |  jet.BTag&1 | b-tag | loose |  
|  1   |  (jet.BTag&2)/2 | b-tag | medium |  
|  2   |  (jet.BTag&4)/4 | b-tag | tight |  
|  3   |                 |  *not used* | |
|  4   |  (jet.BTag&16)/16 | c-tag | loose |  
|  5   |  (jet.BTag&32)/32 | c-tag | medium |  
|  6   |  (jet.BTag&64)/64 | c-tag | tight |  

Note that the tagging results are based on simple random number generation 
and comparison with assumed threshold. Tagging is simulated independently 
for each jet collection, each flavour (c- or b-) and each working point 
(loose, medium and tight). Correlations between different tags are not 
reproduced. Only one tag level should be used in the analysis to avoid possible bias.
Otherwise, full simulation results should be used to study influence of flavour
tagging correlations.

Results of the tau-tagging for reconstructed jets are stored in **TauTag** word 
of Jet class. Only one working point is implemented (bit 0), with efficiency 
reaching 80% for high energy tau-initiated jets.
