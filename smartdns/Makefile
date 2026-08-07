SRC_NAME = smartdns
VERSION = Release48.4
ARCH = mipsel
BIN_NAME = smartdns-$(ARCH)
SRC_URL = https://github.com/pymumu/smartdns/releases/download/$(VERSION)/$(BIN_NAME)
THISDIR = $(shell pwd)

all: download_test config_test
	@echo "smartdns binary ready"
	
download_test:
	( if [ ! -f $(BIN_NAME) ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(BIN_NAME) $(SRC_URL); \
		chmod +x $(BIN_NAME); \
	fi )
	
config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		touch config_done; \
	fi )

clean:
	rm -f $(BIN_NAME)
	rm -f config_done

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/smartdns /usr/bin/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /usr/bin/smartdns.sh
	$(ROMFSINST) /etc_ro/smartdns_custom.conf
	$(ROMFSINST) /etc_ro/ad.hosts
