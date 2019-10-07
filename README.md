# The problem

I use a MacBook with a Raspberry Pi 3 connected with and USB Ethernet dongle. 
That suits mobile workflows well, but there's an obstacle for productive work:
the Pi has to have Internet connection often.

But macOS (Mojave in my case) Internet Connection Sharing doesn't seem to
work well when you have such a setup. Thing is, when Pi is down, network is also
down, and it needs a lot of trickery and luck to work properly from the
"user-friendly" UI.

# The solution

So I researched a bit and produced this script. I just run sudo ./start-nat.sh
while my Ethernet dongle is connected, and boot up the Pi. ICS of macOS is disabled
all the time.

bootpd remains in the foreground and I clearly can see which address it was assigned:
```
Oct  7 22:20:26  bootpd[16393] <Notice>: ACK sent raspberrypi3 192.168.2.2 pktsize 300
Oct  7 22:20:26  bootpd[16393] <Notice>: service time 0.001146 seconds
```
I keep it running for the whole working session.

In my case the USB Ethernet dongle is always en4, your experience may vary.

I hope it works for you too! I just document the solution I found useful for myself.
