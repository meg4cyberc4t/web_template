.PHONY: fix get upgrade upgrade-major localizations outdated dependencies dependencies-full build regen-logo

# Fixing errors in the code using dart fix and applying fixes
fix:
	@fvm dart fix --apply

# Installing project dependencies using pub get
get:
	@fvm dart pub get

# Updating project dependencies to the latest versions using pub upgrade
upgrade:
	@fvm dart pub upgrade

# Updating all major versions of project dependencies using pub upgrade --major-versions
upgrade-major:
	@fvm dart pub upgrade --major-versions

# Generation of localization files
localizations: 
	@fvm dart run intl_utils:generate

# Displaying a list of outdated dependencies using pub outdated
outdated: get
	@fvm dart pub outdated

# Checking project dependencies using pub deps
dependencies: upgrade
	@fvm dart pub deps

# Displaying complete information about project dependencies using pub outdated
dependencies-full: upgrade
	@fvm dart pub outdated --dependency-overrides --dev-dependencies --prereleases --show-all --transitive

# Building a project using build_runner
build: get
	@fvm dart run build_runner build --delete-conflicting-outputs --verbose

# Building apk, app bundle and ipa files for an application with setting ENVIRONMENT variable ENVIRONMENT=PRODUCTION
app:
	@fvm flutter build apk --dart-define-from-file=production.json config/production.json --flavor production
	@fvm flutter build appbundle --dart-define-from-file=production.json config/production.json --flavor production
	@fvm flutter build ipa --dart-define-from-file=production.json config/production.json --flavor production --no-codesign