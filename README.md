# RBC Dielectric Properties Analysis using Single Spherical Shell Model- MATLAB Codes

This repository contains MATLAB scripts used for generating the **Clausius-Mossotti (CM) plots** and **Radar plots** for the project titled: **"Dielectrophoretic Profiling of Red Blood Cells (RBCs) from Pancreatic Cancer Patients under Simulated Microgravity"**

### Abbreviations Used in the Code

| Abbreviation   | Full Term                                  | Unit          | Meaning                                                                 |
|---------------|---------------------------------------------|---------------|-------------------------------------------------------------------------|
| **NG**        | Normal Gravity                              | —             | Control condition where RBCs are maintained under Earth's gravity.      |
| **SMG**       | Simulated Microgravity                      | —             | Experimental condition where RBCs are exposed to simulated microgravity using a 2D clinostat. |
| **σCyto**     | Cytoplasmic Conductivity                    | S/m           | Measures the ability of the cytoplasm to conduct electrical current; influenced by ion concentration and cytoplasmic integrity. |
| **Gmem**      | Specific Membrane Conductance               | S/m²          | Indicates ion permeability across the RBC membrane; linked to membrane integrity and leakage. |
| **Cspmem**    | Specific Membrane Capacitance               | mF/m²         | Reflects the membrane’s ability to store electrical charge; affected by lipid composition and membrane structure. |
| **ϕ**         | Folding Factor                              | Dimensionless | Represents the degree of RBC membrane folding or deformability; indicates morphological changes. |
| **fxo1**      | First Crossover Frequency                   | kHz           | Frequency at which the DEP force transitions from negative to positive; related to size, shape, and membrane properties. |
| **fxo2**      | Second Crossover Frequency                  | MHz           | Frequency at which intracellular properties dominate the DEP response; reflects cytoplasmic and membrane changes. |

## Description of Scripts

### 1. CMplotRBCsMG.m
- **Purpose:**
  - To plot the real part of the Clausius-Mossotti factor versus frequency for red blood cells (RBCs) under various conditions.
- **Inputs:**
  - Experimental dielectric property values (cytoplasmic conductivity, membrane capacitance, membrane conductance).
  - Diameter and membrane thickness.
- **Outputs:**
  - CM plots with curves for each condition (0 hr NG, 3 hr NG, 6 hr NG, 3 hr SMG, 6 hr SMG).

### 2. Final_Radar_Plots_All_Times.m
- **Purpose:**
  - To visually compare multiple dielectric and DEP-derived properties across conditions using radar plots.
- **Inputs:**
  - Mean values of properties:
    - Cytoplasmic Conductivity (σ_cyto)
    - Specific Membrane Capacitance (C_spmem)
    - Specific Membrane Conductance (G_spmem)
    - First Crossover Frequency (fxo1)
    - Second Crossover Frequency (fxo2)
    - Folding Factor (ϕ)
- **Outputs:**
  - Radar plot displaying normalized values across conditions (0 hr, NG, SMG).

## How to Use

1. Place your processed experimental data into `sample_data.xlsx` in the appropriate format.
2. Run `CM_Plot.m` to generate CM plots.
3. Run `Radar_Plot.m` to generate radar charts comparing all selected properties.

## Requirements

- MATLAB R2020 or later
- Statistics and Machine Learning Toolbox (optional for some visualizations)

## Notes

- The dielectric model used is a **single-shell oblate spheroid model**.
- Frequency range and dielectric property values can be adjusted within the scripts.

## Citation

If you use these scripts for your work, please cite the corresponding study:

Yaram S.D.R. et al., *Dielectrophoretic Profiling of Red Blood Cells from Pancreatic Cancer Patients under Simulated Microgravity*, 2025.

---

For any questions or suggestions, feel free to contact.

*Last updated: July 2025*
