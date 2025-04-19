SRC_NAME = smartdns-Release46.1
SRC_URL = https://codeload.github.com/pymumu/smartdns/tar.gz/refs/tags/Release46.1
THISDIR = $(shell pwd)

all: download_test extract_test config_test
	$(MAKE) -C $(SRC_NAME)
	
download_test:
	( if [ ! -f $(SRC_NAME).tar.gz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.gz $(SRC_URL); \
	fi )
	
extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		tar zxf $(SRC_NAME).tar.gz ; \
	fi )

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		touch config_done; \
	fi )

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi ; \
	rm -f config_done

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/src/smartdns /usr/bin/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /usr/bin/smartdns.sh
	$(ROMFSINST) /etc_ro/smartdns_custom.conf
	$(ROMFSINST) /etc_ro/ad.hosts
