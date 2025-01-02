# Subgraph Query Volume Dashboard

https://www.rickydata-indexer.com/tools/qos-subgraph-data-download

<img width="1480" alt="image" src="https://github.com/user-attachments/assets/74adf48b-3f04-42b8-93f3-75cf1cb4dbfe" />

An interactive R Shiny dashboard that visualizes query volume data from The Graph Protocol's QoS subgraph. The dashboard provides insights into subgraph usage patterns, query volumes, and performance metrics across different chains.

## Features

- Real-time data fetching from The Graph's QoS subgraph
- Interactive visualizations using Plotly
- Multiple views including:
  - Top subgraphs by query volume
  - Query volume trends over time
  - Chain-specific analytics
  - Raw data access with export capabilities
- Filtering capabilities by chain ID
- Auto-refreshing data cache (30-minute intervals)

## Prerequisites

- R (>= 4.0.0)
- RStudio (recommended for running R Markdown files)
- Required R packages:
  - flexdashboard
  - shiny
  - dplyr
  - ggplot2
  - DT
  - lubridate
  - plotly
  - scales
  - pins
  - httr
  - jsonlite

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/subgraph_query_volume.git
cd subgraph_query_volume
```

2. Install required R packages:
```R
install.packages(c(
  "flexdashboard",
  "shiny",
  "dplyr",
  "ggplot2",
  "DT",
  "lubridate",
  "plotly",
  "scales",
  "pins",
  "httr",
  "jsonlite"
))
```

## Configuration

1. Get an API key from The Graph:
   - Visit [The Graph's website](https://thegraph.com/)
   - Create an account or log in
   - Navigate to your dashboard
   - Generate an API key

2. Set up your environment:
   - Create a `.Renviron` file in your home directory:
     ```bash
     echo "THEGRAPH_API_KEY=your_api_key_here" >> ~/.Renviron
     ```
   - Restart R/RStudio for the environment variable to take effect

## Usage

1. Open the `download_dashboard.Rmd` file in RStudio
2. Click "Run Document" or use the keyboard shortcut (Ctrl+Shift+K on Windows/Linux, Cmd+Shift+K on macOS)
3. The dashboard will open in a new window or your default browser

The dashboard will automatically:
- Check for existing data in `subgraph_data.csv`
- Fetch new data if the existing data is older than 30 minutes
- Display interactive visualizations and data tables

## Data Caching

The dashboard caches data in a CSV file (`subgraph_data.csv`) to improve performance and reduce API calls. This file is automatically:
- Created on first run
- Updated when data is older than 30 minutes
- Excluded from git tracking (via .gitignore)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Todo

- Add more information about the subgraphs (display names, signal, indexer stake)
- Implement process with pins to provide granular historical data
