#!/bin/sh
while ! nc -z db 5432; do
  sleep 0.1
done

bin/rails db:exists && rake db:migrate || rake db:setup