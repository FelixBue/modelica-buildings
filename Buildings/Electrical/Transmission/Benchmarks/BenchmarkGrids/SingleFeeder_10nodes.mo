within Buildings.Electrical.Transmission.Benchmarks.BenchmarkGrids;
record SingleFeeder_10nodes
  "Grid with single feder and 10 nodes for benchmark (9 nodes for the loads)"
  extends Buildings.Electrical.Transmission.Grids.PartialGrid(
    nNodes = 10,
    nLinks = nNodes-1,
    L = Utilities.LineFeederLengths(nLinks, 200, 16),
    FromTo = Utilities.LineFeederConnections(nLinks),
    cables = Utilities.LineFeederCables(nLinks,
             Buildings.Electrical.Transmission.LowVoltageCables.PvcAl120(),
             Buildings.Electrical.Transmission.LowVoltageCables.PvcAl70()));

  annotation (Documentation(info="<html>
fixme: missing info section, also in other records.
</html>"));
end SingleFeeder_10nodes;