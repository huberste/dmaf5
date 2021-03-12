# geekbench results when fiddling with the ZenStates
This describes the results I got with GeekBench 5.3.2 on Linux Ubuntu while fiddling with the ZenStates.
Apparently, my CPU scales down the frequency when I drop the voltages even by a bit (in 6.25mV steps). Maybe, overclocking by overvolting might work, but that would result in more power draw and thus higher temps and more noise, which is what I want to avoid.

## standard
P0 - Enabled - FID = 69 - DID = A - VID = 35 - Ratio = 21.00 - vCore = 1.21875
P1 - Enabled - FID = 66 - DID = C - VID = 60 - Ratio = 17.00 - vCore = 0.95000
P2 - Enabled - FID = 62 - DID = E - VID = 66 - Ratio = 14.00 - vCore = 0.91250

GeekBench: [6618354](https://browser.geekbench.com/v5/cpu/6618354) - Single-Core Score 973, Multi-Core Score 3513

## undervolt +1
P0 - Enabled - FID = 69 - DID = A - VID = 36 - Ratio = 21.00 - vCore = 1.21250
P1 - Enabled - FID = 66 - DID = C - VID = 62 - Ratio = 17.00 - vCore = 0.94750
P2 - Enabled - FID = 62 - DID = E - VID = 68 - Ratio = 14.00 - vCore = 0.90625

GeekBench: [6618548](https://browser.geekbench.com/v5/cpu/6618548) - Single-Core Score 969, Multi-Core Score 3504

## undervolt +2
P0 - Enabled - FID = 69 - DID = A - VID = 37 - Ratio = 21.00 - vCore = 1.20625
P1 - Enabled - FID = 66 - DID = C - VID = 62 - Ratio = 17.00 - vCore = 0.93750
P2 - Enabled - FID = 62 - DID = E - VID = 68 - Ratio = 14.00 - vCore = 0.90000

GeekBench: [6618465](https://browser.geekbench.com/v5/cpu/6618465) - Single-Core Score 966, Multi-Core Score 3498

## overclock +1
P0 - Enabled - FID = 6A - DID = A - VID = 35 - Ratio = 21.20 - vCore = 1.21875
P1 - Enabled - FID = 67 - DID = C - VID = 60 - Ratio = 17.17 - vCore = 0.95000
P2 - Enabled - FID = 63 - DID = E - VID = 66 - Ratio = 14.14 - vCore = 0.91250

GeekBench: [6618869](https://browser.geekbench.com/v5/cpu/6618869) - Single-Core Score 967, Multi-Core Score 3515

## overclock +2
P0 - Enabled - FID = 6B - DID = A - VID = 35 - Ratio = 21.40 - vCore = 1.21875
P1 - Enabled - FID = 68 - DID = C - VID = 60 - Ratio = 17.33 - vCore = 0.95000
P2 - Enabled - FID = 64 - DID = E - VID = 66 - Ratio = 14.29 - vCore = 0.91250

GeekBench: [6618869](https://browser.geekbench.com/v5/cpu/6618869) - Single-Core Score 971, Multi-Core Score 3502

## overclock +1 - oops
yeah, i f!cked up my HEX here... 69h + 1h = 6Ah, not 70h...
P0 - Enabled - FID = 70 - DID = A - VID = 35 - Ratio = 22.40 - vCore = 1.21875
P1 - Enabled - FID = 67 - DID = C - VID = 60 - Ratio = 17.17 - vCore = 0.95000
P2 - Enabled - FID = 63 - DID = E - VID = 66 - Ratio = 14.14 - vCore = 0.91250

GeekBench: [6618708](https://browser.geekbench.com/v5/cpu/6618708) - Single-Core Score 972, Multi-Core Score 3518

## overclock +2 - oops
yeah, i f!cked up my HEX here... 69h + 2h = 6Bh, not 71h...
P0 - Enabled - FID = 71 - DID = A - VID = 35 - Ratio = 22.60 - vCore = 1.21875
P1 - Enabled - FID = 68 - DID = C - VID = 60 - Ratio = 17.33 - vCore = 0.95000
P2 - Enabled - FID = 64 - DID = E - VID = 66 - Ratio = 14.29 - vCore = 0.91250

GeekBench: [6618773](https://browser.geekbench.com/v5/cpu/6618773) - Single-Core Score 972, Multi-Core Score 3500

