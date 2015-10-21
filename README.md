# phabslack

## Phabricator
  1. Copia el archivo config/slack.phabricator.yml y crea uno nuevo config/phabricator.yml.
  2. Visita https://your-phab-domain.com/settings/panel/conduit/.
  3. Copia el Certificate y pegalo en el archivo config/phabricator.yml

## Slack
  1. Copia el archivo config/slack.sample.yml y crea uno nuevo config/slack.yml.
  2. Visita https://your-team.slack.com/services y crea un nuevo **Incoming WebHooks** bot.
  3. Utiliza el contenido de **Webhook URL** en el nuevo archivo config/slack.yml.
