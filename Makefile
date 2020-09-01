BUNDLE  := com.officialscheduler.mterminal
VERSION := 1.5-2
SED     := gsed

.PHONY: all clean

all: clean
	xcodebuild clean build CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=NO PRODUCT_BUNDLE_IDENTIFIER="$(BUNDLE)" -sdk iphoneos -scheme MTerminal -configuration Release -derivedDataPath .build
	mkdir -p .build/mterminal_$(VERSION)_iphoneos-arm/{Applications,DEBIAN}
	cp -a .build/Build/Products/Release-iphoneos/MTerminal.app .build/mterminal_${VERSION}_iphoneos-arm/Applications
	ldid -SResources/entitlements.xml .build/mterminal_${VERSION}_iphoneos-arm/Applications/MTerminal.app
	cp Resources/control .build/mterminal_${VERSION}_iphoneos-arm/DEBIAN
	$(SED) -i 's/@VERSION@/$(VERSION)/' .build/mterminal_${VERSION}_iphoneos-arm/DEBIAN/control
	dpkg-deb -b .build/mterminal_${VERSION}_iphoneos-arm && mv .build/mterminal_${VERSION}_iphoneos-arm.deb .

clean:
	rm -rf .build
