![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# Tiny FABulous FPGA - IHP26a

- [Read the documentation for the project](docs/info.md)
- [View the layout in your browser](https://gds-viewer.tinytapeout.com/?model=https://raw.githubusercontent.com/mole99/tt-fabulous-ihp-26a/refs/heads/main/gds/tt_um_fabulous_ihp_26a.gds&pdk=ihp-sg13g2)

## Requirements

> [!NOTE]
> Make sure to clone the repository with submodules!
>
>```console
>git clone --recurse-submodules <url>.git
>```
> or initialize the submodules after cloning:
>
>```console
> git submodule update --init --recursive
>```

For information on installing Nix with the FOSSi Foundation cache, please refer to the LibreLane documentation: https://librelane.readthedocs.io/en/stable/installation/nix_installation/index.html

## Stitch the Fabric

Before proceeding, ensure that the tiles for the tile library that you are using have been implemented in `ip/fabulous-tiles`.

If so, you can proceed by enabling a Nix shell with LibreLane in this repository:

```
nix-shell
```

To implement the fabric, run:

```
make tiny_fabric_5x5
```

After the fabric has been implemented you can view it either in OpenROAD or KLayout by appending `-openroad` or `-klayout` to the fabric name.
For example, to view `tiny_fabric_5x5` in OpenROAD, run: `make tiny_fabric_5x5-openroad`.

## Implement User Designs

Please see the README in `user_designs/` on how to implement a user design for the fabric.

## Build Tiny FABulous FPGA

Enable a Nix shell with LibreLane dev:

```
nix shell github:librelane/librelane/dev
```

Implement the design:

```
librelane config.yaml --pdk ihp-sg13g2 --save-views-to macro/
```

Open in OpenROAD:

```
librelane config.yaml --pdk ihp-sg13g2 --last-run --flow OpenInOpenROAD
```
