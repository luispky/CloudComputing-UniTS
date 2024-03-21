#!/bin/bash

container_name="nextcloud"

# Enable encryption app
docker exec -u 33 -it ${container_name} php -f /var/www/html/occ app:enable encryption

# Enable data-at-rest encryption
docker exec -u 33 -it ${container_name} php -f /var/www/html/occ encryption:enable

# Set password policy
# Set minimum password length
docker exec -u www-data ${container_name} php occ config:app:set password_policy minLength --value="11"
# Forbid common passwords
docker exec --user www-data ${container_name} php occ config:app:set password_policy forbidCommonPasswords --value='true'
# Enforce numeric characters
docker exec --user www-data ${container_name} php occ config:app:set password_policy enforceNumericCharacters --value='true'
# Enforce special characters
docker exec --user www-data ${container_name} php occ config:app:set password_policy enforceSpecialCharacters --value='true'

# Number of login attempts before the user account is blocked
docker exec --user www-data ${container_name} php occ config:app:set brute_force_protection max_retries --value='5'

# Set trusted domain
docker exec --user www-data ${container_name} /var/www/html/occ config:system:set trusted_domains 1 --value=nextcloud

# Set the quota for all users
docker exec --user www-data ${container_name} php occ config:app:set files default_quota --value '3 GB'

