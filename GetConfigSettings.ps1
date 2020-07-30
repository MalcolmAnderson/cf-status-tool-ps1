# take parameter for name (cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 in this case)
# Echo out application name (parameter)
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern level
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern Auto-Scaling
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern ENABLE_OAUTH:
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern oauthServer.basicAuth.username
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern GIT_BRANCH:
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern CONFIG_PROFILE:
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern CONFIG_LABEL:
cf env prod-dal-mbrshp-bff-ebssbff-5-2-43 | Select-String -pattern CONFIG_LABEL:
#Echo out a new line


