### Makefile --- 

## Author: shell@shell-deb.shdiv.qizhitech.com
## Version: $Id: Makefile,v 0.0 2012/07/24 09:55:17 shell Exp $
## Keywords: 
## X-URL: 

GUILE_LIST=L1.2.2.go L2.3.2.go L2.3.4.go P2.06.go P2.07.go P2.08.go P2.11.go P2.12.go P2.14.go P2.16.go P2.17.go P2.18.go P2.19.go P2.20.go P2.27.go P2.28.go P2.29.go P2.32.go P2.34.go P2.35.go P2.36.go P2.38.go P2.39.go P2.40.go P2.41.go P2.42.go
# P3.50.go P3.51.go P3.52.go

RACKET_LIST=L1.2.2.ra L2.3.2.ra P2.06.ra P2.07.ra P2.08.ra P2.12.ra P2.14.ra P2.16.ra P2.17.ra P2.18.ra P2.19.ra P2.20.ra P2.27.ra P2.28.ra P2.29.ra P2.32.ra P2.34.ra P2.35.ra P2.36.ra P2.38.ra P2.40.ra P2.42.ra P3.50.ra P3.51.ra P3.52.ra
# L2.3.4.ra P2.11.ra P2.39.ra P2.41.ra

all: $(GUILE_LIST) $(RACKET_LIST)

%.go: %.scm
	guile $^

%.ra: %.scm
	racket -r $^

### Makefile ends here
