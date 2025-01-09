THISDIR := $(shell pwd)


all: 
	@echo "ipt2socks build ok!"
	curl -k -o gfwlist.txt https://raw.githubusercontent.com/pexcn/daily/gh-pages/gfwlist/gfwlist.txt
	curl -k -o ddnsto https://fw21.koolcenter.com:60010/binary/ddnsto/linux/mipsel/ddnsto

clean:
	@echo "ipt2socks clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/ipt2socks-mipsel /usr/bin/ipt2socks
	$(ROMFSINST) -p +x $(THISDIR)/ddnsto /usr/bin/ddnsto
	$(ROMFSINST) $(THISDIR)/gfwlist.txt /etc_ro/gfwlist.txt
	$(ROMFSINST) -p +x $(THISDIR)/wing /usr/bin/wing
