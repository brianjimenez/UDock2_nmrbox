# UDock

Udock is a free interactive protein docking system, intended for both naive and experienced users. This new version introduce the possibility to work with more than two molecules, and an improved camera control scheme. UDock is developed at the Conservatoire National des Arts et Metiers, France, by the Centre d'Etudes et de Recherche en Informatique et Communications (CEDRIC) and the Laboratoire de Genomique, Bioinformatique, et Applications (GBA).

## Setup

### Linux

First install all the dependencies :

```bash
sudo apt-get install cmake
sudo apt-get install libboost-all-dev
sudo apt-get install libbullet-dev
sudo apt-get install libsdl2-dev
```

Go inside the main `src` directory:

```bash
cd src	
./compile.sh
```

Once compiled, a new directory `release` contains the UDock binary:

```bash
cd ../release
./udock.sh
```

Optionally you can specify mol2 input files :

```bash
./udock.sh ../molecules/1.mol2 ../molecules/2.mol2
```


