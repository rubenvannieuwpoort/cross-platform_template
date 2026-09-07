# Cross-platform template

This is a template for synthesizing and programming designs for both
- [Mimas A7 dev board](https://numato.com/product/mimas-a7-artix-7-fpga-development-board)
- [ULX3S dev board](https://radiona.org/ulx3s)


## Synthesizing

Do either `BOARD=ulx3s make` or `BOARD=mimasa7 make`.


## Programming

### Numato Mimas A7

- Using `openocd`:
  - In the root of this repository, run: `openocd -f board/numato_mimas_a7.cfg -c "init" -c "pld load 0 build/mimasa7.bit" -c "shutdown"`
  - If you get a "Can't find description for a cable named mimas_a" error, download and save [this file](https://raw.githubusercontent.com/numato/samplecode/refs/heads/master/FPGA/MimasA7/openocd/numato_mimasa7.cfg) as `platform/mimasa7/numato_mimasa7.cfg`, re-run the `make` command, and replace the `board/numato_mimas_a7.cfg` by `build/numato_mimasa7.cfg`.
  - To program to SRAM (so that the design persists across restarts), download  and save [this file](https://github.com/quartiq/bscan_spi_bitstreams/raw/refs/heads/master/bscan_spi_xc7a50t.bit) as `platform/mimasa7/bscan_spi_xc7a50t.bit`, re-run `BOARD=mimasa7 make` and then `openocd.exe -f board/numato_mimasa7.cfg -c "init" -c "jtagspi_init 0 <proxy_bitstream>" -c "jtagspi_program build/mimasa7.bit 0"  -c "shutdown"`.
- Alternatively, using `xc3sprog`:
  - Download [this file](https://numato.com/download/xc3sprog-dependency-files-for-linux) and extract `cablelist.txt` it to `platform/mimasa7`.
  - Re-run `BOARD=mimasa7 make`
  - In the root of this repository, run: `xc3sprog -c build/mimas_a7 build/mimasa7.bit`
  -  To program to SRAM (so that the design persists across restarts), also copy `bscan_mimas_a7_xc7a50tfgg484.bit` from `bscan_spi` to `platform/mimasa7`, and run `xc3sprog -c mimas_a7 bscan_mimas_a7_xc7a50tfgg484.bit` and then `xc3sprog -c mimas_a7 -I build/mimasa7.bit`.
