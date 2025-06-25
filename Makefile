.PHONY: doctor

# Check your setup for problems
doctor:
	@if [ "$(OS)" = "Windows_NT" ]; then \
		powershell -File ./scripts/windows/doctor.ps1; \
	else \
		UNAME_S=$$(uname -s); \
		if [ "$$UNAME_S" = "Linux" ] || [ "$$UNAME_S" = "Darwin" ]; then \
			bash ./scripts/linux/doctor.sh; \
		else \
			echo "Unsupported operating system: $$UNAME_S" >&2; \
			exit 1; \
		fi; \
	fi

# Setup your environment for development
setup:
	@if [ "$(OS)" = "Windows_NT" ]; then \
		powershell -File ./scripts/windows/setup.ps1; \
	else \
		UNAME_S=$$(uname -s); \
		if [ "$$UNAME_S" = "Linux" ] || [ "$$UNAME_S" = "Darwin" ]; then \
			bash ./scripts/linux/setup.sh; \
		else \
			echo "Unsupported operating system: $$UNAME_S" >&2; \
			exit 1; \
		fi; \
	fi

# Install dependencies
install:
	pnpm install

# Build all the code
build:
	pnpm exec turbo run build

# Start the local infrastructure needed to run the bot
local-infra-up:
	pnpm exec turbo run infra:local:start

# Stop the local infrastructure needed to run the bot
local-infra-down:
	pnpm exec turbo run infra:local:stop

# Run the applications
dev:
	pnpm exec turbo run dev

# Migrate discord slash commands to the lastest version
migrate-discord:
	pnpm exec turbo run migrate:discord
