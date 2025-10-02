# Pathogen Spread Simulation

Visual, agent-based simulation of a pathogen spreading through a population. Built in **Processing** to explore compartment-style dynamics (healthy → infected → recovered/dead) and how parameters like infection radius, probability, and recovery time change outbreak curves. 

## Demo

Gif file that showcases what the code displays,<br/><br/>
![protype](https://user-images.githubusercontent.com/49369105/141847364-9106f681-0029-4aa9-b362-2e09a964a40a.gif)

## Features

- Agent-based particles with state (e.g., susceptible / infected / recovered / dead)
- Adjustable model parameters (infection radius, infection probability, recovery/mortality timing)
- Real-time visualization
- Simple, single-file entry point for easy tweaking and experiments

## Getting Started

### Prerequisites
- **Processing (Java mode)** — download from processing.org and install.

### Run
1. Open Processing.
2. `File → Open…` and select **`plagueFinal.pde`** from this repository.
3. Click **Run** ▶️.

> If Processing prompts you to create a sketch folder, say **Yes**—Processing expects all `.pde` files to live in a folder with the same name as the main sketch.

## Repo Structure

```
Pathogen_spread_simulation/
├─ plagueFinal.pde        # Main sketch: setup(), draw(), simulation loop
├─ Plague_class.pde       # Pathogen / simulation logic (parameters & rules)
└─ Cell.pde               # Agent (individual) definition & behavior
```


## Controls & Parameters

- **Parameters:** Open `Plague_class.pde` (and/or `plagueFinal.pde`) in Processing to tweak things like infection probability, infection radius, recovery time, and mortality chance. The sketch will re-run with your new values. 
- **Display:** The `draw()` loop in `plagueFinal.pde` handles per-frame updates and rendering; adjust frame rate or colors there.

## Experiments to Try

- Start with a very low infection probability vs. a high one—observe the threshold behavior.
- Make recovery fast vs. slow and see how peak load changes.
- Introduce a small mortality rate and compare final outcomes.
