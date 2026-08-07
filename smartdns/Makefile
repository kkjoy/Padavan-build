THISDIR := $(shell pwd)


all: 
	@echo "smartdns build ok!"
	curl -k -o smartdns https://github.com/pymumu/smartdns/releases/download/Release48.4/smartdns-mipsel

clean:
	@echo "smartdns clean ok!"

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/smartdns /usr/bin/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /usr/bin/smartdns.sh
	$(ROMFSINST) /etc_ro/smartdns_custom.conf
	$(ROMFSINST) /etc_ro/ad.hosts
