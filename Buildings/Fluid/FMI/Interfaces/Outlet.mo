within Buildings.Fluid.FMI.Interfaces;
connector Outlet "Connector for fluid outlet"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model" annotation (choicesAllMatching=true);

  parameter Boolean use_p_in = true
    "= true to use a pressure from connector, false to output Medium.p_default"
    annotation(Evaluate=true);

  parameter Boolean allowFlowReversal = true
    "= true to allow flow reversal, false restricts to design direction (inlet -> outlet)"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);

  output Medium.MassFlowRate m_flow
    "Mass flow rate from the connection point into the component";
  Buildings.Fluid.FMI.Interfaces.PressureOutput p(displayUnit="Pa") if
       use_p_in "Thermodynamic pressure in the connection point";

  input Buildings.Fluid.FMI.Interfaces.FluidProperties backward(
    redeclare final package Medium = Medium) if
       allowFlowReversal "Inflowing properties";

  output Buildings.Fluid.FMI.Interfaces.FluidProperties forward(
    redeclare final package Medium = Medium) "Outflowing properties";

  annotation (defaultComponentName="port_b",
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Polygon(
          points={{-100,100},{-100,-100},{100,0},{-100,100}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255})}),
    Documentation(info="<html>
<p>
This is a connector for a fluid outlet.
The connector produces as an output the 
following quantities:
</p>
<ul>
<li>
The mass flow rate <code>m_flow</code>.
</li>
<li>
The pressure <code>p</code>,
unless <code>use_p_in=false</code>.
</li>
<li>
The enthalpy of the inflowing fluid
<code>forward.h</code>, 
e.g., the enthalpy that streams out of the component if <code>m_flow &gt; 0</code>.
</li>
<li>
The mass fraction of the inflowing fluid
<code>forward.Xi</code>,
unless <code>Medium.nXi=0</code>.
</li>
<li>
The trace substances of the inflowing fluid
<code>forward.C</code>, 
unless <code>Medium.nC=0</code>.
</li>
</ul>
<p>
If <code>allowFlowReversal = true</code>,
the connector requires as input the following quantities.
</p>
<ul>
<li>
The enthalpy of the outflowing fluid
<code>backward.h</code>,
e.g., if <code>m_flow &le; 0</code>.
</li>
<li>
The mass fraction of the outflowing fluid
<code>backward.Xi</code>,
unless <code>Medium.nXi=0</code>.
</li>
<li>
The trace substances of the outflowing fluid 
<code>backward.C</code>,
unless <code>Medium.nC=0</code>.
</li>
</ul>
<p>
If <code>allowFlowReversal = false</code>, then these inputs are not present
and hence not required to be provided.
</p>
</html>", revisions="<html>
<ul>
<li>
April 29, 2015, by Michael Wetter:<br/>
Redesigned to conditionally remove the pressure connector
if <code>use_p_in=false</code>.
</li>
<li>
November 8, 2014 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end Outlet;
