THISDIR := $(shell pwd)


all: 
	@echo "dnsmasq build ok!"

clean:
	@echo "dnsmasq clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/dnsmasq /usr/sbin/dnsmasq
