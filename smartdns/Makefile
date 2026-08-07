THISDIR := $(shell pwd)


all: 
	@echo "smartdns build ok!"

clean:
	@echo "smartdns clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/smartdns /usr/bin/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /usr/bin/smartdns.sh
	$(ROMFSINST) /etc_ro/smartdns_custom.conf
	$(ROMFSINST) /etc_ro/ad.hosts
