#!/bin/bash -x

# initialize_db:
python manage.py reset_db --noinput
python manage.py syncdb --noinput
python manage.py loaddata initial.json
python manage.py import_prod_versions
schematic --fake src/olympia/migrations/

# update_assets:
make update_assets

#populate_data:
make populate_data
