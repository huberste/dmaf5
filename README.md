# dmaf5
The [MINISFORUM DeskMini DMAF5](https://store.minisforum.com/products/deskmini-dmaf5-amd-ryzen-5-3550h) is a NUC-like AMD machine sporting an AMD Ryzen 3550H. This repository is a dump for information, things I found out and scripts I wrote for this little machine.

## Disclaimer
Of course, I will not be responsible for anything you do with your computer.
You break it, you fix it!
I try to give sources wherever possible - try to read and understand them.
Most of the basics will be true for every computer, not just the DMAF5.

Also, I'm not 100% sure if any of the written stuff actually is true, it's just what I read, concluded or am thinking that is correct.

## Why?
The DMAF5 is a mean little machine, that sports an [AMD Ryzen 3550H](https://www.amd.com/en/products/apu/amd-ryzen-5-3550h).
This Processor (4-core, simultaneous hyperthreading,se frequency 2.1 GHz up to 3.7 GHz Boost) is an APU, i.e. has an integrated graphics card (Radeon Vega 8 at 1200 MHz).
The total TDP (Thermal Design Power, i.e. how much energy it will use) is 12 up to 35 Watts.
The DMAF5 has the cTDP set to 35W, which is *a lot* for this machine and the integrated cooler and fan.
Thus, the machine might just get *a bit* loud.
To tinker with the machine, benchmark it in some way or another, have it as a little home server or be able to play minecraft without noise blocking headphones, I had to do something.

## How?
First of all, the DMAF5 comes with Windows 10 pre-installed.
I kept the windows around, but shrank the partition to reasonable sizes and promptly installed my favourite Linux flavor: Ubuntu.
As I suspected, everything worked out of the box (Ubuntu 20.10), and I didn't even have to install the [new ubuntu kernels](https://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D) (which I still did, anyways).
Now, Windows is only used whenever I *really* need it (there is no possibility to update the BIOS without the exe file, for example), and Linux is my daily driver on the DMAF5.
So, most of this guide and these tools are for GNU/Linux, specifically Ubuntu, though the concepts might still be applicable on any other operating system, too.

### Saving power
Less power equals less heat equals less noise, right? So, the first step would be to reduce the power draw.

#### powersave.sh
The `powersave.sh` script is a little helper to set the linux governors.
The CPUFreq Governors are power schemes for the CPU, which make the CPU less power hungry (and less potent) by simply never sending it in a high power / high frequency state.
* The `powersave` governor is intended for laptops to save power and thus battery, but in case of the DMAF5, it works very well keeping the computer quiet, too.
* `ondemand` is the default governor: It sets the CPU frequency depending on the current system load. So, running a minecraft server, the fans might need to spin up when a new user joins, or such.
* The `conservative` governor does mostly the same as `ondemand`, but with a nice little feature: Whereas the `ondemand` governor scales the machine up to full speed whenever there's load (i.e. almost at any time, when running a service), the `conservative` governor scales the frequency step by step, and might end up in a middle ground which is still quiet and cool, but fast enough.
* The ubuntu default governor is `schedutil`, which uses the task scheduler to set the frequencies. It will use the highest frequencies for some tasks, and thus might not be the optimal choise for the DMAF5.
* There are other governors, as described in the [kernel documentation](https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt). You might want to check the documentation and the other governors (`userspace` and `performance`) out.

So, back to the script then: If you call it without any command line arguments, i.e. type `powersave.sh`, it will set the `powersave` governor for all cores.
You can also call it with any governor as an argument, i.e. `powersave.sh schedutil` will set the CPU back to the Ubuntu default mode, and you could use `powersave.sh performance` if you use the DMAF5 outside on a cold winter day, on a block of ice, or inside a freezer.
Ah, and of course you will have to be uid 0 (root), so you will actually need to write `sudo powersave.sh conservative`.

*Beware*: If the CPU gets too hot, it will automatically scale the frequency (and max boost) down, or even cease working (though that almost never happens on modern CPUs).
Also, it is virtually impossible to break your CPU permanently by fiddling with the governors: A simple restart of the computer should always give you a working machine.
Still: Running a Computer permanently in the high temperature zone might break or wear off other components faster, and might reduce the lifetime of your computer.

#### Undervolting
Power equals Amperage times Voltage.
So, decreasing the voltage on the chip should reduce the temperatures and thus the noise.
But beware: Undervolting might really damage your CPU or other components permanently (though it never happened to me before).
Also, every chip is different, so you might end up with some very different voltages than me.
It's not called the silicon lottery without reason.

But, as you can see by looking at my benchmarking results (geekbench-results.md), I didn't get any good results by undervolting the CPU (it apparently automatically scales the frequency down and thus not only voltages and temperatures, but also performance and benchmark scores drop).
And dropping performance is not something I want.

##### Ryzen Master
The [AMD Ryzen Master](https://www.amd.com/en/technologies/ryzen-master) tool is only running on windows, and thus no option for me.
Additionally, it does not even support the Ryzen 3550H, since it does not support Laptop chips.
So, some alternative needs to be found.

##### ZenStates-Linux
Luckily, the github user r4m0n already wrote his own little "Collection of utilities for Ryzen processors and motherboards" and published them on github as [ZenStates-Linux](https://github.com/r4m0n/ZenStates-Linux).
I will be using this tool to undervolt (and maybe overclock, see below) my CPU.

### Tinkering
You have a set of screw drivers, right? And the DMAF5 can be opened by simply pressing on the top case lid. So... what's stopping us from tinkering some with the Hardware?
I understand that this is not for everyone, and will have other unwanted effects (opening the lid might accumulate more dust and thus harm the temperatures in a long run etc), but it might just be worth your time. And it could be fun!

I will probably end up trying this, and even share the results, here or any other place.

#### Fan up!
It should not be too hard to replace or support the puny tiny fan that the DMAF5 comes with, with another 60, 88 or even 120 mm fan.

#### Change all the things!
Many "grown up" sff (small form factor) computer cases come with meshed panels, so exchanging the top lid (or, really, any given side of the case) with a meshed version (e.g. from a 3D printer) might decrease the temperatures.
Also, the bottom only has air slits on 2/3rd of it's surface, so you might give that a try.

### Overclocking
This might not be the most sensible thing to do on this little loud machine, but since I already have it, I might just try one or two things...

#### AMD Ryzen Master
Of course, as stated above, AMD did not enable the Ryzen Master tool for laptop chips.
So, overclocking with this pretty comfortable tool is not an option.
How do we do it, then?

#### ZenStates-Linux
The above mentioned ZenStates-Linux tool lets users fiddle with Voltage IDs (thus changing Voltage), Divider IDs (has something to do with frequency scaling) and Frequency IDs (directly scaling the Frequency) for each P state.
A P state is a Power state, in which the CPU is set by the operating system, and in each P State, the CPU can scale up to different Frequencies.
So, using the `powersave` governor leaves the CPU in its P2 state (the minimum state for this CPU), while other, scaling governors might use higher P states, thus using more power and getting better efficiency.
Simply adjusting the FIDs on my CPU yielded no results, probably because the CPU is already capped on its voltage. I didn't go into that, though because increasing power draw (and thus temperatures and thus noise) is the exact opposite of what I want to do with my DMAF5.

## So long...
... and thanks for all the fish!

Live long and prosper,
 - huberste
