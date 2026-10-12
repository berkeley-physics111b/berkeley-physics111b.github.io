---
title: Brownian Motion in Cells (BMC)
order: 2
summary: Apparatus, software, and design documentation for the Brownian Motion in Cells lab.
---
{% assign img = '/assets/img/bmc/' %}{% assign files = '/assets/pdf/documentation/bmc/' %}

* TOC
{:toc}

## Overview of Brownian Motion in Cells Lab

This experiment focuses on particle tracking, a key task in contemporary biophysics necessary to characterize the motion of cells, intracellular structures, and molecular machines. Tracking is accomplished by collecting the photons emitted by a point source with a CCD camera on a microscope, and subsequently fitting the intensity distribution (the point spread function) on each frame. The center of the 2-D PSF yields an estimate of the point source's location, which can be correlated frame-to-frame to generate a track for the particle. The statistical pattern of a particle's trajectory can be fit to Einstein's model of random motion due to thermal energy to determine the relative importance of diffusive and bulk flow mechanisms to the particle's motion. In this experiment, students first study Brownian motion of nanoparticles in suspension, investigating the relative effects of particle size, fluid viscosity, and solute molecular weight on particle motion. Students then observe intracellular transport of cytoplasmic structures within living onion cells. Skills developed in this lab include brightfield and darkfield microscopy, pipetting, experimental design, graphical interpretation of diffusion coefficient, and data analysis in MatLab. Students have the option of doing some programming in C# or Matlab and trying different algorithms for identifying and tracking particles.

Go to the [lab writeup]({{ '/manuals/' | relative_url }}) used by students to do this lab. <!-- TODO: link directly to the BMC manual PDF -->

## Acknowledgements

This experiment was developed under the direction of Professor Jan Liphardt. Steve Wasserman assembled most of the apparatus, wrote the C#/.NET data acquisition application and Matlab particle tracker, and wrote the lab writeup in 2006. Subsequently, Jon Aytac and Matt Rocklin wrote a real-time data acquisition and particle tracking application in C#/.NET. The apparatus and staff time were funded by a generous gift from Stanford Research Systems (SRS). Development of the C#/.NET application was funded by the Microsoft Research Division.

## Apparatus

![The lab workstation]({{ img | append: 'BMC_Station.jpg' | relative_url }})
*The lab workstation*

### Microscopy

We use a Zeiss Axiovert 200 inverted microscope with 5x, 10x, 20x, and 40x objectives. It is equipped for brightfield and darkfield, and has a side port for video camera. For this lab exercise a standard (non-inverted) microscope would work just as well.

### Video Camera

Prosilica model EC650C 1/3" CCD camera, 659x493 pixels, firewire (IEEE-1394) interface, max. 90 frames per second at full frame.

Sources: Point Grey Research USB Camera GS3U32854M-C <http://www.ptgrey.com/>, FlyCap 2.0 Viewer <http://www.ptgrey.com/flycapture-sdk>

Cost: about $950.

### Computer

Dell Optiplex GX280 desktop computer, 2.8 GHz, Firewire card for video input, Windows XP.

### Other Apparatus and Supplies

- Synthetic beads from Bangs Laboratories, <http://www.bangslabs.com>
    - 10 μm Polystyrene (PS)
    - 2 μm PS
    - 1 μm PS
    - 0.44 μm PS
- Solvents
    - Glycerol
    - Polyvinylpyrollidone

Pipettor: Finpette 10-100 uL

## Software

### Real Time Version in C#/.NET

In 2007 we developed a program in C#/.NET that combines the functions of Octopus 111 and ParticleTracking to capture movies and analyze particle motions in real time. One can adjust the various inputs on the fly until the program is successfully finding all of the obvious particles and rejecting background objects or artifacts. The user selects when to begin saving the movie and analysis to the hard drive. The user interface shows the current frame before and after filtering, the particles it has identified, and the trajectory of each. It calculates some statistics, including the diffusion coefficient.

- The program is available for download as [BMC Executable.zip]({{ files | append: 'BMC_Executable.zip' | relative_url }}).
- Code for the program is available for download as [BMC_Code.zip]({{ files | append: 'BMC_Code.zip' | relative_url }}).
- Data for the program is available [here]({{ files | append: 'BMC_Data.zip' | relative_url }}).
- For instructions on the use of the program see [this page]({{ '/documentation/bmc_software/' | relative_url }}). <!-- TODO: create _documentation/bmc_software.md or change this link -->
- This software uses and requires the .NET 2.0 framework. This is freely available from Microsoft [here](http://www.microsoft.com/en-us/download/details.aspx?id=1639).

#### User Interface

![Screenshot of user interface of particle tracker, showing directed transport of cytoplasmic granules in an onion cell.]({{ img | append: 'BMCPTScreenshot.jpg' | relative_url }})
*Screenshot of user interface of particle tracker, showing directed transport of cytoplasmic granules in an onion cell.*

![Screenshot showing particle tracks in the same cell a few minutes later.]({{ img | append: 'BMCPTScreenshot2.jpg' | relative_url }})
*Screenshot showing particle tracks in the same cell a few minutes later.*

![Brownian motion of synthetic beads.]({{ img | append: 'BMCPTScreenshot3.jpg' | relative_url }})
*Brownian motion of synthetic beads.*

#### Flow Chart

![Flowchart showing modules in RealTime Particle Tracker program.]({{ img | append: 'BMCPTFlowchart.png' | relative_url }})
*Flowchart showing modules in RealTime Particle Tracker program.*

##### Modules

In accordance with the .NET project, all software recently built for this project is contained within separated modules that can be easily connected using the Framework. They can also be separated and easily used in other experiments as the need arises.

1. Camera
    - The Camera module interfaces with the Prosilica CCD and can serve as an excellent high level wrapper for all future experiments using that device.
2. Simulated Camera
    - The Simulated Camera module mimics what students would normally see on screen while doing the Brownian Motion experiment. It however does not require that the experiment be performed with any specific hardware and is useful for testing, demos, and allowing the students to perfect their analysis at home.
3. Blob Finder
    - This module implements an algorithm to identify particles of interest amongst the background image, and to specify their position in each frame.
4. Particle Tracker
    - This correlates the particles positions from the previous module to identify specific particles across frames.
5. TrackRenderer
    - Connects images collected in previous modules, and adds information about where particle tracks are, which particles have been tracked, etc. It then interfaces with the graphical windows and handles display to screen.
6. Particle Statistics
    - Collects all of the information for final analysis and output to file. Can perform plots if connected to the proper PlotWindows.
7. File Writer
    - Intercepts the video stream going out of the Camera and writes it to disk.
8. File Reader
    - Loads presaved video stream and acts as an alternative image source much like the Camera or Simulated Camera.

#### Sequence Diagram

![Sequence Diagram for RealTime Particle Tracker program]({{ img | append: 'BMCPTSequence.png' | relative_url }})
*Sequence Diagram for RealTime Particle Tracker program*

### Older Version

As developed in 2006, image analysis is performed as a post-processing action on movies captured previously, so two programs are needed.

#### Movie Capture

The first program, [Octopus 111]({{ '/documentation/octopus_111/' | relative_url }}), is used to interface the camera to the computer, select the part of the camera field of view to capture, and save movies to the hard drive. The program is written in C# and available here in the [Octopus 111 Zip file]({{ files | append: 'Octopus_111.zip' | relative_url }}). <!-- TODO: create a page for Octopus 111 or change this link -->

#### Particle Tracking

The second program, called [ParticleTracking]({{ '/documentation/particle_tracking/' | relative_url }}), is implemented in Matlab. It filters images, identifies particles, and correlates particle identities across frames to create particle tracks. One can input values for threshold, noise diameter, and object diameter, as well as choose to subtract background. Generally one chooses initial settings for these inputs, then runs the analysis to see what particles are detected. Then you adjust the inputs and repeat the analysis until the program is successfully finding all of the obvious particles and rejecting background objects or artifacts. The user interface shows the frames in various stages of filtering, the particles it has tracked, and the trajectory of each. In addition, it graphs squared displacements and calculates some statistics, including the diffusion coefficient. <!-- TODO: create a page for ParticleTracking or change this link -->

The program is available for download as [ParticleTracker Zip file]({{ files | append: 'Matlab_Particle_Tracking.zip' | relative_url }}).