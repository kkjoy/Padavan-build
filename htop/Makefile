SRC_NAME = htop-3.5.2
SRC_URL = https://github.com/htop-dev/htop/releases/download/3.5.2/htop-3.5.2.tar.xz
THISDIR = $(shell pwd)

all: download_test extract_test config_test
	$(MAKE) -C $(SRC_NAME)

download_test:
	( if [ ! -f $(SRC_NAME).tar.xz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.xz $(SRC_URL); \
	fi )

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		tar xf $(SRC_NAME).tar.xz ; \
	fi )

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		cd $(SRC_NAME) && ./autogen.sh && ./configure --prefix=/usr && cd .. ; \
		touch config_done; \
	fi )

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi ;
	rm -f config_done

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/htop /usr/bin/htop