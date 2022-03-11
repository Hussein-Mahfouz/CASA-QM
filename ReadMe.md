# Solving the Dead Mileage Problem for the Bus Fleet of the Cairo Transport Authority (CTA)

## Backgound 

This research explores one way of enhancing the operational efficiency of the of the Cairo Transport Authority (CTA) bus fleet (The CTA is the government agency in charge of operating the public bus network in the Greater Cairo Region). It proposes bus route allocation to depots in a way that minimizes the total [dead mileage](https://en.wikipedia.org/wiki/Dead_mileage) of the bus network.

<img src="Assignment Plots/Plots/depots.png" alt="Bus depots in Greater Cairo" width="65%" />
<p class="caption">
Figure 1: Bus Depots in Greater Cairo
</p>

The dead mileage problem is modelled as a 0-1 assignment problem with constraints on depot capacities [(Sharma and Prakash 1986)](https://trid.trb.org/view/276073). [Hsu (1988)](https://ascelibrary.org/doi/10.1061/%28ASCE%290733-947X%281988%29114%3A1%28123%29) added an all or nothing constraint to the problem; all buses on the same route must be assigned to one depot. This was done to resemble real-life bus operations where depots are used for fleet management as well as vehicle storage. [Prakash et. al (1999)](https://www.sciencedirect.com/science/article/abs/pii/S0377221798002380) formulate the problem as a multi-objective problem, with the objectives being 1) minimizing dead mileage, and 2) minimizing the maximum distance covered by any bus from its depot to its starting terminal. [Nasibov et al. (2013)](https://traffic.fpz.hr/index.php/PROMTT/article/view/1289) solve the dead mileage problem for the bus transport system of Izmir by removing depot capacity constraints to show which depots could be expanded to reduce dead mileage. 

The problem is solved using the all or nothing constraint proposed by Hsu (1988). One alteration is that this constraint is applied on a trip level, not a route level (trip here is defined as one leg of a route).

<img src="Assignment Plots/Plots/bus_allocation_to_depots.png" alt="Potential benefit of trip level constraint (right) over route-level constraint (left)" width="75%" />
<p class="caption">
Figure 2: Potential benefit of trip level constraint (right) over route-level constraint (left)
</p>

**The detailed report can be viewed [here](https://github.com/Hussein-Mahfouz/CASA-QM/blob/master/Written%20Investigation%20-%20DQBX6.pdf)**

## Problem Formulation and Tools

Pure binary assignment problems (variables must be integers; 0 or 1) are known to be NP- Complete [(Floudas 1995)](https://oxford.universitypressscholarship.com/view/10.1093/oso/9780195100563.001.0001/isbn-9780195100563). If n variables are each assigned one of 2 integer values, there are 2<sup>n</sup> solutions. Finding the exact solution by enumerating all possible solutions is prohibitively time consuming and so approximation algorithms are used [(Vazirani 2001)](https://doc.lagout.org/science/0_Computer%20Science/2_Algorithms/Approximation%20Algorithms%20%5BVazirani%202010-12-01%5D.pdf). This problem is solved using the Gurobi Solver (Gurobi Optimization, LLC 2019) which utilizes the branch and bound algorithm. This algorithm is able to cover all solutions even though it evaluates only a fraction of them. 

The problem is solved using [cvxpy](https://www.cvxpy.org/), leveraging [Gurobi](https://www.gurobi.com/), a powerful but proprietary mathematical optimization solver which has a free academic license. The problem formulation is in the [optimization script](https://github.com/Hussein-Mahfouz/CASA-QM/blob/master/4-%20Optimization.ipynb)

## Highlight of Results 

Solving the problem with all constraints yields a total dead mileage of 33,324 km. Removing the depot capacity constraint reduces the dead mileage by almost 2,500 km. The results show which depots could be expanded to reduce dead mileage (Imbaba, Gesr Al Suez, and Fom El-Khalig), and which depots could be closed or better utilized for other purposes (Maadi).

<div class="figure" style="text-align: center">

<img src="Assignment Plots/Plots/depot_utilozation.png" alt="Capacity constraints" width="45%" /><img src="Assignment Plots/Plots/depot_utilozation2.png" alt="No capacity constriants" width="45%" />
<p class="caption">
Figure 3: Depot Utilization with capacity constraints (left), and without capacity constraints
(right) 
</p>

</div>


