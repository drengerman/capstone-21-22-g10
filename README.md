# capstone-21-22-g10
Total code repository for ECE Capstone G10 at the U of Manitoba, 2021-2022.

# Ground Penetrating Radar Data Collection from an Autonomous Drone

Ground penetrating radars (GPRs) are devices capable of imaging material under some surface, such as the ground or ice. These devices are typically pushed or pulled by a human operator. However, in environments which are unsafe for humans, GPRs are not able to be used. In such circumstances, it would be ideal if a drone could propel the GPR instead. This project is to serve as a proof-of-concept for such a system. We have developed an autonomous drone system capable of automatically plotting a path around an imaged area, avoiding obstacles, and then flying the planned path. Additionally, we have developed an interpretation module that can identify the presence of objects during the drone's flight.

We developed two separate systems: a down-scaled drone subsystem and an at-scale GPR subsystem. The drone subsystem contains the Obstacle Detection module, the Path Planning module, the Object Tracking module, and the Drone Control module. These are in charge of detecting obstacles to avoid, plotting a route for the drone to follow, tracking the drone's payload, and piloting the drone itself (respectively). Testing for this subsystem took place in STARLab (Space Technology and Advanced Research Laboratory) within a drone cage. We validated that the system performs to our expectations, and that the drone is capable of adequately flying autonomously in such a way as to have its payload cover the area of interest.

The GPR subsystem contains the Data Collection module and the Data Interpretation module. These are responsible for collecting and interpreting the data obtained by using the GPR. Testing for this subsystem took place at the SERF (Sea-ice Environment Research Facility) testing location. A GPR was pulled across ice, underneath which lay two pig carcasses. An algorithm was developed to automatically determine whether certain scans of the GPR contained any objects of interest. Testing revealed that this subsystem met our expectations, and is capable of recognizing objects underneath the layer of ice

Overall, our system was successful in demonstrating a proof of concept for an autonomous system capable of controlling a drone to obtain and interpret GPR information. We hope that such a project can serve as an example of future developments for similar systems.
