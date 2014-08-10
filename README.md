Usage
----------------------

To start the web server, ```vagrant up``` and then go to http://localhost:4567

Architecture
----------------------

###web server
Thin was used as a web server because it's by default supported in
Sinatra as a rack server, and provides built-in PID management. Thin
runs on port 3000 in the Vagrant environment, which Vagrant then maps to
port 4567 on localhost.

### process monitoring
Monit is used to launch/restart thin by checking tmp/pids/thin.pid

### request log parsing
scripts/parse_request_log.rb runs every 5 minutes as a cronjob.
A basic CSV is created and appended to in tmp/error_codes.csv in the format 
```period_start_time,period_end_time,http_error_code,period_occurances```.
The time format is ```%Y%m%dT%H%M```

Requirements
----------------------

- VirtualBox >= 4.2.10
- Vagrant >= 1.6.3
- Ruby >= 2.0.0-p247
