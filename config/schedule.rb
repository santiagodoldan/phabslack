every :weekday, at: ['06:00', '10:00', '14:00'] do
  rake :notify_phabricator_status
end
