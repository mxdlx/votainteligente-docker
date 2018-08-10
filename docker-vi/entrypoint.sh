#!/bin/bash

if [ ! -f /code/requirements.txt ]; then
  git clone --depth 1 https://github.com/ciudadanointeligente/votainteligente-portal-electoral /code

  # Fixes
  sed -i 's#127\.0\.0\.1:9200#elastic:9200#g' /code/votainteligente/settings.py
  echo "CONSTANCE_REDIS_CONNECTION = { 'host': 'redis', 'port': 6379, 'db': 0, }" >> /code/votainteligente/settings.py

  # Django manage
  cd /code && python manage.py migrate
  cd /code && python manage.py compilescss
  cd /code && python manage.py loaddata example_data.yaml

  # No conocemos el password del admin en example_data.yaml asi que tenemos que cambiarlo
  cd /code && echo "from django.contrib.auth import get_user_model; User = get_user_model(); usr = User.objects.get(username='admin'); usr.set_password('admin'); usr.save()" | python manage.py shell
fi
  
cd /code && python manage.py runserver 0.0.0.0:8000 --verbosity 3
