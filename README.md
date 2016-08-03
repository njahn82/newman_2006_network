## Visualising co-authorship networks with networkD3

Network: 

<https://njahn82.github.io/newman_2006_network/>

### Data-set 

Coauthorship network of scientists working on network theory and experiment, as compiled by [Marc Newman](http://www-personal.umich.edu/~mejn/).

Data described in: M. E. J. Newman, Finding community structure in networks using the eigenvectors of matrices, Preprint [physics/0605087](https://arxiv.org/abs/physics/0605087) (2006). 

Dataset available at: <http://networkdata.ics.uci.edu/data/netscience/>

### How to generate the network

following the [networkD3 documentation](http://christophergandrud.github.io/networkD3/)

```r
library(igraph)
library(networkD3)
library(magittr)

# load gml file with igraph
my_graph <- read_graph("network.gml", format = "gml")

wc <- cluster_walktrap(my_graph)
members <- membership(wc)

# Convert to object suitable for networkD3
network_d3 <- igraph_to_networkD3(my_graph, group = members)

# Create force directed network plot and save as standalone html file
forceNetwork(Links = network_d3$links, Nodes = network_d3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group') %>%
  saveNetwork(file = 'index.html')
```
