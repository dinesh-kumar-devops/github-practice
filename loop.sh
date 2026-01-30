#!/bin/bash

# Alarm time (24-hour format)
ALARM_HOUR=5
ALARM_MIN=30

# Current time (epoch)
NOW=$(date +%s)

# Alarm time (today)
ALARM_TIME=$(date -d "today $ALARM_HOUR:$ALARM_MIN" +%s)

# If alarm time already passed, set it for tomorrow
if [ "$ALARM_TIME" -le "$NOW" ]; then
  ALARM_TIME=$(date -d "tomorrow $ALARM_HOUR:$ALARM_MIN" +%s)
fi

# Calculate wait time
SLEEP_SECONDS=$((ALARM_TIME - NOW))

echo "⏰ Alarm set for 5:30 AM..."
sleep $SLEEP_SECONDS

echo "🔔 WAKE UP! It's 5:30 AM 🔔"

# Ring alarm sound
for i in {1..5}; do
  echo -e "\a"
  sleep 1
done
