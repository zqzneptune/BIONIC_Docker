## Dokerized BIONIC: biological network integration using convolutions

For usages and methods descriptions, please check the **original [repo](https://github.com/bowang-lab/BIONIC)** and **[publication](https://www.nature.com/articles/s41592-022-01616-x)**:

Forster DT, Li SC, Yashiroda Y, Yoshimura M, Li Z, Isuhuaylas LA, Itto-Nakama K, Yamanaka D, Ohya Y, Osada H, Wang B. BIONIC: biological network integration using convolutions. *Nature methods*. 2022 Oct;19(10):1250-61.

## Docker Installation and Usage

### Prerequisites
- Docker installed
- NVIDIA GPU with CUDA support
- NVIDIA Container Toolkit installed

### Building the Docker Image
1. Clone the repository:
```bash
git clone https://github.com/bowang-lab/BIONIC_Docker.git
cd BIONIC_Docker
```

2. Build the Docker image:
```bash
docker-compose build
```

### Directory Structure
Create the following directory structure for data:
```
data/
├── inputs/     # Place your input network files here
├── outputs/    # Output files will be saved here
└── config/     # Place your configuration files here
```

### Running BIONIC
You can run BIONIC using the provided shell script:
```bash
chmod +x run-bionic.sh
./run-bionic.sh path/to/your/config.json
```

Or using docker-compose:
```bash
docker-compose run bionic bionic /data/config/your_config.json
```

### Example
1. Place your network files in `data/inputs/`
2. Place your configuration file in `data/config/`
3. Run BIONIC:
```bash
./run-bionic.sh data/config/your_config.json
```
4. Find your results in `data/outputs/`

## Installation

