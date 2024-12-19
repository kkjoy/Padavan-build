THISDIR := $(shell pwd)


all: 
	@echo "ipt2socks build ok!"

clean:
	@echo "ipt2socks clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/ipt2socks-mipsel /usr/bin/ipt2socks
	$(ROMFSINST) -p +x $(THISDIR)/chinadns-ng@mipsel-linux-musl@mips32+soft_float@fast+lto /usr/bin/chinadns-ng
