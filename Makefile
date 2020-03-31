PROJECT_PATH=./
PROJECT_EXTENSION=.xcodeproj
WORKSPACE_EXTENSION=.xcworkspace
PROJECT_NAME=`find $(PROJECT_PATH) -maxdepth 1 -mindepth 1 -iname "*$(PROJECT_EXTENSION)" | xargs -L 1 -I {} basename "{}" $(PROJECT_EXTENSION)`
PROJECT=$(PROJECT_PATH)$(PROJECT_NAME)$(PROJECT_EXTENSION)
WORKSPACE=$(PROJECT_PATH)$(PROJECT_NAME)$(WORKSPACE_EXTENSION)
SWIFT_CMD=swift
XCODE_VERSION=`cat $(PROJECT_PATH).xcode-version`

.PHONY: all
all: config select install generate install

.PHONY: clean
clean: clean-build-cache
clean--force: clean remove
clean-build-cache:
	@sh scripts/general/xcode/clean-build-cache.sh
.PHONY: remove
remove: remove-derived-data remove-xcodeproj remove-mints remove-pods
remove-derived-data:
	@sh scripts/general/xcode/remove-derived-data.sh
remove-xcodeproj:
	@sh scripts/general/xcodegen/remove-xcodeproj.sh $(PROJECT)
	@sh scripts/general/xcodegen/remove-xcodeproj.sh $(WORKSPACE)
remove-mints:
	@sh scripts/general/mint/remove-mints.sh
remove-pods:
	@sh scripts/general/cocoapods/remove-pods.sh

.PHONY: config
config: config-git-hook
config-git-hook:
	@sh scripts/general/xcodegen/configure-git-hooks.sh

.PHONY: select
select: select-xcode-version
select-xcode-version:
	@sh scripts/general/xcversion/select-xcode-version.sh $(XCODE_VERSION)
	@export DEVELOPER_DIR=`xcode-select --print-path`

.PHONY: install
install: install-mint install-gems install-carthage
install-mint:
	@sh scripts/general/mint/mint-install.sh
install-gems:
	@sh scripts/general/ruby/bundle-install.sh
install-carthage:
	@sh scripts/general/carthage/carthage-install.sh

.PHONY: generate
generate: generate-sourcery generate-xcodeproj
generate-sourcery:
	@sh scripts/general/sourcery/generate-sourcery.sh
generate-xcodeproj:
	@sh scripts/general/xcodegen/generate-xcodeproj.sh

.PHONY: open
open:
	@sh scripts/general/xcode/open-xcode.sh

.PHONY: build
release:
	$(SWIFT_CMD) build --disable-sandbox -c release -Xswiftc -static-stdlib

.PHONY: @build
build:
	@$(SWIFT_CMD) build
