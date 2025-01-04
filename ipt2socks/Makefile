THISDIR := $(shell pwd)


all: 
	@echo "ipt2socks build ok!"
	curl -k -o gfwlist.txt https://raw.githubusercontent.com/pexcn/daily/gh-pages/gfwlist/gfwlist.txt

clean:
	@echo "ipt2socks clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/ipt2socks-mipsel /usr/bin/ipt2socks
	$(ROMFSINST) $(THISDIR)/gfwlist.txt /etc_ro/gfwlist.txt
	$(ROMFSINST) -p +x $(THISDIR)/wing /usr/bin/wing
