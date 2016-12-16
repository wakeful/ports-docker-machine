# Created by: Adrian Jaskuła <aj@laatu.uk>
# $FreeBSD$

PORTNAME=	docker-machine
PORTVERSION=	20161216
CATEGORIES=	sysutils

MAINTAINER=	aj@laatu.uk
COMMENT=	Machine management for a container-centric world

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/bin/go:lang/go

USES=	gmake

USE_GITHUB=	yes
GH_ACCOUNT=	docker
GH_PROJECT=	machine
GH_TAGNAME=	v0.9.0-rc2
GH_SUBDIR=	src/github.com/${GH_ACCOUNT}/${GH_PROJECT}

STRIP=

PLIST_FILES=	bin/docker-machine

post-extract:
	@${MV} ${WRKSRC}/vendor/ ${WRKSRC}/src/

do-build:
	@cd ${WRKSRC}/src/github.com/${GH_ACCOUNT}/${GH_PROJECT}; ${SETENV} GOPATH=${WRKSRC} ${GMAKE} build

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/docker-machine ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>