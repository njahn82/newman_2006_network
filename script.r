library(igraph)
library(networkD3)
library(magittr)

my_graph <- read_graph("network.gml", format = "gml")
wc <- cluster_walktrap(my_graph)
members <- membership(wc)

# Convert to object suitable for networkD3
network_d3 <- igraph_to_networkD3(my_graph, group = members)

# Create force directed network plot
forceNetwork(Links = network_d3$links, Nodes = network_d3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'group') %>%
  saveNetwork(file = 'newman_network.html')
